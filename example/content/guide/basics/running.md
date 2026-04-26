---
title: Running
description: Start the development server
icon: play
order: 3
author: Arcane Arts
date: 2025-01-11
---

## Development

```bash
cd your-project
dart ../tool/arcane_lexicon_demo.dart
```

Visit http://localhost:8081

## Production Build

```bash
jaspr build
```

## With Base URL

For subdirectory hosting (e.g., GitHub Pages):

```bash
jaspr build --define=BASE_URL=/my-docs
```

---

This is the last page in the Basics section. The **Previous** button takes you back to Configuration.
