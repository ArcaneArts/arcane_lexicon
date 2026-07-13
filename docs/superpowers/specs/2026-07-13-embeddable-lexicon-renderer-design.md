# Embeddable Lexicon Renderer — Design

Date: 2026-07-13
Status: Approved (design); pending implementation plan

## Goal

Make arcane_lexicon's full rendering capability embeddable as a component. Any Jaspr app (server-rendered or compiled to the browser) can render a markdown string — for example a user-authored post — through the complete lexicon pipeline: rich components, callouts, media embeds, code highlighting, heading anchors, TOC data, reading time. The existing documentation-site generator keeps working and consumes the exact same pipeline, so there is one source of truth.

Primary consumer: another arcane_jaspr app with a post system whose current plain-text renderer will be replaced by `LexiconRenderer`.

## Requirements

- **Runtime-agnostic.** The renderer must compile both server-side and to JS for the browser (live post preview, dynamic feeds). No `dart:io`, no `package:jaspr/server.dart`, no `jaspr_content` in its import graph.
- **Configurable trust policy.** Posts are user-generated content. Callers choose what capability the content gets: raw HTML, component set, embed providers. Trusted contexts (docs sites) keep full capability.
- **Single pipeline.** The site generator (`KnowledgeBaseApp`) and the embeddable renderer share one parse/transform/build implementation. No drift between what a post preview shows and what a published page renders.
- **No backwards compatibility.** Breaking changes are made directly; no shims, aliases, or re-exports of old shapes.

## Constraints discovered during design

- Everything in `jaspr_content` except the `Content` widget transitively imports `package:jaspr/server.dart` and `package:watcher` (which requires `dart:io`). Verified by import-graph analysis of jaspr_content 0.5.2. Its `MarkdownParser`, `NodesBuilder`, `PageExtension`, and `CustomComponent` therefore cannot compile to the browser. The server-coupling of the parser core is solely the `Page` parameter type; the parsing logic itself (~360 lines across `page_parser.dart`, `markdown_parser.dart`, `html_parser.dart`) uses only `jaspr/dom.dart`, `package:markdown`, and `package:html`.
- All 34 components in `lib/src/components/rich_markdown_components.dart` use only the `Pattern get pattern` + `Component apply(String name, Map<String, String> attributes, Component? child)` contract. None touch `Page`, page data, nodes, or `dart:io`. The single exception in `KBRichMarkdownComponents.defaults()` is the `Tabs` component imported from `package:jaspr_content/components/tabs.dart`, which is transitively server-only.
- arcane_jaspr is client-safe. Its only server imports are behind a correct conditional import (`document_stub.dart` / `document_server.dart` / `document_web.dart`) and an unreferenced demo-runner tool.
- `KBStyles.generate()` (`lib/src/styles/kb_styles.dart`, 2750 lines) interpolates 35 named `static const String` sections; roughly 60% is content styling and 40% page chrome. Splitting content CSS from chrome CSS is a regrouping of existing consts (only `_chromeStyles` needs sub-splitting).
- `KBScripts` (`lib/src/scripts/kb_scripts.dart`) already separates one-time chrome init (document-level event delegation, guarded by `window.__kbGlobalInitialized`) from re-runnable page behaviors exposed as `window.__kbInitializePage` (code copy, syntax highlighting, media embed init, and others). Soft navigation already re-invokes `__kbInitializePage` after swapping content, which is exactly the pattern client-side embedding needs.
- `MediaExtension` is a raw-string preprocessor (rewrites `page.content` before parsing); `CalloutExtension` is a node transformer; `ReadingTimeExtension` annotates page data. A standalone pipeline must model both the string phase and the node phase explicitly, in that order.
- Raw HTML in markdown becomes structured `ElementNode`s via `package:html` tokenization at two parse-time branches (block `HtmlText`, inline `parseFragment`). After parsing, author HTML is indistinguishable from markdown-generated elements, so HTML policy enforcement must happen at those branches, not post-parse.

## Architecture

### 1. Package shape

- New public entrypoint: **`lib/renderer.dart`** — exports the render core, the component set, the policy types, and the asset helpers. Its transitive import graph contains no `dart:io`, no `jaspr_content`, no `jaspr/server.dart`.
- `lib/arcane_lexicon.dart` (existing barrel) continues to export everything: site generator plus the render core.
- Internal layout of `lib/src/`:
  - `render/` — client-safe core: node model, parser, builder, contracts, policy, `LexiconRenderer` widget, `LexiconEngine`, assets.
  - `components/` — the KB component set (already client-safe; base class swapped).
  - `extensions/` — reworked to the new contracts (client-safe).
  - Site machinery (`app/`, `navigation/`, `layout/`, `cli/`, plus the jaspr_content adapters) remains server-only.
- New direct dependencies in `pubspec.yaml`: `markdown`, `html` (currently transitive via jaspr_content).
- CI guardrail: a test asserts that `renderer.dart`'s transitive import graph contains no `dart:io`, `package:watcher`, `package:jaspr/server.dart`, or `package:jaspr_content`.

### 2. Render core

Own node model and contracts, `Lexicon`-prefixed to avoid clashes with re-exported jaspr_content names in the main barrel:

```dart
sealed class LexiconNode {}
final class LexiconTextNode extends LexiconNode {
  final String text;
  final bool raw;
}
final class LexiconElementNode extends LexiconNode {
  final String tag;
  final Map<String, String> attributes;
  final List<LexiconNode>? children;
}
final class LexiconComponentNode extends LexiconNode {
  final Component component;
}

abstract class LexiconComponentBase {
  Pattern get pattern;
  Component apply(String name, Map<String, String> attributes, Component? child);
}

abstract class LexiconPreprocessor {
  String transform(String source);
}

abstract class LexiconNodeTransformer {
  List<LexiconNode> transform(List<LexiconNode> nodes);
}
```

Pipeline order (fixes the phase-ordering trap):

1. **Preprocessors** run on the raw markdown string (media embed syntax).
2. **Parse** with `package:markdown` using `ExtensionSet.gitHubWeb` plus a port of `JasprHtmlBlockSyntax` (raw HTML blocks pass through verbatim; tokenized with `lowercaseElementName: false` so `<Card>` keeps its PascalCase and matches component patterns; heading IDs generated by `HeaderWithId`).
3. **Node transformers** run on the `LexiconNode` tree (callouts, heading anchors, TOC collection).
4. **Build**: `LexiconNodesBuilder` walks the tree; first matching policy-permitted component wins; otherwise text nodes render escaped (or `RawText` when `raw` and permitted), element nodes render as `Component.element`.

Two API levels:

```dart
/// Drop-in widget.
class LexiconRenderer extends StatelessComponent {
  const LexiconRenderer(
    this.source, {
    this.policy = const LexiconPolicy.trusted(),
    this.components,       // defaults to the full KB set
    this.preprocessors,    // defaults: media
    this.transformers,     // defaults: callouts, heading anchors
  });
}

/// For hosts that want metadata too.
class LexiconEngine {
  const LexiconEngine({LexiconPolicy policy, List<LexiconComponentBase> components, ...});
  LexiconRenderResult render(String source);
}

class LexiconRenderResult {
  final Component content;
  final List<TocEntry> toc;      // arcane_jaspr TocEntry
  final int readingTimeMinutes;
  final int wordCount;
}
```

Component migration: all 34 KB components change base class from jaspr_content's `CustomComponentBase` to `LexiconComponentBase` (identical signature; mechanical). The jaspr_content `Tabs` component is replaced with a native implementation built on arcane_jaspr's tabs widget, emitting markup compatible with existing KB styles and scripts.

Heading anchors and TOC collection are implemented as our own node transformers (jaspr_content's versions are server-only and router-coupled). Anchor links emit plain `#id` hrefs — equivalent in browsers, no router dependency.

### 3. Trust policy

```dart
class LexiconPolicy {
  final bool allowRawHtml;
  final Set<String>? allowedHtmlTags;        // when raw HTML restricted
  final bool Function(String tag, String attribute, String value)? attributeFilter;
  final Set<String>? componentAllowlist;     // null = all registered components
  final Set<String> allowedEmbedProviders;   // youtube, video, image, gif, apng, twitter, iframe

  const LexiconPolicy.trusted();  // everything, as today
  const LexiconPolicy.post();     // safe UGC subset, defined as:
                                  //   allowRawHtml: false, allowedHtmlTags: {} (markdown and
                                  //   components cover formatting), all components allowed,
                                  //   allowedEmbedProviders: {youtube, video, image, gif, apng}
                                  //   (no iframe, no twitter script embed)
  const LexiconPolicy({...});     // every knob explicit
}
```

Under any restricted policy (`allowRawHtml: false` or a non-null `attributeFilter`), `on*` attributes and `javascript:`/`data:` URLs in `href`/`src` are always stripped, regardless of other settings.

The default component set is instantiated per engine with the policy injected — this is how attribute-dependent enforcement reaches components: `KBMedia` receives `allowedEmbedProviders` through its constructor.

Enforcement points:

- **Parse-time HTML branches** (block `HtmlText` tokenization and inline HTML fragments): when `allowRawHtml` is false, author HTML renders as escaped visible text unless the tag passes `allowedHtmlTags`; surviving elements pass through `attributeFilter`, which under any restricted policy always drops `on*` attributes and `javascript:`/`data:` URLs in `href`/`src`.
- **Component registry**: `LexiconNodesBuilder` skips components not in `componentAllowlist`. A disallowed component tag degrades gracefully — its children render, the wrapper is dropped.
- **Raw text path**: `LexiconTextNode(raw: true)` (HTML comments) renders escaped when raw HTML is disallowed.
- **Embeds**: provider allowlist enforced by the `KBMedia` component (section 4), not by string filtering.

### 4. Media embeds become a component

Today `MediaExtension` rewrites `@[youtube](url)` into raw iframe/figure HTML inside the source string, which then depends on the raw-HTML parse path — incompatible with a restrictive policy. Instead:

- The media **preprocessor** rewrites `@[type](src)` into a component tag: `<KBMedia type="youtube" src="..."/>`.
- A new **`KBMedia`** component renders the same `.kb-media-*` markup the CSS and `_mediaEmbeds()` script already expect, including the `data-kb-src`/`data-kb-fallback-src` YouTube nocookie handling.
- Provider allowlisting lives in `KBMedia` via the active policy. Author-typed raw `<iframe>` is stripped under `post()` policy, while `@[youtube]` keeps working, because only the trusted component emits iframes.

This applies to both the embed path and the site path (same pipeline), so site behavior is preserved by construction: same markup, same scripts.

### 5. Host assets (CSS/JS)

- `KBStyles` gains `static String content()` and `static String chrome()` by regrouping the existing 35 const sections; `generate()` returns both and the site is unchanged. `_chromeStyles` is sub-split where it mixes shell and widget styling.
- `KBScripts` gains a content-only generator covering the re-runnable page behaviors (code copy, syntax highlighting, media embed init) and excluding chrome (search, sidebar, theme toggle, soft navigation).
- New client-safe **`LexiconAssets`**:
  - `LexiconAssets()` — a component that injects the content `<style>` and `<script>` exactly once (idempotent guard), for drop-in hosts.
  - `LexiconAssets.styles()` / `LexiconAssets.script()` — raw strings for hosts that manage their own `<head>`.
- Visual theming comes from the host app's own `ArcaneStylesheet`/theme provider, exactly as it does for the site today. `LexiconAssets` carries only the structural KB content CSS.
- On the client, `LexiconRenderer` invokes `window.__kbInitializePage()` after mounting/updating so behaviors bind to freshly rendered DOM. Idempotency guards of each page script are audited so repeated invocation never double-binds (the copy-button script already guards; the others are verified and fixed as needed).

### 6. Site generator consumes the same pipeline

- New server-only **`LexiconPageParser implements PageParser`** plugs into `ContentApp` (the existing seam at `_contentApp` in `lib/src/app/knowledge_base_app.dart`). It runs the full arcane-owned pipeline (preprocessors, parse, transformers) and converts `LexiconNode`s to jaspr_content nodes one-to-one for the layout machinery.
- jaspr_content's `HeadingAnchorsExtension` and `TableOfContentsExtension` are dropped; our transformers replace them. Reading time comes from the engine result. Adapters surface TOC and reading time through `page.data` for `KBLayout`.
- `KnowledgeBaseApp.create` / `createSync` parameter types change: `extensions:` becomes the new contracts (`List<LexiconPreprocessor>`, `List<LexiconNodeTransformer>`), `components:` becomes `List<LexiconComponentBase>`. Direct breaking change; no compatibility layer.
- `KnowledgeBaseRenderData.toc` changes from jaspr_content's `TableOfContents` to `List<TocEntry>` (arcane_jaspr); `DefaultKnowledgeBaseRenderers.tableOfContents` builds `ArcaneToc` from entries directly. The barrel keeps hiding jaspr_content's `TableOfContents`/`TocEntry`; the public `TocEntry` is arcane_jaspr's, everywhere.
- `KBLayout`, navigation, search indexing, and the CLI are untouched in behavior; the site remains server-only, which is fine.

### 7. Error handling and edge behavior

- Malformed markdown never throws; `package:markdown` is forgiving by design.
- Unknown (unregistered) PascalCase tags behave as today: emitted as unknown elements whose children render.
- Disallowed components: children render, wrapper dropped. Disallowed raw HTML: escaped, visible as text — user sees what was rejected rather than silent loss.
- Empty source renders an empty fragment.
- `LexiconRenderer` is a plain widget: no global state, no initialization requirements beyond `LexiconAssets` being present once in the page.

### 8. Testing and verification

- **Parser port unit tests** against fixtures: heading IDs, setext headings, tables, task lists, fenced code, strikethrough, autolinks, footnotes, alert blocks, PascalCase component tags (block and inline), nested components, HTML comments, self-closing tags.
- **Policy tests** with hostile fixtures: `<script>`, `on*` handler attributes, `javascript:` and `data:` URLs, raw iframes, disallowed components, embed provider restrictions — asserting escaped/stripped output under `post()` and full passthrough under `trusted()`.
- **Parity test**: render the example content through the site pipeline and through `LexiconEngine`; normalized content-area HTML must be identical.
- **Client-safety guardrail**: import-graph test on `renderer.dart` (section 1).
- **Example demo**: a post-composer page in `example/` — a client-side island with a textarea live-previewing through `LexiconRenderer(policy: LexiconPolicy.post())` — proving browser compilation, dynamic mounting, and script re-initialization.
- **Browser verification** with Playwright against the running example: type markdown containing components/callouts/embeds, verify rendered output, verify the copy button works on a dynamically mounted code block, verify a `<script>` injection attempt renders inert.
- CHANGELOG: entries appended under `x.x.x`.

## Breaking changes (deliberate)

- `KnowledgeBaseApp.create` / `createSync` extension and component parameter types.
- Media embeds route through the `KBMedia` component instead of raw HTML injection (same rendered markup).
- jaspr_content's `Tabs` replaced by a native implementation.
- `KnowledgeBaseRenderData.toc` type changes to arcane_jaspr `TocEntry` list.

Site output is expected to be visually identical after all changes; the parity test and browser verification confirm it.

## Out of scope

- Flutter rendering (this is Jaspr/HTML only).
- A hosted render service or server round-trip preview.
- Search indexing for embedded content.
- Sanitization of content fetched from remote embeds (iframes are provider-allowlisted, not content-inspected).
