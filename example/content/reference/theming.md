---
title: Theming
description: Stylesheet configuration and theme customization
icon: sliders
order: 6
tags:
  - configuration
  - theming
  - styling
author: Arcane Arts
date: 2025-01-11
---

Arcane Lexicon uses the arcane_jaspr stylesheet system for theming. Swap themes with a single line of code.

## Basic Usage

```dart
import 'package:arcane_lexicon/arcane_lexicon.dart' hide runApp;

void main() async {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    await KnowledgeBaseApp.create(
      config: const SiteConfig(name: 'My Docs'),
      // Single line theming:
      stylesheet: const ShadcnStylesheet(theme: ShadcnTheme.midnight),
    ),
  );
}
```

## Available Stylesheets

### ShadcnStylesheet

Clean, modern design based on shadcn/ui:
- Rounded corners and minimal shadows
- Border-focused design
- Inter font family
- Multiple color themes

```dart
stylesheet: const ShadcnStylesheet(theme: ShadcnTheme.midnight)
```

### NeonStylesheet

Gamer-inspired design with neon aesthetics:
- OLED-optimized dark backgrounds
- Vibrant neon accent colors
- Glow effects on shadows
- Custom gaming-style fonts

```dart
stylesheet: const NeonStylesheet(theme: NeonTheme.green)
```

### NeubrutalismStylesheet

Comic-book inspired NeuBrutalism aesthetic with bold flat colors:
- Thick black borders (2-4px solid)
- Hard-offset drop shadows (no blur)
- Press-down interaction on `:active` (translate + shadow shrink)
- Pop-art saturated palettes paired with pure black/white
- Archivo Black headings, Space Grotesk body, JetBrains Mono code

```dart
stylesheet: const NeubrutalismStylesheet(theme: NeubrutalismTheme.yellow)
```

## ShadcnTheme Options

### Neutral Themes

These themes use auto-tinted surfaces derived from the primary color:

| Theme | Description |
|-------|-------------|
| `midnight` | OLED black/pure white - maximum contrast |
| `charcoal` | Softer dark with off-black - easier on eyes |
| `cream` | Warm cream/ivory tones |
| `slate` | Cool slate/gray - professional |

### Pastel Themes

Vibrant colored surfaces with matching accents:

| Theme | Description |
|-------|-------------|
| `rose` | Soft rose/pink pastel |
| `lavender` | Soft lavender/purple |
| `mint` | Soft mint/green |
| `sky` | Soft sky/blue |
| `peach` | Soft peach/orange |
| `teal` | Soft teal/cyan |

### Examples

```dart
// OLED-optimized (pure black dark mode)
ShadcnStylesheet(theme: ShadcnTheme.midnight)

// Warm and inviting
ShadcnStylesheet(theme: ShadcnTheme.cream)

// Cool and professional
ShadcnStylesheet(theme: ShadcnTheme.slate)

// Colorful pastel
ShadcnStylesheet(theme: ShadcnTheme.lavender)
```

## NeonTheme Options

Neon accent colors for the Neon stylesheet:

| Theme | Color | Description |
|-------|-------|-------------|
| `green` | `#00f5a0` | Cyan-green neon (default) |
| `red` | `#ef4444` | Bright red |
| `blue` | `#00d9ff` | Electric blue |
| `purple` | `#8b5cf6` | Vibrant purple |
| `cyan` | `#00e5ff` | Neon cyan |
| `pink` | `#ff2bd6` | Hot pink |
| `orange` | `#f97316` | Bright orange |
| `rainbow` | Animated | RGB color cycling |

### Examples

```dart
// Emerald gamer aesthetic
NeonStylesheet(theme: NeonTheme.green)

// Cyberpunk purple
NeonStylesheet(theme: NeonTheme.purple)

// Animated rainbow
NeonStylesheet(theme: NeonTheme.rainbow)
```

## NeubrutalismTheme Options

Bold pop-art accent colors paired with thick black borders and hard shadows:

| Theme | Color | Description |
|-------|-------|-------------|
| `yellow` | `#FFD23F` | High-vis yellow (default) |
| `pink` | `#FF6B9D` | Hot bubblegum pink |
| `mint` | `#95E1D3` | Cool mint green |
| `orange` | `#FF8C42` | Warm pop-art orange |
| `sky` | `#6FB3FF` | Cool electric blue |
| `lavender` | `#B983FF` | Saturated purple |
| `lime` | `#C1FF72` | Acid lime green |
| `red` | `#FF4747` | Pure stop-sign red |

### Examples

```dart
// Default high-vis yellow
NeubrutalismStylesheet(theme: NeubrutalismTheme.yellow)

// Bubblegum pop
NeubrutalismStylesheet(theme: NeubrutalismTheme.pink)

// Acid lime
NeubrutalismStylesheet(theme: NeubrutalismTheme.lime)
```

## Theme Toggle

Users can toggle between light and dark modes using the theme toggle button in the sidebar. The preference is saved to localStorage.

### Configuration

```dart
SiteConfig(
  name: 'My Docs',
  themeToggleEnabled: true,        // Show toggle (default: true)
  defaultTheme: KBThemeMode.dark,  // Initial theme
)
```

### KBThemeMode Options

| Mode | Description |
|------|-------------|
| `dark` | Start in dark mode |
| `light` | Start in light mode |
| `system` | Follow system preference |

## Font Customization

### ShadcnStylesheet Fonts

- **Body**: Inter (loaded from Google Fonts)
- **Monospace**: System monospace stack

### NeonStylesheet Fonts

The Neon theme uses custom fonts that must be included in your assets:

- **Headings**: ITCAvantGardeStd
- **Body**: Akzidenz-GroteskPro
- **Code**: Hack

> [!IMPORTANT]
> NeonStylesheet requires font files in `/assets/fonts/`. See the arcane_jaspr documentation for font setup.

### NeubrutalismStylesheet Fonts

The NeuBrutalism theme loads three Google Fonts (no asset setup required):

- **Headings**: Archivo Black
- **Body**: Space Grotesk
- **Code**: JetBrains Mono

## Custom CSS

Add custom styles via a `/styles.css` file in your web directory:

```css
/* Custom overrides */
.prose h1 {
  color: var(--primary);
}

.kb-sidebar {
  background: var(--surface);
}
```

## CSS Variables

Both stylesheets expose CSS variables for customization:

### Colors

```css
--primary          /* Primary accent color */
--primary-foreground
--background       /* Page background */
--foreground       /* Text color */
--muted            /* Muted backgrounds */
--muted-foreground /* Muted text */
--border           /* Border color */
--ring             /* Focus ring color */
```

### Typography

```css
--font-sans        /* Body font */
--font-mono        /* Code font */
--font-heading     /* Heading font (Neon only) */
```

### Spacing and Radius

```css
--radius-sm
--radius-md
--radius-lg
--radius-xl
```

## Dark Mode Classes

Both themes add a `.dark` class to the root element in dark mode:

```css
/* Light mode styles */
.my-component {
  background: white;
}

/* Dark mode styles */
.dark .my-component {
  background: black;
}
```

## Theme Persistence

Theme preference is stored in localStorage under the key `arcane-theme-mode`. The stored value is either `'dark'` or `'light'`.

## Syntax Highlighting

Code blocks use Highlight.js for syntax highlighting. All stylesheets include theme-appropriate colors:

- **ShadcnStylesheet**: GitHub-style highlighting (light in light mode, dark in dark mode)
- **NeonStylesheet**: Neon terminal-style highlighting with primary color accents
- **NeubrutalismStylesheet**: Flat high-contrast palette with hard borders and accent-tinted code backgrounds
