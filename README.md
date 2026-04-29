# Arcane Lexicon

Transform markdown directories into documentation sites with Jaspr + Arcane stylesheets.

**[Live Demo](https://arcanearts.github.io/arcane_lexicon/)** | **[GitHub](https://github.com/ArcaneArts/arcane_lexicon)**

## Quick Start

```dart
import 'package:arcane_jaspr_neon/arcane_jaspr_neon.dart';
import 'package:arcane_jaspr_neubrutalism/arcane_jaspr_neubrutalism.dart';
import 'package:arcane_jaspr_shadcn/arcane_jaspr_shadcn.dart';
import 'package:arcane_lexicon/arcane_lexicon.dart' hide runApp;

const ArcaneStylesheet shadcnStylesheet = ShadcnStylesheet(
  theme: ShadcnTheme.charcoal,
);
const ArcaneStylesheet neonStylesheet = NeonStylesheet(
  theme: NeonTheme.green,
);
const ArcaneStylesheet neubrutalismStylesheet = NeubrutalismStylesheet(
  theme: NeubrutalismTheme.yellow,
);
const ArcaneStylesheet selectedStylesheet = shadcnStylesheet;

void main() async {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    await KnowledgeBaseApp.create(
      config: const SiteConfig(
        name: 'My Docs',
        contentDirectory: 'content',
      ),
      stylesheet: selectedStylesheet,
    ),
  );
}
```

## What Ships by Default

- Generated nav from markdown folders/files.
- Sidebar + top/bottom navigation bar modes.
- Breadcrumbs and footer prev/next navigation.
- GitHub-style callout syntax with optional title.
- Media embed syntax (`@[youtube]`, `@[video]`, `@[image]`, etc.).
- Highlight.js code blocks with copy buttons.
- Reading time + metadata row.
- Optional build-time `web/search-index.json` generation.

## Default Rich Markdown Components

Registered through `KBRichMarkdownComponents.defaults()`:

- `CardGroup`, `Card`
- `Columns`, `Column`
- `Tiles`, `Tile`
- `Steps`, `Step`
- `AccordionGroup`, `Accordion`, `Expandable`
- `Badge`, `Banner`, `Panel`, `Frame`, `Update`
- `Tooltip`, `Icon`, `CodeGroup`
- `FieldGroup`, `ParamField`, `ResponseField`
- `Tree`, `Tree.Folder`, `Tree.File`
- `Color`, `Color.Item`
- `View`
- `Note`, `Tip`, `Warning`, `Info`, `Check`, `Caution`, `Important`
- `Tabs`, `TabItem`

## Page Frontmatter

```yaml
---
layout: kb
title: Installation
description: How to install
icon: download
order: 1
tags:
  - setup
author: Arcane Arts
date: 2026-03-03
pageNav: true
component: ExampleDemo
draft: false
hidden: false
---
```

## SiteConfig

```dart
SiteConfig(
  name: 'Site Name',
  contentDirectory: 'content',
  githubUrl: 'https://github.com/...',
  searchEnabled: true,
  tocEnabled: true,
  themeToggleEnabled: true,
  pageNavEnabled: true,
  navigationBarEnabled: true,
  navigationBarPosition: KBNavigationBarPosition.top,
  sidebarWidth: '280px',
  sidebarTreeIndent: '10px',
)
```

## Build

```bash
dart tool/arcane_lexicon_demo.dart
jaspr build
jaspr build --define=BASE_URL=/docs
```

The demo runner serves at `http://localhost:8081` and replaces any previous Arcane Lexicon demo process using that port.

## Package Docs Coverage

Implementation-matching docs and showcases live in:

- `example/content/reference` (API + behavior reference)
- `example/content/features` (visual showcase pages)
- `example/content/guide` (workflow-oriented setup and utility usage)

## Installation

```yaml
dependencies:
  arcane_lexicon:
    git:
      url: https://github.com/ArcaneArts/arcane_lexicon
```

## License

GPL-3.0
