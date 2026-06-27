import 'dart:io';

import 'package:arcane_lexicon/src/cli/arcane_lexicon_cli.dart';

Future<void> main(List<String> args) async {
  exitCode = await const ArcaneLexiconCli().run(args);
}
