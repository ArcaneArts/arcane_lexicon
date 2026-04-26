library;

import 'dart:io';

import 'package:arcane_jaspr_neon/arcane_jaspr_neon.dart';
import 'package:arcane_jaspr_shadcn/arcane_jaspr_shadcn.dart';
import 'package:arcane_lexicon/arcane_lexicon.dart' hide runApp;
import 'package:jaspr/server.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'main.server.options.dart';

const ArcaneStylesheet shadcnStylesheet = ShadcnStylesheet(
  theme: ShadcnTheme.midnight,
);
const ArcaneStylesheet neonStylesheet = NeonStylesheet(
  theme: NeonTheme.green,
);
const ArcaneStylesheet selectedStylesheet = neonStylesheet;
const List<KBStylesheetOption> stylesheetOptions = <KBStylesheetOption>[
  KBStylesheetOption(
    id: 'shadcn',
    label: 'Shadcn',
    stylesheet: shadcnStylesheet,
  ),
  KBStylesheetOption(id: 'neon', label: 'Neon', stylesheet: neonStylesheet),
];

Future<void> main() async {
  Jaspr.initializeApp(options: defaultServerOptions);

  Component app = await KnowledgeBaseApp.create(
    config: const SiteConfig(
      name: 'Example Docs',
      description: 'Arcane Lexicon demo site',
      contentDirectory: 'content',
      githubUrl: 'https://github.com/ArcaneArts/arcane_lexicon',
      themeToggleEnabled: true,
      stylesheetSwitcherEnabled: true,
      showEditLink: true,
      editBranch: 'main',
      navigationBarEnabled: true,
      navigationBarPosition: KBNavigationBarPosition.top,
      headerLinks: <NavLink>[
        NavLink(label: 'Docs', href: '/'),
        NavLink(
          label: 'GitHub',
          href: 'https://github.com/ArcaneArts/arcane_lexicon',
          external: true,
        ),
      ],
      footerText: 'Built with Arcane Lexicon',
      sidebarFooter: 'v1.0.0',
      sidebarFooterUrl: 'https://github.com/ArcaneArts/arcane_lexicon/releases',
    ),
    stylesheet: selectedStylesheet,
    stylesheetOptions: stylesheetOptions,
  );

  if (const bool.fromEnvironment('jaspr.flags.release')) {
    await _serveRelease(app);
    return;
  }

  runApp(app);
}

Future<void> _serveRelease(Component app) async {
  Handler jasprHandler = serveApp((Request request, RenderFunction render) {
    return render(app);
  });
  Handler handler = _releaseHandler(app, jasprHandler);
  int port = int.parse(Platform.environment['PORT'] ?? '8080');
  HttpServer server = await shelf_io.serve(
    handler,
    InternetAddress.anyIPv4,
    port,
    shared: true,
  );

  stdout.writeln('[INFO] Running server in release mode');
  stdout.writeln('Serving at http://${server.address.host}:${server.port}');

  if (const bool.fromEnvironment('jaspr.flags.generate')) {
    await ServerApp.requestRouteGeneration('/');
  }
}

Handler _releaseHandler(Component app, Handler jasprHandler) {
  return (Request request) {
    if (_shouldRenderRoute(request)) {
      return _renderRoute(app, request);
    }
    return jasprHandler(request);
  };
}

bool _shouldRenderRoute(Request request) {
  String path = request.url.path;
  if (path.isEmpty || path.endsWith('/')) {
    return true;
  }

  String segment = request.url.pathSegments.isEmpty
      ? ''
      : request.url.pathSegments.last;
  return !segment.contains('.');
}

Future<Response> _renderRoute(Component app, Request request) async {
  ResponseLike rendered = await renderComponent(app, request: request);
  Map<String, String> headers = <String, String>{};
  for (MapEntry<String, List<String>> entry in rendered.headers.entries) {
    headers[entry.key] = entry.value.join(',');
  }
  return Response(rendered.statusCode, body: rendered.body, headers: headers);
}
