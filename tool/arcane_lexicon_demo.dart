import 'dart:io';

Future<void> main(List<String> args) async {
  ArcaneLexiconDemoRunner runner = ArcaneLexiconDemoRunner(args: args);
  exitCode = await runner.run();
}

class ArcaneLexiconDemoRunner {
  static const int port = 8081;
  static const int webPort = 5468;
  static const int proxyPort = 5568;
  static const int vmServicePort = 8181;

  final List<String> args;

  const ArcaneLexiconDemoRunner({required this.args});

  Future<int> run() async {
    Uri scriptUri = Platform.script;
    File scriptFile = File.fromUri(scriptUri);
    Directory packageRootDirectory = scriptFile.parent.parent;
    Directory demoDirectory = Directory('${packageRootDirectory.path}/example');

    if (!demoDirectory.existsSync()) {
      stderr.writeln(
        'Arcane Lexicon demo directory was not found: ${demoDirectory.path}',
      );
      return 64;
    }

    if (_isKillall) {
      await _DemoProcessCleaner(
        workingDirectory: demoDirectory,
        ports: <int>[port, webPort, proxyPort, vmServicePort],
        commandMarkers: _commandMarkers(scriptFile),
      ).clean();
      return 0;
    }

    List<String> jasprArgs = _jasprArgs;
    if (_isServe(jasprArgs)) {
      await _DemoProcessCleaner(
        workingDirectory: demoDirectory,
        ports: _portsFor(jasprArgs),
        commandMarkers: _commandMarkers(scriptFile),
      ).clean();
    }

    List<String> command = <String>[
      'pub',
      'global',
      'run',
      'jaspr_cli:jaspr',
      ...jasprArgs,
    ];
    Process process = await Process.start(
      Platform.resolvedExecutable,
      command,
      workingDirectory: demoDirectory.path,
      mode: ProcessStartMode.inheritStdio,
    );
    return process.exitCode;
  }

  List<String> get _jasprArgs {
    if (args.isEmpty) {
      return <String>[
        'serve',
        '--release',
        '--port',
        '$port',
        '--web-port',
        '$webPort',
        '--proxy-port',
        '$proxyPort',
      ];
    }

    if (!_isServe(args)) {
      return args;
    }

    return _withServeDefaults(args);
  }

  List<int> _portsFor(List<String> jasprArgs) {
    List<int> ports = <int>[port, webPort, proxyPort];
    if (!jasprArgs.contains('--release')) {
      ports.add(vmServicePort);
    }
    return ports;
  }

  bool get _isKillall => args.isNotEmpty && args.first == 'killall';

  bool _isServe(List<String> jasprArgs) =>
      jasprArgs.isEmpty || jasprArgs.first == 'serve';

  List<String> _withServeDefaults(List<String> jasprArgs) {
    List<String> nextArgs = <String>[...jasprArgs];
    if (!nextArgs.contains('--release') && !nextArgs.contains('--debug')) {
      nextArgs.add('--release');
    }
    if (!_hasOption(nextArgs, '--port')) {
      nextArgs.addAll(<String>['--port', '$port']);
    }
    if (!_hasOption(nextArgs, '--web-port')) {
      nextArgs.addAll(<String>['--web-port', '$webPort']);
    }
    if (!_hasOption(nextArgs, '--proxy-port')) {
      nextArgs.addAll(<String>['--proxy-port', '$proxyPort']);
    }
    return nextArgs;
  }

  bool _hasOption(List<String> values, String option) {
    for (String value in values) {
      if (value == option || value.startsWith('$option=')) {
        return true;
      }
    }
    return false;
  }

  List<String> _commandMarkers(File scriptFile) => <String>[
    scriptFile.path,
    'tool/arcane_lexicon_demo.dart',
    '../tool/arcane_lexicon_demo.dart',
    'arcane_lexicon_demo.dart',
  ];
}

class _DemoProcessCleaner {
  final Directory workingDirectory;
  final List<int> ports;
  final List<String> commandMarkers;

  const _DemoProcessCleaner({
    required this.workingDirectory,
    required this.ports,
    required this.commandMarkers,
  });

  Future<void> clean() async {
    Map<int, _ProcessInfo> processes = await _listProcesses();
    Set<int> protectedPids = _protectedPids(processes);
    Set<int> targetPids = await _targetPids(processes, protectedPids);
    Set<int> expandedPids = _withDescendants(processes, targetPids);
    expandedPids.removeAll(protectedPids);
    await _killPids(processes, expandedPids);
    await Future<void>.delayed(const Duration(milliseconds: 250));
  }

  Future<Map<int, _ProcessInfo>> _listProcesses() async {
    ProcessResult result = await Process.run('ps', <String>[
      '-axo',
      'pid=,ppid=,command=',
    ]);
    Map<int, _ProcessInfo> processes = <int, _ProcessInfo>{};
    if (result.exitCode != 0) {
      return processes;
    }

    List<String> lines = result.stdout.toString().split('\n');
    RegExp rowPattern = RegExp(r'^\s*(\d+)\s+(\d+)\s+(.*)$');
    for (String line in lines) {
      RegExpMatch? match = rowPattern.firstMatch(line);
      if (match == null) {
        continue;
      }
      int? processId = int.tryParse(match.group(1) ?? '');
      int? parentProcessId = int.tryParse(match.group(2) ?? '');
      String command = match.group(3) ?? '';
      if (processId == null || parentProcessId == null) {
        continue;
      }
      processes[processId] = _ProcessInfo(
        pid: processId,
        parentPid: parentProcessId,
        command: command,
      );
    }
    return processes;
  }

  Set<int> _protectedPids(Map<int, _ProcessInfo> processes) {
    Set<int> values = <int>{pid};
    int cursor = pid;
    while (processes.containsKey(cursor)) {
      _ProcessInfo process = processes[cursor]!;
      if (process.parentPid <= 1 || values.contains(process.parentPid)) {
        break;
      }
      values.add(process.parentPid);
      cursor = process.parentPid;
    }
    return values;
  }

  Future<Set<int>> _targetPids(
    Map<int, _ProcessInfo> processes,
    Set<int> protectedPids,
  ) async {
    Set<int> values = <int>{};
    for (int port in ports) {
      values.addAll(await _pidsListeningOn(port));
    }

    for (_ProcessInfo process in processes.values) {
      if (protectedPids.contains(process.pid)) {
        continue;
      }
      if (_isTargetCommand(process.command)) {
        values.add(process.pid);
      }
    }
    values.removeAll(protectedPids);
    return values;
  }

  Future<Set<int>> _pidsListeningOn(int port) async {
    ProcessResult result = await Process.run('lsof', <String>[
      '-tiTCP:$port',
      '-sTCP:LISTEN',
    ]);
    Set<int> values = <int>{};
    if (result.exitCode != 0) {
      return values;
    }

    List<String> pidValues = _splitPids(result.stdout.toString());
    for (String pidValue in pidValues) {
      int? processId = int.tryParse(pidValue);
      if (processId != null) {
        values.add(processId);
      }
    }
    return values;
  }

  bool _isTargetCommand(String command) {
    if (command.contains(
      '${workingDirectory.path}/.dart_tool/jaspr/server_target.dart',
    )) {
      return true;
    }
    if (command.contains(
      '${workingDirectory.path}/.dart_tool/build/entrypoint/build.dart.aot',
    )) {
      return true;
    }
    if (_isJasprServeCommand(command)) {
      return true;
    }
    for (String marker in commandMarkers) {
      if (command.contains(marker)) {
        return true;
      }
    }
    return false;
  }

  bool _isJasprServeCommand(String command) {
    if (!command.contains('jaspr')) {
      return false;
    }
    if (!RegExp(r'(^|\s)serve(\s|$)').hasMatch(command)) {
      return false;
    }
    for (int port in ports) {
      if (command.contains('--port $port') ||
          command.contains('--port=$port')) {
        return true;
      }
    }
    return false;
  }

  Set<int> _withDescendants(
    Map<int, _ProcessInfo> processes,
    Set<int> targetPids,
  ) {
    Set<int> values = <int>{...targetPids};
    bool changed = true;
    while (changed) {
      changed = false;
      for (_ProcessInfo process in processes.values) {
        if (values.contains(process.pid)) {
          continue;
        }
        if (values.contains(process.parentPid)) {
          values.add(process.pid);
          changed = true;
        }
      }
    }
    return values;
  }

  Future<void> _killPids(
    Map<int, _ProcessInfo> processes,
    Set<int> targetPids,
  ) async {
    List<int> orderedPids = targetPids
        .where((int processId) => processId > 1 && processId != pid)
        .toList();
    orderedPids.sort((int left, int right) {
      int rightDepth = _processDepth(processes, right);
      int leftDepth = _processDepth(processes, left);
      return rightDepth.compareTo(leftDepth);
    });

    for (int processId in orderedPids) {
      await Process.run('kill', <String>['-TERM', '$processId']);
    }
    await Future<void>.delayed(const Duration(milliseconds: 300));
    for (int processId in orderedPids) {
      ProcessResult check = await Process.run('kill', <String>[
        '-0',
        '$processId',
      ]);
      if (check.exitCode == 0) {
        await Process.run('kill', <String>['-KILL', '$processId']);
      }
    }
  }

  int _processDepth(Map<int, _ProcessInfo> processes, int processId) {
    int depth = 0;
    int cursor = processId;
    Set<int> seen = <int>{};
    while (processes.containsKey(cursor) && !seen.contains(cursor)) {
      seen.add(cursor);
      _ProcessInfo process = processes[cursor]!;
      cursor = process.parentPid;
      depth++;
    }
    return depth;
  }

  List<String> _splitPids(String output) => output
      .split(RegExp(r'\s+'))
      .where((String value) => value.trim().isNotEmpty)
      .toList();
}

class _ProcessInfo {
  final int pid;
  final int parentPid;
  final String command;

  const _ProcessInfo({
    required this.pid,
    required this.parentPid,
    required this.command,
  });
}
