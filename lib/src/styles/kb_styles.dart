/// Default CSS styles for knowledge base components.
///
/// These styles provide STRUCTURAL defaults only (layout, positioning).
/// Visual styling (colors, fonts, effects) comes from the stylesheet's
/// componentCss (arcaneSidebarTreeStyles for ShadCN, arcaneSidebarNeonStyles for Neon).
class KBStyles {
  const KBStyles._();

  /// Generate the complete default CSS for knowledge base components.
  static String generate() =>
      '''
$_chromeStyles
$_sidebarSections
$_sidebarDetailsMarkers
$_sidebarChevron
$_sidebarTree
$_sidebarTreeConnectors
$_sidebarLinks
$_tocSpacingStyles
$_proseLinkIndicatorStyles
$_mediaStyles
$_calloutStyles
$_markdownAlerts
$_pageNavStyles
$_cardStyles
$_columnsStyles
$_tileStyles
$_stepStyles
$_accordionStyles
$_badgeStyles
$_bannerStyles
$_panelStyles
$_frameStyles
$_updateStyles
$_tooltipStyles
$_inlineIconStyles
$_tagStyles
$_docUtilityStyles
$_codeGroupStyles
$_fieldStyles
$_treeStyles
$_colorStyles
$_viewStyles
$_lightThemeReadability
$_neonLexiconStyles
''';

  static const String _chromeStyles = '''
.kb-page-shell {
  min-height: 100vh;
}

.kb-layout-body {
  display: flex;
  flex: 1;
  min-height: 0;
}

.kb-main-area {
  min-width: 0;
}

.kb-content-area {
  width: 100%;
}

.kb-topbar {
  position: sticky;
  top: 0;
  z-index: 50;
  width: 100%;
  border-bottom: 1px solid var(--border);
  background: var(--background);
  box-shadow: none;
  backdrop-filter: none;
  -webkit-backdrop-filter: none;
}

.kb-topbar.kb-topbar-bottom {
  top: auto;
  bottom: 0;
  border-top: 1px solid var(--border);
  border-bottom: none;
}

.kb-topbar-inner {
  width: 100%;
  max-width: none;
  margin: 0;
  min-height: 3.5rem;
  padding: 0 1rem;
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 0.75rem;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-header {
  width: 100% !important;
  justify-content: stretch !important;
  background: var(--background) !important;
  box-shadow: none !important;
  backdrop-filter: none !important;
  -webkit-backdrop-filter: none !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-navigation {
  flex: 1 1 auto !important;
  width: 100% !important;
  min-width: 0 !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-header .kb-topbar {
  position: static !important;
  width: 100% !important;
  border-bottom: 0 !important;
  background: transparent !important;
  box-shadow: none !important;
  backdrop-filter: none !important;
  -webkit-backdrop-filter: none !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-header .kb-topbar-inner {
  width: 100% !important;
  justify-content: space-between !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-header::before,
#arcane-root:not([class*="neon-"]) .arcane-scaffold-header::after,
#arcane-root:not([class*="neon-"]) .kb-topbar::before,
#arcane-root:not([class*="neon-"]) .kb-topbar::after {
  content: none !important;
  display: none !important;
  box-shadow: none !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-body {
  align-items: start !important;
  overflow: visible !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-main {
  background: var(--background) !important;
  backdrop-filter: none !important;
  -webkit-backdrop-filter: none !important;
  overflow: visible !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-sidebar {
  position: sticky !important;
  top: 3.5rem !important;
  align-self: start !important;
  height: auto !important;
  max-height: calc(100vh - 3.5rem) !important;
  overflow: hidden !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-sidebar .kb-sidebar {
  height: auto !important;
  max-height: inherit !important;
  min-height: 0 !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-sidebar .kb-sidebar > #kb-sidebar {
  position: relative !important;
  top: 0 !important;
  width: 100% !important;
  height: auto !important;
  max-height: calc(100vh - 3.5rem) !important;
  overflow-y: auto !important;
  overflow-x: hidden !important;
  background: transparent !important;
}

#arcane-root:not([class*="neon-"]) .arcane-scaffold-sidebar .kb-sidebar > #kb-sidebar > div {
  min-height: auto !important;
}

#arcane-root:not([class*="neon-"]) .kb-toc-panel {
  position: sticky !important;
  top: 5rem !important;
  align-self: flex-start !important;
  max-height: calc(100vh - 6rem) !important;
  overflow-y: auto !important;
}

.kb-topbar-left {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  min-width: 0;
  flex: 1 1 auto;
  justify-content: flex-start;
}

.kb-topbar-right {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-left: auto;
  justify-content: flex-end;
  flex: 0 0 auto;
}

.kb-topbar-brand {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
  color: var(--foreground);
  font-weight: 600;
  font-size: 0.9375rem;
  line-height: 1;
  white-space: nowrap;
}

.kb-topbar-brand:hover {
  opacity: 0.88;
}

.kb-topbar-logo {
  width: 1.125rem;
  height: 1.125rem;
  object-fit: contain;
  border-radius: var(--radius-sm, 0.25rem);
}

.kb-topbar-nav {
  display: flex;
  align-items: center;
  gap: 0.125rem;
  margin-left: 0.375rem;
}

.kb-topbar-link {
  height: 2rem;
  padding: 0 0.625rem;
  border-radius: var(--radius-sm, 0.25rem);
  display: inline-flex;
  align-items: center;
  gap: 0.35rem;
  text-decoration: none;
  color: var(--muted-foreground);
  font-size: 0.875rem;
  line-height: 1;
  transition: background 0.15s ease, color 0.15s ease;
}

.kb-topbar-link:hover {
  background: var(--accent);
  color: var(--accent-foreground);
}

.kb-topbar-link.active {
  background: var(--muted);
  color: var(--foreground);
}

.kb-topbar-github,
.kb-theme-toggle,
.kb-stylesheet-select {
  width: 2.25rem;
  height: 2.25rem;
  border-radius: var(--radius-md, 0.375rem);
  border: 1px solid var(--border);
  background: var(--background);
  color: var(--muted-foreground);
  display: inline-flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  cursor: pointer;
  transition: background 0.15s ease, color 0.15s ease, border-color 0.15s ease;
}

.kb-stylesheet-select {
  width: auto;
  min-width: 7rem;
  padding: 0 2rem 0 0.75rem;
  font: inherit;
  font-size: 0.8125rem;
  font-weight: 500;
}

.kb-topbar-github:hover,
.kb-theme-toggle:hover,
.kb-stylesheet-select:hover {
  background: var(--accent);
  color: var(--accent-foreground);
}

.theme-icon-dark {
  display: none;
}

.dark .theme-icon-light,
html.dark .theme-icon-light {
  display: none;
}

.dark .theme-icon-dark,
html.dark .theme-icon-dark {
  display: block;
}

.kb-search {
  position: relative;
  width: min(25rem, 42vw);
}

.kb-search-input-wrap {
  position: relative;
}

.kb-search-input {
  width: 100%;
  height: 2.25rem;
  border-radius: var(--radius-md, 0.375rem);
  border: 1px solid var(--border);
  background: var(--background);
  color: var(--foreground);
  padding: 0 0.75rem 0 2rem;
  font-size: 0.875rem;
  outline: none;
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.kb-search-input::placeholder {
  color: var(--muted-foreground);
}

.kb-search-input:focus {
  border-color: var(--ring);
  box-shadow: 0 0 0 2px color-mix(in srgb, var(--ring) 30%, transparent);
}

.kb-search-icon {
  position: absolute;
  left: 0.625rem;
  top: 50%;
  transform: translateY(-50%);
  color: var(--muted-foreground);
  pointer-events: none;
  display: flex;
  align-items: center;
}

.search-results {
  display: none;
  position: absolute;
  top: calc(100% + 0.25rem);
  left: 0;
  right: 0;
  background: var(--popover);
  border: 1px solid var(--border);
  border-radius: var(--radius-md, 0.375rem);
  box-shadow: var(--shadow-lg, 0 10px 15px -3px rgba(0, 0, 0, 0.2));
  max-height: 22rem;
  overflow-y: auto;
  z-index: 70;
}

.search-results a:hover {
  background: var(--accent) !important;
}

.kb-hamburger {
  display: none;
  width: 2.25rem;
  height: 2.25rem;
  border-radius: var(--radius-md, 0.375rem);
  border: 1px solid var(--border);
  background: var(--background);
  color: var(--muted-foreground);
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: background 0.15s ease, color 0.15s ease;
}

.kb-hamburger:hover {
  background: var(--accent);
  color: var(--accent-foreground);
}

.kb-sidebar {
  position: relative;
  z-index: 30;
  flex-shrink: 0;
}

.sidebar-header {
  padding: 0.875rem;
  border-bottom: 1px solid var(--border);
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.sidebar-brand-title {
  color: var(--foreground);
  font-size: 0.925rem;
  font-weight: 600;
  line-height: 1.25;
}

.sidebar-brand-subtitle {
  color: var(--muted-foreground);
  font-size: 0.78rem;
  margin-top: 0.25rem;
}

.sidebar-controls {
  display: flex;
  gap: 0.5rem;
  align-items: center;
}

.sidebar-search {
  width: 100%;
  min-width: 0;
}

@media (max-width: 1280px) {
  .kb-search {
    width: min(20rem, 35vw);
  }
}

@media (max-width: 1024px) {
  .kb-topbar-nav {
    display: none;
  }

  .kb-search {
    width: min(18rem, 52vw);
  }
}

@media (max-width: 900px) {
  .kb-hamburger {
    display: inline-flex;
  }

  .kb-search {
    display: none;
  }

  .kb-sidebar {
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    width: min(22rem, 92vw);
    max-width: 92vw;
    transform: translateX(-100%);
    transition: transform 0.2s ease;
    box-shadow: var(--shadow-xl, 0 20px 25px -5px rgba(0, 0, 0, 0.2));
    background: var(--card);
  }

  .kb-sidebar > div {
    width: 100% !important;
    height: 100vh !important;
    max-height: 100vh !important;
    top: 0 !important;
    position: relative !important;
    background: var(--card) !important;
  }

  .kb-sidebar.open {
    transform: translateX(0);
  }
}
''';

  /// Sidebar section and summary STRUCTURAL styles only
  static const String _sidebarSections = '''
/* ============================================
   SIDEBAR SECTIONS & SUMMARIES - Structure Only
   Visual styling provided by stylesheet componentCss
   ============================================ */
.sidebar-section {
  margin-bottom: 0.5rem;
}

.sidebar-section-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.25rem 0.5rem;
}

.sidebar-details {
  width: 100%;
}

.sidebar-summary {
  display: flex;
  align-items: center;
  gap: 0.625rem;
  padding: 0.625rem 0.75rem;
  cursor: pointer;
  list-style: none !important;
}
''';

  /// Aggressively hide browser default disclosure markers
  static const String _sidebarDetailsMarkers = '''
/* ============================================
   HIDE DEFAULT DISCLOSURE MARKERS
   ============================================ */
.sidebar-summary::-webkit-details-marker,
.sidebar-summary::marker,
.sidebar-details > summary::-webkit-details-marker,
.sidebar-details > summary::marker {
  display: none !important;
  content: '' !important;
  list-style: none !important;
}

details.sidebar-details {
  list-style: none !important;
}

details.sidebar-details > summary {
  list-style: none !important;
}

details > summary {
  list-style: none !important;
}

details > summary::marker,
details > summary::-webkit-details-marker {
  display: none !important;
}
''';

  /// Chevron indicator STRUCTURAL styling
  static const String _sidebarChevron = '''
/* ============================================
   CHEVRON INDICATOR - Structure Only
   ============================================ */
.sidebar-chevron {
  margin-left: auto;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.2s ease, opacity 0.2s ease;
  transform: rotate(-90deg);
}

/* Hide CSS-based chevron from arcaneSidebarTreeStyles - we use an actual icon */
.sidebar-chevron::before {
  display: none !important;
}

.sidebar-details[open] > .sidebar-summary .sidebar-chevron {
  transform: rotate(0deg);
}
''';

  /// Sidebar tree STRUCTURAL layout
  static const String _sidebarTree = '''
/* ============================================
   SIDEBAR TREE STRUCTURE - Layout Only
   ============================================ */
.sidebar-tree {
  padding-left: 1rem;
  display: flex;
  flex-direction: column;
  position: relative;
  margin-left: 0.5rem;
}

.sidebar-tree .sidebar-tree {
  margin-left: 0;
  padding-left: 0.75rem;
}

.sidebar-tree .sidebar-section {
  margin-bottom: 0;
  margin-top: 3px;
}

.sidebar-tree .sidebar-section:first-child {
  margin-top: 0;
}

/* Extend tree-item vertical lines to bridge the 3px gap before sections */
.sidebar-tree > .sidebar-tree-item:not(:last-child)::after {
  bottom: -3px;
}

.sidebar-tree .sidebar-details {
  margin-left: 0;
}

.sidebar-tree .sidebar-summary {
  padding: 0.375rem 0.5rem;
}
''';

  /// Tree connector lines STRUCTURAL positioning
  /// Note: .sidebar-tree-item connectors are handled by the stylesheet's
  /// arcaneSidebarTreeStyles. This only handles .sidebar-section (folders).
  static const String _sidebarTreeConnectors = '''
/* ============================================
   TREE CONNECTOR LINES (folders only) - Structure
   Colors provided by stylesheet componentCss
   ============================================ */
.sidebar-tree > .sidebar-section {
  position: relative;
}

/* Vertical line from this section to next */
.sidebar-tree > .sidebar-section::after {
  content: '';
  position: absolute;
  left: -0.75rem;
  top: 0;
  bottom: 0;
  width: 1px;
  pointer-events: none;
}

/* Last section: vertical line only goes to summary level (L-shape) */
.sidebar-tree > .sidebar-section:last-child::after {
  bottom: auto;
  height: 0.875rem;
}

/* Horizontal connector line at summary level */
.sidebar-tree > .sidebar-section::before {
  content: '';
  position: absolute;
  left: -0.75rem;
  top: 0.875rem;
  width: 0.5rem;
  height: 1px;
  pointer-events: none;
}

/* Single section: no vertical line needed */
.sidebar-tree > .sidebar-section:first-child:last-child::after {
  display: none;
}

/* Extend lines to bridge margin gaps */
.sidebar-tree > .sidebar-section:not(:last-child)::after {
  bottom: -3px;
}
''';

  /// Sidebar link STRUCTURAL styling
  static const String _sidebarLinks = '''
/* ============================================
   SIDEBAR LINKS - Structure Only
   Visual styling provided by stylesheet componentCss
   ============================================ */
.sidebar-link {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.375rem 0.5rem;
  text-decoration: none;
}

.sidebar-icon,
.sidebar-chevron-icon {
  display: inline-block;
  width: 1rem;
  height: 1rem;
  flex: 0 0 1rem;
  color: currentColor;
}

.sidebar-icon-svg {
  width: 1rem;
  height: 1rem;
  flex: 0 0 1rem;
}
''';

  static const String _tocSpacingStyles = '''
.toc-content a {
  margin-left: 0.125rem;
  padding: 0.5rem 0.75rem 0.5rem 0.625rem !important;
  font-size: 0.8125rem;
  line-height: 1.3;
}

.toc-content ul ul a {
  padding: 0.5rem 0.75rem 0.5rem 0.625rem !important;
  font-size: 0.8125rem;
  line-height: 1.3;
}

[class*="neon-"] .toc-content a,
.neon .toc-content a {
  margin: 0.125rem 0;
  padding: 0.5rem 0.75rem 0.5rem 0.625rem !important;
  font-size: 0.8125rem;
  line-height: 1.3;
}
''';

  static const String _proseLinkIndicatorStyles = '''
.prose p a[href]:not([href^="#"])::after,
.prose li a[href]:not([href^="#"])::after,
.prose blockquote a[href]:not([href^="#"])::after,
.prose td a[href]:not([href^="#"])::after,
.prose th a[href]:not([href^="#"])::after {
  display: inline-block;
  margin-left: 0.18em;
  font-size: 0.62em;
  line-height: 1;
  vertical-align: super;
  opacity: 0.8;
}

.prose p a[href^="http://"]::after,
.prose p a[href^="https://"]::after,
.prose p a[href^="//"]::after,
.prose p a[href^="mailto:"]::after,
.prose li a[href^="http://"]::after,
.prose li a[href^="https://"]::after,
.prose li a[href^="//"]::after,
.prose li a[href^="mailto:"]::after,
.prose blockquote a[href^="http://"]::after,
.prose blockquote a[href^="https://"]::after,
.prose blockquote a[href^="//"]::after,
.prose blockquote a[href^="mailto:"]::after,
.prose td a[href^="http://"]::after,
.prose td a[href^="https://"]::after,
.prose td a[href^="//"]::after,
.prose td a[href^="mailto:"]::after,
.prose th a[href^="http://"]::after,
.prose th a[href^="https://"]::after,
.prose th a[href^="//"]::after,
.prose th a[href^="mailto:"]::after {
  content: '↗';
}

.prose p a[href^="/"]::after,
.prose p a[href^="./"]::after,
.prose p a[href^="../"]::after,
.prose li a[href^="/"]::after,
.prose li a[href^="./"]::after,
.prose li a[href^="../"]::after,
.prose blockquote a[href^="/"]::after,
.prose blockquote a[href^="./"]::after,
.prose blockquote a[href^="../"]::after,
.prose td a[href^="/"]::after,
.prose td a[href^="./"]::after,
.prose td a[href^="../"]::after,
.prose th a[href^="/"]::after,
.prose th a[href^="./"]::after,
.prose th a[href^="../"]::after {
  content: '↪';
}
''';

  /// Media embed styles (video, images, iframes)
  static const String _mediaStyles = '''
/* ============================================
   MEDIA EMBEDS - Responsive containers
   ============================================ */

/* Base media container */
.kb-media {
  margin: 1.5rem 0;
  width: 100%;
}

/* Video containers (YouTube, Vimeo, Loom, local) */
.kb-media-video {
  position: relative;
  padding-bottom: 56.25%; /* 16:9 aspect ratio */
  height: 0;
  overflow: hidden;
  border-radius: var(--radius-md, 0.5rem);
  background: var(--muted, #1a1a1a);
}

.kb-media-video iframe,
.kb-media-video video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: none;
  border-radius: var(--radius-md, 0.5rem);
}

/* Local video figure */
figure.kb-media-video {
  padding-bottom: 0;
  height: auto;
}

figure.kb-media-video video {
  position: relative;
  max-width: 100%;
  height: auto;
}

/* Image containers */
.kb-media-image,
.kb-media-gif,
.kb-media-apng {
  text-align: center;
}

.kb-media-image img,
.kb-media-gif img,
.kb-media-apng img {
  max-width: 100%;
  height: auto;
  border-radius: var(--radius-md, 0.5rem);
  background: var(--muted, #1a1a1a);
}

/* Caption styling */
.kb-media-caption {
  margin-top: 0.75rem;
  font-size: 0.875rem;
  color: var(--muted-foreground, #888);
  text-align: center;
  font-style: italic;
}

/* Twitter/X embed */
.kb-media-twitter {
  display: flex;
  justify-content: center;
}

.kb-media-twitter blockquote {
  margin: 0 !important;
}

/* Generic iframe container */
.kb-media-iframe {
  border-radius: var(--radius-md, 0.5rem);
  overflow: hidden;
  background: var(--muted, #1a1a1a);
}

.kb-media-iframe iframe {
  display: block;
  border: none;
}

/* GIF/APNG indicator badge */
.kb-media-gif::before,
.kb-media-apng::before {
  content: attr(data-type);
  position: absolute;
  top: 0.5rem;
  left: 0.5rem;
  padding: 0.125rem 0.5rem;
  font-size: 0.625rem;
  font-weight: 600;
  text-transform: uppercase;
  background: rgba(0, 0, 0, 0.6);
  color: white;
  border-radius: var(--radius-sm, 0.25rem);
  pointer-events: none;
}

.kb-media-gif,
.kb-media-apng {
  position: relative;
  display: inline-block;
}

/* Hover effects */
.kb-media-image img:hover,
.kb-media-gif img:hover,
.kb-media-apng img:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

/* Dark mode adjustments */
.dark .kb-media-video {
  background: #0a0a0a;
}

.dark .kb-media-image img,
.dark .kb-media-gif img,
.dark .kb-media-apng img {
  background: #0a0a0a;
}
''';

  static const String _calloutStyles = '''
.kb-callout {
  --kb-callout-accent: var(--info, #3b82f6);
  --kb-callout-soft: color-mix(in srgb, var(--kb-callout-accent) 9%, transparent);
  position: relative;
  overflow: hidden;
  margin: 1.25rem 0;
  padding: 1rem 1rem 1rem 1.1rem;
  border-radius: var(--radius-lg, 12px);
  border: 1px solid color-mix(in srgb, var(--kb-callout-accent) 24%, var(--border));
  background:
    radial-gradient(circle at 1.45rem 1.45rem, color-mix(in srgb, var(--kb-callout-accent) 18%, transparent), transparent 7rem),
    linear-gradient(180deg, var(--kb-callout-soft), transparent 72%),
    var(--card, var(--background));
  box-shadow: 0 14px 34px color-mix(in srgb, var(--kb-callout-accent) 8%, transparent);
  isolation: isolate;
}

.kb-callout::before {
  content: '';
  position: absolute;
  inset: 0.7rem auto auto 0.75rem;
  width: 2rem;
  height: 2rem;
  border-radius: var(--radius-md, 8px);
  border: 1px solid color-mix(in srgb, var(--kb-callout-accent) 35%, transparent);
  background: color-mix(in srgb, var(--kb-callout-accent) 12%, transparent);
}

.kb-callout-title {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0 0 0 2.6rem;
  font-weight: 700;
  font-size: 0.875rem;
  line-height: 1.25;
  margin: 0;
  color: var(--foreground);
  letter-spacing: 0.01em;
}

.kb-callout-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 1.25rem;
  height: 1.25rem;
  color: var(--kb-callout-accent);
  flex-shrink: 0;
  z-index: 1;
}

.kb-callout-icon svg,
.kb-callout-icon-svg {
  width: 16px;
  height: 16px;
}

.kb-callout-icon i {
  width: 16px !important;
  height: 16px !important;
  font-size: 16px !important;
}

.kb-callout-content {
  font-size: 0.875rem;
  line-height: 1.625;
  color: var(--muted-foreground);
  margin: 0;
  padding: 0.65rem 0 0 2.6rem;
}

.kb-callout-content > :first-child {
  margin-top: 0;
}

.kb-callout-content > :last-child {
  margin-bottom: 0;
}

.kb-callout-content br {
  display: block;
  content: '';
  margin-top: 0.5rem;
}

.kb-callout-note {
  --kb-callout-accent: var(--info, #3b82f6);
}

.kb-callout-tip {
  --kb-callout-accent: var(--success, #22c55e);
}

.kb-callout-important {
  --kb-callout-accent: var(--primary, #8b5cf6);
}

.kb-callout-warning {
  --kb-callout-accent: var(--warning, #f59e0b);
}

.kb-callout-caution {
  --kb-callout-accent: var(--destructive, #ef4444);
}

.markdown-alert {
  --kb-alert-accent: var(--info, #3b82f6);
  margin: 1rem 0;
  padding: 0.7rem 1rem;
  border-left: 0.25rem solid var(--kb-alert-accent);
  border-top: 0;
  border-right: 0;
  border-bottom: 0;
  border-radius: 0.25rem;
  background: color-mix(in srgb, var(--kb-alert-accent) 5%, var(--background));
  color: var(--foreground);
}

.markdown-alert-title {
  display: flex;
  align-items: center;
  gap: 0.45rem;
  margin: 0 0 0.45rem;
  padding: 0;
  color: var(--kb-alert-accent);
  font-size: 0.875rem;
  font-weight: 700;
  line-height: 1.25;
  text-transform: uppercase;
}

.markdown-alert-title::before {
  content: 'i';
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 1rem;
  height: 1rem;
  border: 1.5px solid currentColor;
  border-radius: 999px;
  font-size: 0.6875rem;
  font-weight: 800;
  line-height: 1;
  text-transform: lowercase;
}

.markdown-alert-tip .markdown-alert-title::before {
  content: '✓';
  border-radius: 0.25rem;
}

.markdown-alert-important .markdown-alert-title::before {
  content: '!';
}

.markdown-alert-warning .markdown-alert-title::before {
  content: '!';
  border-radius: 0.25rem;
}

.markdown-alert-caution .markdown-alert-title::before {
  content: '!';
  border-radius: 999px;
}

.markdown-alert p {
  margin: 0;
  color: var(--muted-foreground);
  font-size: 0.875rem;
  line-height: 1.55;
}

.markdown-alert p + p {
  margin-top: 0.5rem;
}

.markdown-alert-note {
  --kb-alert-accent: var(--info, #3b82f6);
}

.markdown-alert-tip {
  --kb-alert-accent: var(--success, #22c55e);
}

.markdown-alert-important {
  --kb-alert-accent: var(--primary, #8b5cf6);
}

.markdown-alert-warning {
  --kb-alert-accent: var(--warning, #f59e0b);
}

.markdown-alert-caution {
  --kb-alert-accent: var(--destructive, #ef4444);
}

html.dark .markdown-alert,
#arcane-root.dark .markdown-alert {
  background: color-mix(in srgb, var(--kb-alert-accent) 7%, transparent);
}

#arcane-root[class*="neon-"] .kb-callout {
  border-color: color-mix(in srgb, var(--kb-callout-accent) 34%, var(--border));
  background:
    linear-gradient(90deg, color-mix(in srgb, var(--kb-callout-accent) 6%, transparent) 1px, transparent 1px),
    linear-gradient(color-mix(in srgb, var(--kb-callout-accent) 5%, transparent) 1px, transparent 1px),
    radial-gradient(circle at 1.5rem 1.4rem, color-mix(in srgb, var(--kb-callout-accent) 26%, transparent), transparent 6rem),
    color-mix(in srgb, var(--card) 76%, transparent);
  background-size: 18px 18px, 18px 18px, auto, auto;
  border-radius: var(--arcane-radius-sm, var(--radius-md, 8px));
  box-shadow:
    0 18px 42px rgba(0, 0, 0, 0.24),
    0 0 28px color-mix(in srgb, var(--kb-callout-accent) 12%, transparent);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
}

#arcane-root[class*="neon-"] .kb-callout::before {
  box-shadow:
    0 0 16px color-mix(in srgb, var(--kb-callout-accent) 30%, transparent),
    inset 0 0 14px color-mix(in srgb, var(--kb-callout-accent) 14%, transparent);
}

#arcane-root[class*="neon-"] .markdown-alert {
  background: color-mix(in srgb, var(--kb-alert-accent) 6%, transparent);
  box-shadow: 0 0 18px color-mix(in srgb, var(--kb-alert-accent) 8%, transparent);
}
''';

  static const String _markdownAlerts = '''
.markdown-alert > :last-child {
  margin-bottom: 0;
}
''';

  static const String _pageNavStyles = '''
.kb-page-nav {
  margin-top: 2.25rem;
  padding-top: 1.25rem;
  border-top: 1px solid var(--border);
}

.kb-page-nav-link {
  background: var(--card);
  transition: border-color 0.15s ease, background 0.15s ease, transform 0.15s ease;
}

.kb-page-nav-link:hover {
  background: color-mix(in srgb, var(--card) 80%, var(--accent));
  border-color: color-mix(in srgb, var(--border) 40%, var(--primary));
  transform: translateY(-1px);
}

.kb-page-nav-link .arcane-icon {
  color: var(--muted-foreground);
}

@media (max-width: 900px) {
  .kb-page-nav {
    display: grid !important;
    grid-template-columns: 1fr;
  }
}
''';

  static const String _cardStyles = '''
.kb-card-group {
  --kb-card-cols: 3;
  display: grid;
  grid-template-columns: repeat(var(--kb-card-cols), minmax(0, 1fr));
  gap: 0.9rem;
  margin: 1.5rem 0;
}

.kb-card {
  display: flex;
  flex-direction: column;
  gap: 0.65rem;
  min-height: 100%;
  padding: 1rem;
  border-radius: var(--radius-lg, 0.75rem);
  border: 1px solid var(--border);
  background: var(--card);
  text-decoration: none;
  color: inherit;
  transition: transform 0.16s ease, border-color 0.16s ease, box-shadow 0.16s ease, background 0.16s ease;
}

.kb-card:hover {
  transform: translateY(-2px);
  border-color: color-mix(in srgb, var(--border) 40%, var(--primary));
  background: color-mix(in srgb, var(--card) 86%, var(--accent));
  box-shadow: 0 12px 30px -20px color-mix(in srgb, var(--primary) 35%, transparent);
}

.kb-card-top {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
}

.kb-card-leading {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 1.85rem;
  height: 1.85rem;
  border-radius: 0.5rem;
  background: color-mix(in srgb, var(--muted) 75%, transparent);
  color: var(--foreground);
}

.kb-card-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.kb-card-indicator {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  color: var(--muted-foreground);
}

.kb-card-title {
  font-size: 0.98rem;
  line-height: 1.3;
  font-weight: 600;
  color: var(--foreground);
}

.kb-card-body {
  font-size: 0.9rem;
  line-height: 1.5;
  color: var(--muted-foreground);
}

.kb-card-body p {
  margin: 0;
}

.kb-card-body p + p {
  margin-top: 0.5rem;
}

.kb-card-internal .kb-card-indicator {
  color: color-mix(in srgb, var(--muted-foreground) 80%, var(--foreground));
}

.kb-card-external .kb-card-indicator {
  color: color-mix(in srgb, var(--primary) 45%, var(--foreground));
}

@media (max-width: 1200px) {
  .kb-card-group {
    grid-template-columns: repeat(min(2, var(--kb-card-cols)), minmax(0, 1fr));
  }
}

@media (max-width: 700px) {
  .kb-card-group {
    grid-template-columns: 1fr;
  }
}
''';

  static const String _columnsStyles = '''
.kb-columns {
  --kb-columns: 2;
  display: grid;
  grid-template-columns: repeat(var(--kb-columns), minmax(0, 1fr));
  gap: 0.9rem;
  margin: 1.5rem 0;
}

.kb-column {
  min-width: 0;
}

.kb-column > :first-child {
  margin-top: 0;
}

.kb-column > :last-child {
  margin-bottom: 0;
}

@media (max-width: 900px) {
  .kb-columns {
    grid-template-columns: 1fr;
  }
}
''';

  static const String _tileStyles = '''
.kb-tiles {
  --kb-tile-cols: 3;
  display: grid;
  grid-template-columns: repeat(var(--kb-tile-cols), minmax(0, 1fr));
  gap: 0.8rem;
  margin: 1.25rem 0 1.5rem;
}

.kb-tile {
  border-radius: var(--radius-lg, 0.75rem);
  border: 1px solid var(--border);
  background: var(--card);
  color: inherit;
}

.kb-tile-content {
  padding: 0.85rem 0.95rem;
}

.kb-tile-link {
  text-decoration: none;
  display: block;
  transition: transform 0.16s ease, border-color 0.16s ease, box-shadow 0.16s ease, background 0.16s ease;
}

.kb-tile-link:hover {
  transform: translateY(-2px);
  border-color: color-mix(in srgb, var(--border) 40%, var(--primary));
  background: color-mix(in srgb, var(--card) 86%, var(--accent));
  box-shadow: 0 10px 24px -18px color-mix(in srgb, var(--primary) 34%, transparent);
}

.kb-tile-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 0.65rem;
}

.kb-tile-icon {
  width: 1.7rem;
  height: 1.7rem;
  border-radius: 0.45rem;
  background: color-mix(in srgb, var(--muted) 78%, transparent);
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.kb-tile-indicator {
  color: var(--muted-foreground);
  display: inline-flex;
  align-items: center;
}

.kb-tile-title {
  font-size: 0.94rem;
  line-height: 1.3;
  font-weight: 600;
  color: var(--foreground);
  margin-bottom: 0.35rem;
}

.kb-tile-body {
  font-size: 0.86rem;
  line-height: 1.5;
  color: var(--muted-foreground);
}

.kb-tile-body p {
  margin: 0;
}

.kb-tile-body p + p {
  margin-top: 0.45rem;
}

.kb-tile-external .kb-tile-indicator {
  color: color-mix(in srgb, var(--primary) 45%, var(--foreground));
}

@media (max-width: 1100px) {
  .kb-tiles {
    grid-template-columns: repeat(min(2, var(--kb-tile-cols)), minmax(0, 1fr));
  }
}

@media (max-width: 700px) {
  .kb-tiles {
    grid-template-columns: 1fr;
  }
}
''';

  static const String _stepStyles = '''
.kb-steps {
  position: relative;
  margin: 1.5rem 0;
  display: flex;
  flex-direction: column;
  gap: 0.9rem;
  counter-reset: kb-step-counter;
}

.kb-step {
  position: relative;
  display: grid;
  grid-template-columns: 2.4rem minmax(0, 1fr);
  gap: 0.75rem;
}

.kb-step:not(:last-child)::after {
  content: '';
  position: absolute;
  left: 1.05rem;
  top: 2.35rem;
  bottom: -0.9rem;
  width: 1px;
  background: color-mix(in srgb, var(--border) 65%, var(--primary) 35%);
  pointer-events: none;
}

.kb-step-marker {
  width: 2.1rem;
  height: 2.1rem;
  border-radius: 9999px;
  border: 1px solid color-mix(in srgb, var(--border) 45%, var(--primary));
  background: color-mix(in srgb, var(--card) 70%, var(--accent));
  color: var(--foreground);
  font-size: 0.9rem;
  font-weight: 700;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  margin-top: 0.15rem;
  font-size: 0;
}

.kb-step-marker::before {
  counter-increment: kb-step-counter;
  content: counter(kb-step-counter);
  font-size: 0.9rem;
  line-height: 1;
}

.kb-step-main {
  position: relative;
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  padding: 0.85rem 1rem;
}

.kb-step-title {
  font-size: 0.96rem;
  line-height: 1.3;
  font-weight: 600;
  color: var(--foreground);
  margin-bottom: 0.45rem;
}

.kb-step-body {
  color: var(--muted-foreground);
  font-size: 0.9rem;
  line-height: 1.55;
}

.kb-step-body p {
  margin: 0;
}

.kb-step-body p + p {
  margin-top: 0.5rem;
}

@media (max-width: 700px) {
  .kb-step {
    grid-template-columns: 1fr;
    gap: 0.5rem;
  }

  .kb-step-marker {
    width: 1.95rem;
    height: 1.95rem;
  }

  .kb-step:not(:last-child)::after {
    display: none;
  }
}
''';

  static const String _accordionStyles = '''
.kb-accordion-group {
  display: flex;
  flex-direction: column;
  gap: 0.65rem;
  margin: 1.5rem 0;
}

.kb-accordion {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  overflow: hidden;
}

.kb-accordion-summary {
  list-style: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.75rem;
  padding: 0.85rem 1rem;
}

.kb-accordion-summary::-webkit-details-marker {
  display: none;
}

.kb-accordion-title {
  font-size: 0.95rem;
  line-height: 1.35;
  font-weight: 600;
  color: var(--foreground);
}

.kb-accordion-chevron {
  color: var(--muted-foreground);
  transition: transform 0.16s ease;
}

.kb-accordion[open] .kb-accordion-chevron {
  transform: rotate(180deg);
}

.kb-accordion-content {
  padding: 0 1rem 1rem;
  color: var(--muted-foreground);
  font-size: 0.9rem;
  line-height: 1.55;
}
''';

  static const String _badgeStyles = '''
.kb-badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 9999px;
  border: 1px solid var(--border);
  background: var(--muted);
  color: var(--foreground);
  font-size: 0.72rem;
  line-height: 1;
  font-weight: 600;
  letter-spacing: 0.02em;
  text-transform: uppercase;
  padding: 0.35rem 0.55rem;
}

.kb-badge-default {
  background: color-mix(in srgb, var(--muted) 82%, transparent);
}

.kb-badge-info {
  border-color: color-mix(in srgb, #3b82f6 38%, var(--border));
  color: #3b82f6;
}

.kb-badge-success {
  border-color: color-mix(in srgb, #22c55e 38%, var(--border));
  color: #22c55e;
}

.kb-badge-warning {
  border-color: color-mix(in srgb, #f59e0b 38%, var(--border));
  color: #f59e0b;
}

.kb-badge-danger {
  border-color: color-mix(in srgb, #ef4444 38%, var(--border));
  color: #ef4444;
}
''';

  static const String _bannerStyles = '''
.kb-banner {
  margin: 1.25rem 0;
  border-radius: var(--radius-lg, 0.75rem);
  border: 1px solid var(--border);
  background: var(--card);
  color: inherit;
  text-decoration: none;
  display: block;
}

.kb-banner-inner {
  display: grid;
  grid-template-columns: minmax(0, 1fr) auto;
  gap: 0.5rem 0.75rem;
  padding: 0.8rem 0.95rem;
}

.kb-banner-leading {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  min-width: 0;
}

.kb-banner-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  color: var(--foreground);
}

.kb-banner-title {
  font-size: 0.91rem;
  line-height: 1.25;
  font-weight: 700;
  color: var(--foreground);
}

.kb-banner-body {
  grid-column: 1 / 2;
  font-size: 0.88rem;
  color: var(--muted-foreground);
}

.kb-banner-body p {
  margin: 0;
}

.kb-banner-indicator {
  grid-row: 1 / 3;
  grid-column: 2 / 3;
  align-self: center;
  color: var(--muted-foreground);
  display: inline-flex;
}

.kb-banner-info {
  border-color: color-mix(in srgb, #3b82f6 30%, var(--border));
}

.kb-banner-success {
  border-color: color-mix(in srgb, #22c55e 30%, var(--border));
}

.kb-banner-warning {
  border-color: color-mix(in srgb, #f59e0b 30%, var(--border));
}

.kb-banner-danger {
  border-color: color-mix(in srgb, #ef4444 30%, var(--border));
}

a.kb-banner:hover {
  background: color-mix(in srgb, var(--card) 86%, var(--accent));
}
''';

  static const String _panelStyles = '''
.kb-panel {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: color-mix(in srgb, var(--card) 88%, transparent);
  margin: 1.5rem 0;
  padding: 0.95rem 1rem;
}

.kb-panel-title {
  display: inline-flex;
  align-items: center;
  gap: 0.45rem;
  font-size: 0.9rem;
  font-weight: 700;
  line-height: 1.2;
  color: var(--foreground);
  margin-bottom: 0.6rem;
}

.kb-panel-icon {
  display: inline-flex;
  align-items: center;
  color: var(--muted-foreground);
}

.kb-panel-content {
  font-size: 0.9rem;
  line-height: 1.55;
  color: var(--muted-foreground);
}
''';

  static const String _frameStyles = '''
.kb-frame {
  margin: 1.5rem 0;
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  overflow: hidden;
}

.kb-frame-label {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-bottom: 1px solid var(--border);
  background: color-mix(in srgb, var(--muted) 70%, transparent);
  color: var(--muted-foreground);
  font-size: 0.72rem;
  letter-spacing: 0.03em;
  text-transform: uppercase;
  font-weight: 700;
  padding: 0.35rem 0.65rem;
}

.kb-frame-body {
  padding: 0.9rem 1rem;
}

.kb-frame-caption {
  border-top: 1px solid var(--border);
  color: var(--muted-foreground);
  font-size: 0.82rem;
  line-height: 1.45;
  padding: 0.55rem 1rem 0.65rem;
}
''';

  static const String _updateStyles = '''
.kb-update {
  margin: 1.5rem 0;
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  padding: 0.85rem 0.95rem;
}

.kb-update-head {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
}

.kb-update-icon {
  color: var(--muted-foreground);
  display: inline-flex;
}

.kb-update-label {
  color: var(--foreground);
  font-size: 0.88rem;
  font-weight: 700;
  line-height: 1.2;
}

.kb-update-date {
  margin-left: auto;
  color: var(--muted-foreground);
  font-size: 0.78rem;
}

.kb-update-body {
  color: var(--muted-foreground);
  font-size: 0.88rem;
  line-height: 1.55;
}
''';

  static const String _tooltipStyles = '''
.kb-tooltip {
  display: inline-flex;
  align-items: center;
  line-height: 1;
}

.kb-tooltip-ready {
  border-bottom: 1px dashed color-mix(in srgb, var(--muted-foreground) 60%, transparent);
  cursor: help;
}
''';

  static const String _inlineIconStyles = '''
.kb-inline-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  vertical-align: middle;
}
''';

  static const String _tagStyles = '''
.kb-tag-list {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.35rem;
}

.kb-tag-list-md {
  gap: 0.45rem;
}

.kb-tag {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.3rem;
  max-width: 100%;
  padding: 0.18rem 0.48rem;
  border: 1px solid color-mix(in srgb, var(--muted-foreground) 14%, transparent);
  border-radius: 999px;
  background: color-mix(in srgb, var(--muted-foreground) 7%, transparent);
  color: var(--muted-foreground);
  font-weight: 500;
  line-height: 1.2;
  white-space: nowrap;
  box-shadow: none;
}

.kb-tag-xs {
  padding: 0.12rem 0.36rem;
  font-size: 0.72rem;
}

.kb-tag-sm {
  font-size: 0.8rem;
}

.kb-tag-md {
  padding: 0.22rem 0.56rem;
  font-size: 0.86rem;
  color: var(--muted-foreground);
}

.kb-tag svg,
.kb-tag i {
  flex-shrink: 0;
  opacity: 0.7;
}

.kb-tags-footer .kb-tag-list {
  row-gap: 0.55rem;
}
''';

  static const String _docUtilityStyles = '''
.kb-kbd {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 1.45rem;
  min-height: 1.35rem;
  padding: 0.12rem 0.36rem;
  border: 1px solid color-mix(in srgb, var(--border) 80%, var(--foreground));
  border-bottom-width: 2px;
  border-radius: var(--radius-sm, 0.25rem);
  background: color-mix(in srgb, var(--muted) 82%, transparent);
  color: var(--foreground);
  font-family: var(--font-mono, monospace);
  font-size: 0.78em;
  font-weight: 600;
  line-height: 1;
  vertical-align: 0.08em;
}

.kb-path {
  display: inline-flex;
  align-items: center;
  gap: 0.32rem;
  max-width: 100%;
  border: 1px solid color-mix(in srgb, var(--border) 76%, transparent);
  border-radius: var(--radius-sm, 0.25rem);
  background: color-mix(in srgb, var(--muted) 72%, transparent);
  color: var(--foreground);
  font-family: var(--font-mono, monospace);
  font-size: 0.86em;
  line-height: 1.15;
  padding: 0.18rem 0.4rem;
  vertical-align: 0.03em;
  overflow-wrap: anywhere;
}

.kb-path-icon {
  display: inline-flex;
  align-items: center;
  color: var(--muted-foreground);
  flex-shrink: 0;
}

.kb-endpoint {
  display: flex;
  align-items: stretch;
  width: 100%;
  margin: 1rem 0;
  border: 1px solid var(--border);
  border-radius: var(--radius-md, 0.5rem);
  background: var(--card);
  overflow: hidden;
}

.kb-endpoint-method {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 4.5rem;
  padding: 0.55rem 0.7rem;
  border-right: 1px solid var(--border);
  color: var(--foreground);
  font-family: var(--font-mono, monospace);
  font-size: 0.76rem;
  font-weight: 800;
}

.kb-endpoint-path {
  min-width: 0;
  flex: 1;
  padding: 0.55rem 0.75rem;
  color: var(--foreground);
  font-family: var(--font-mono, monospace);
  font-size: 0.86rem;
  overflow-wrap: anywhere;
}

.kb-endpoint-get .kb-endpoint-method {
  color: #22c55e;
}

.kb-endpoint-post .kb-endpoint-method {
  color: #3b82f6;
}

.kb-endpoint-put .kb-endpoint-method,
.kb-endpoint-patch .kb-endpoint-method {
  color: #f59e0b;
}

.kb-endpoint-delete .kb-endpoint-method {
  color: #ef4444;
}

.kb-resource-grid {
  --kb-resource-cols: 2;
  display: grid;
  grid-template-columns: repeat(var(--kb-resource-cols), minmax(0, 1fr));
  gap: 0.75rem;
  margin: 1.25rem 0;
}

.kb-resource {
  display: block;
  border: 1px solid var(--border);
  border-radius: var(--radius-md, 0.5rem);
  background: var(--card);
  color: inherit;
  text-decoration: none;
}

.kb-resource-link {
  transition: border-color 0.15s ease, background 0.15s ease, transform 0.15s ease;
}

.kb-resource-link:hover {
  transform: translateY(-1px);
  border-color: color-mix(in srgb, var(--border) 45%, var(--primary));
  background: color-mix(in srgb, var(--card) 88%, var(--accent));
}

.kb-resource-content {
  padding: 0.82rem 0.9rem;
}

.kb-resource-top {
  display: flex;
  align-items: center;
  gap: 0.45rem;
  margin-bottom: 0.55rem;
}

.kb-resource-icon,
.kb-resource-indicator {
  display: inline-flex;
  align-items: center;
  color: var(--muted-foreground);
  flex-shrink: 0;
}

.kb-resource-indicator {
  margin-left: auto;
}

.kb-resource-label {
  border: 1px solid color-mix(in srgb, var(--border) 72%, transparent);
  border-radius: 9999px;
  color: var(--muted-foreground);
  font-size: 0.68rem;
  font-weight: 700;
  line-height: 1;
  padding: 0.2rem 0.36rem;
  text-transform: uppercase;
}

.kb-resource-title {
  color: var(--foreground);
  font-size: 0.92rem;
  font-weight: 700;
  line-height: 1.25;
}

.kb-resource-body {
  margin-top: 0.35rem;
  color: var(--muted-foreground);
  font-size: 0.86rem;
  line-height: 1.5;
}

.kb-resource-body p {
  margin: 0;
}

@media (max-width: 900px) {
  .kb-resource-grid {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 640px) {
  .kb-endpoint {
    flex-direction: column;
  }

  .kb-endpoint-method {
    justify-content: flex-start;
    border-right: 0;
    border-bottom: 1px solid var(--border);
  }
}
''';

  static const String _codeGroupStyles = '''
.kb-code-group {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  margin: 1.5rem 0;
  overflow: hidden;
}

.kb-code-group-title {
  border-bottom: 1px solid var(--border);
  background: color-mix(in srgb, var(--muted) 72%, transparent);
  font-size: 0.78rem;
  line-height: 1;
  letter-spacing: 0.03em;
  text-transform: uppercase;
  color: var(--muted-foreground);
  font-weight: 700;
  padding: 0.5rem 0.7rem;
}

.kb-code-group-body {
  padding: 0;
}

.kb-code-group-body pre {
  border-radius: 0 !important;
  margin: 0;
}

.kb-code-group-body pre + pre {
  border-top: 1px solid var(--border);
}
''';

  static const String _fieldStyles = '''
.kb-field-group {
  margin: 1.5rem 0;
  display: flex;
  flex-direction: column;
  gap: 0.7rem;
}

.kb-field {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  padding: 0.75rem 0.85rem;
}

.kb-field-head {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 0.35rem 0.45rem;
}

.kb-field-name {
  font-size: 0.89rem;
  font-weight: 700;
  color: var(--foreground);
}

.kb-field-type {
  border-radius: 9999px;
  border: 1px solid color-mix(in srgb, var(--border) 70%, transparent);
  background: color-mix(in srgb, var(--muted) 70%, transparent);
  color: var(--muted-foreground);
  font-size: 0.74rem;
  line-height: 1;
  padding: 0.25rem 0.45rem;
}

.kb-field-badge {
  border-radius: 9999px;
  border: 1px solid color-mix(in srgb, var(--border) 70%, transparent);
  font-size: 0.72rem;
  line-height: 1;
  padding: 0.22rem 0.42rem;
  text-transform: uppercase;
  letter-spacing: 0.02em;
  font-weight: 700;
}

.kb-field-location {
  color: color-mix(in srgb, var(--primary) 70%, var(--foreground));
  border-color: color-mix(in srgb, var(--primary) 30%, var(--border));
}

.kb-field-required {
  color: #ef4444;
  border-color: color-mix(in srgb, #ef4444 30%, var(--border));
}

.kb-field-body {
  margin-top: 0.5rem;
  color: var(--muted-foreground);
  font-size: 0.87rem;
  line-height: 1.55;
}
''';

  static const String _treeStyles = '''
.kb-tree {
  margin: 1.5rem 0;
  padding-left: 0;
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 0.3rem;
}

.kb-tree-item {
  list-style: none;
}

.kb-tree-folder-details {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  overflow: hidden;
}

.kb-tree-folder-summary {
  list-style: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.55rem 0.7rem;
}

.kb-tree-folder-summary::-webkit-details-marker {
  display: none;
}

.kb-tree-folder-label {
  font-size: 0.87rem;
  line-height: 1.25;
  color: var(--foreground);
  font-weight: 600;
}

.kb-tree-folder-chevron {
  margin-left: auto;
  color: var(--muted-foreground);
  transition: transform 0.16s ease;
}

.kb-tree-folder-details[open] .kb-tree-folder-chevron {
  transform: rotate(180deg);
}

.kb-tree-branch {
  list-style: none;
  margin: 0;
  padding: 0 0.6rem 0.6rem 0.95rem;
  display: flex;
  flex-direction: column;
  gap: 0.3rem;
}

.kb-tree-file-row {
  display: flex;
  align-items: center;
  gap: 0.38rem;
  border: 1px solid color-mix(in srgb, var(--border) 70%, transparent);
  border-radius: var(--radius-md, 0.5rem);
  background: color-mix(in srgb, var(--muted) 72%, transparent);
  padding: 0.42rem 0.55rem;
}

.kb-tree-file-label {
  font-size: 0.84rem;
  color: var(--muted-foreground);
}

.kb-tree-file-extra {
  margin-left: 1.65rem;
  margin-top: 0.35rem;
  font-size: 0.84rem;
  color: var(--muted-foreground);
}
''';

  static const String _colorStyles = '''
.kb-color-grid {
  margin: 1.5rem 0;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 0.75rem;
}

.kb-color-item {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  overflow: hidden;
}

.kb-color-swatch {
  height: 3.1rem;
  border-bottom: 1px solid var(--border);
}

.kb-color-meta {
  padding: 0.6rem 0.7rem;
}

.kb-color-label {
  color: var(--foreground);
  font-size: 0.84rem;
  font-weight: 700;
  line-height: 1.2;
}

.kb-color-value {
  margin-top: 0.24rem;
  color: var(--muted-foreground);
  font-size: 0.78rem;
  line-height: 1.2;
  font-family: var(--font-mono, monospace);
}

.kb-color-extra {
  margin-top: 0.45rem;
  color: var(--muted-foreground);
  font-size: 0.82rem;
}
''';

  static const String _viewStyles = '''
.kb-view {
  border: 1px solid var(--border);
  border-radius: var(--radius-lg, 0.75rem);
  background: var(--card);
  margin: 1.5rem 0;
  overflow: hidden;
}

.kb-view-title {
  border-bottom: 1px solid var(--border);
  display: inline-flex;
  align-items: center;
  gap: 0.45rem;
  width: 100%;
  color: var(--foreground);
  font-size: 0.86rem;
  line-height: 1.2;
  font-weight: 700;
  background: color-mix(in srgb, var(--muted) 72%, transparent);
  padding: 0.6rem 0.75rem;
}

.kb-view-icon {
  color: var(--muted-foreground);
  display: inline-flex;
}

.kb-view-body {
  padding: 0.8rem 0.9rem;
}
''';

  static const String _lightThemeReadability = '''
html.light .prose p,
html.light .prose li,
html.light .prose blockquote,
#arcane-root.light .prose p,
#arcane-root.light .prose li,
#arcane-root.light .prose blockquote {
  color: var(--foreground);
}

html.light .prose li::marker,
#arcane-root.light .prose li::marker {
  color: color-mix(in srgb, var(--foreground) 70%, transparent);
}

html.light .sidebar-brand-title,
html.light .sidebar-section-header,
html.light .sidebar-summary,
html.light .sidebar-link,
html.light .sidebar-chevron,
#arcane-root.light .sidebar-brand-title,
#arcane-root.light .sidebar-section-header,
#arcane-root.light .sidebar-summary,
#arcane-root.light .sidebar-link,
#arcane-root.light .sidebar-chevron {
  color: var(--foreground);
}

html.light .toc-title,
html.light .toc-content a,
#arcane-root.light .toc-title,
#arcane-root.light .toc-content a {
  color: var(--foreground);
}

html.light .kb-topbar-brand,
html.light .kb-topbar-link,
#arcane-root.light .kb-topbar-brand,
#arcane-root.light .kb-topbar-link {
  color: var(--foreground);
}

html.light .kb-topbar-link.active,
#arcane-root.light .kb-topbar-link.active {
  color: var(--foreground);
}

html.light .kb-callout-content,
html.light .markdown-alert p,
#arcane-root.light .kb-callout-content,
#arcane-root.light .markdown-alert p {
  color: var(--foreground);
}

html.light .prose th,
html.light .prose td,
#arcane-root.light .prose th,
#arcane-root.light .prose td {
  color: var(--foreground);
}
''';

  static const String _neonLexiconStyles = '''
#arcane-root[class*="neon-"] {
  --kb-neon-dock-top: 0.7rem;
  --kb-neon-dock-height: 2.75rem;
  --kb-neon-dock-clearance: 4.85rem;
  --kb-neon-ink: var(--foreground);
  --kb-neon-muted: var(--muted-foreground);
  --kb-neon-panel: color-mix(in srgb, var(--background) 78%, transparent);
  --kb-neon-panel-strong: color-mix(in srgb, var(--card) 86%, transparent);
  --kb-neon-panel-faint: color-mix(in srgb, var(--card) 48%, transparent);
  --kb-neon-line: color-mix(in srgb, var(--neon-cyan) 24%, var(--border));
  --kb-neon-line-soft: color-mix(in srgb, var(--neon-cyan) 14%, var(--border));
  --kb-neon-node: var(--neon-cyan);
  --kb-neon-node-soft: color-mix(in srgb, var(--neon-cyan) 18%, transparent);
  --kb-neon-node-alt: color-mix(in srgb, var(--primary) 72%, var(--neon-cyan));
  --kb-neon-hazard: color-mix(in srgb, var(--neon-magenta) 70%, var(--primary));
  --kb-neon-clip-lg: polygon(0 1rem, 1rem 0, 100% 0, 100% calc(100% - 1rem), calc(100% - 1rem) 100%, 0 100%);
  --kb-neon-clip-md: polygon(0 0.7rem, 0.7rem 0, 100% 0, 100% calc(100% - 0.7rem), calc(100% - 0.7rem) 100%, 0 100%);
  --kb-neon-clip-sm: polygon(0 0.45rem, 0.45rem 0, 100% 0, 100% calc(100% - 0.45rem), calc(100% - 0.45rem) 100%, 0 100%);
  --kb-neon-shadow-panel: 0 22px 70px rgba(0, 0, 0, 0.34), 0 0 32px color-mix(in srgb, var(--primary) 10%, transparent);
  --kb-neon-shadow-soft: 0 0 22px color-mix(in srgb, var(--neon-cyan) 10%, transparent);
}

html.light #arcane-root[class*="neon-"],
#arcane-root.light[class*="neon-"] {
  --background: #f3f6fb;
  --foreground: #101a3a;
  --card: #fbfdff;
  --card-foreground: #101a3a;
  --popover: #ffffff;
  --popover-foreground: #101a3a;
  --muted: #e8eefb;
  --muted-foreground: #52638d;
  --border: #c6d4f6;
  --input: #b7c8f2;
  --primary: #244ed1;
  --primary-rgb: 36, 78, 209;
  --primary-foreground: #ffffff;
  --accent: #e7eefc;
  --accent-foreground: #173a9f;
  --ring: #244ed1;
  --neon-cyan: #84a5f2;
  --neon-green: #1d8f73;
  --neon-magenta: #7a4ce0;
  --neon-purple: #4d42c9;
  --neon-orange: #ff6600;
  --neon-red: #c83136;
  --kb-neon-ink: #101a3a;
  --kb-neon-muted: #52638d;
  --kb-neon-panel: rgba(243, 246, 251, 0.82);
  --kb-neon-panel-strong: rgba(255, 255, 255, 0.94);
  --kb-neon-panel-faint: rgba(226, 235, 254, 0.74);
  --kb-neon-line: rgba(36, 78, 209, 0.24);
  --kb-neon-line-soft: rgba(36, 78, 209, 0.12);
  --kb-neon-node: #244ed1;
  --kb-neon-node-soft: rgba(132, 165, 242, 0.18);
  --kb-neon-node-alt: #173a9f;
  --kb-neon-hazard: #ff6600;
  --kb-neon-shadow-panel: 0 18px 42px rgba(36, 78, 209, 0.12), 0 1px 0 rgba(255, 255, 255, 0.95);
  --kb-neon-shadow-soft: 0 10px 24px rgba(36, 78, 209, 0.1);
}

#arcane-root[class*="neon-"] .kb-page-shell {
  background:
    radial-gradient(circle at 8% 8%, color-mix(in srgb, var(--primary) 8%, transparent), transparent 30rem),
    radial-gradient(circle at 88% 12%, color-mix(in srgb, var(--neon-cyan) 7%, transparent), transparent 32rem),
    transparent;
}

html.dark #arcane-root[class*="neon-"]::before {
  background-image:
    radial-gradient(circle at 18% 8%, color-mix(in srgb, var(--primary) 10%, transparent), transparent 30rem),
    radial-gradient(circle at 82% 2%, color-mix(in srgb, var(--neon-cyan) 6%, transparent), transparent 32rem),
    radial-gradient(circle at 70% 78%, color-mix(in srgb, var(--neon-magenta) 4%, transparent), transparent 36rem),
    linear-gradient(color-mix(in srgb, var(--primary) 4%, transparent) 1px, transparent 1px),
    linear-gradient(90deg, color-mix(in srgb, var(--primary) 4%, transparent) 1px, transparent 1px) !important;
  background-size: auto, auto, auto, 96px 96px, 96px 96px !important;
}

html.dark #arcane-root[class*="neon-"]::after {
  opacity: 0.045 !important;
  background:
    linear-gradient(rgba(255,255,255,0.018) 1px, transparent 1px) !important;
  background-size: 100% 6px !important;
}

html.light #arcane-root[class*="neon-"] .kb-page-shell,
#arcane-root.light[class*="neon-"] .kb-page-shell {
  background:
    radial-gradient(circle at 10% 8%, rgba(132, 165, 242, 0.2), transparent 25rem),
    radial-gradient(circle at 92% 12%, rgba(36, 78, 209, 0.12), transparent 26rem),
    radial-gradient(circle at 78% 86%, rgba(255, 102, 0, 0.07), transparent 25rem),
    linear-gradient(135deg, #f3f6fb 0%, #eef3fd 46%, #fbfdff 100%);
}

#arcane-root[class*="neon-"] .arcane-scaffold {
  grid-template-rows: auto minmax(0, 1fr) auto !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-header {
  position: relative !important;
  top: auto !important;
  z-index: 5 !important;
  height: var(--kb-neon-dock-height) !important;
  min-height: var(--kb-neon-dock-height) !important;
  margin: var(--kb-neon-dock-top) 0.85rem 0 0.85rem !important;
  padding: 0 !important;
  border: 0 !important;
  background: transparent !important;
  box-shadow: none !important;
  backdrop-filter: none !important;
  -webkit-backdrop-filter: none !important;
  pointer-events: none;
}

#arcane-root[class*="neon-"] .arcane-scaffold-navigation {
  width: 100%;
  pointer-events: none;
}

#arcane-root[class*="neon-"] .arcane-scaffold-body {
  grid-template-columns: 17.6rem minmax(0, 1fr) !important;
  align-items: start !important;
  padding: 0.85rem !important;
  gap: 0.85rem !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-sidebar.arcane-scaffold-sidebar {
  position: sticky !important;
  top: 0.85rem !important;
  align-self: start !important;
  width: 17.6rem !important;
  height: calc(100vh - var(--kb-neon-dock-clearance) - 0.85rem) !important;
  max-height: calc(100vh - var(--kb-neon-dock-clearance) - 0.85rem) !important;
  padding: 0 !important;
  border: 1px solid var(--kb-neon-line-soft) !important;
  border-radius: 0.55rem !important;
  clip-path: var(--kb-neon-clip-lg) !important;
  background:
    linear-gradient(180deg, color-mix(in srgb, var(--kb-neon-panel-strong) 80%, transparent), var(--kb-neon-panel) 44%, color-mix(in srgb, var(--background) 70%, transparent)),
    radial-gradient(circle at 10% 0%, color-mix(in srgb, var(--primary) 8%, transparent), transparent 16rem) !important;
  box-shadow: var(--kb-neon-shadow-panel) !important;
  backdrop-filter: blur(12px) !important;
  -webkit-backdrop-filter: blur(12px) !important;
  overflow: hidden !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-sidebar .kb-sidebar {
  height: 100%;
  min-height: 0;
}

#arcane-root[class*="neon-"] .arcane-scaffold-sidebar .neon-scroll-rail {
  position: relative !important;
  top: 0 !important;
  width: 100% !important;
  height: 100% !important;
  max-height: 100% !important;
  background: transparent !important;
  border-right: 0 !important;
  scrollbar-color: color-mix(in srgb, var(--kb-neon-node) 36%, transparent) transparent !important;
  overflow-y: auto !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-sidebar .neon-scroll-rail::-webkit-scrollbar-thumb {
  background: color-mix(in srgb, var(--kb-neon-node) 36%, transparent) !important;
  border: 3px solid transparent !important;
  background-clip: padding-box !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-sidebar .neon-scroll-rail > div {
  min-height: auto !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-main.arcane-scaffold-main {
  padding: 0 !important;
  border: 1px solid var(--kb-neon-line-soft) !important;
  border-left-color: transparent !important;
  border-radius: 0.55rem !important;
  clip-path: var(--kb-neon-clip-lg) !important;
  background:
    linear-gradient(180deg, color-mix(in srgb, var(--kb-neon-panel-strong) 80%, transparent), var(--kb-neon-panel) 54%, color-mix(in srgb, var(--background) 70%, transparent)),
    radial-gradient(circle at 96% 0%, color-mix(in srgb, var(--neon-magenta) 5%, transparent), transparent 18rem),
    radial-gradient(circle at 0% 0%, color-mix(in srgb, var(--primary) 5%, transparent), transparent 16rem) !important;
  box-shadow: var(--kb-neon-shadow-panel) !important;
  backdrop-filter: none !important;
  -webkit-backdrop-filter: none !important;
  overflow: visible !important;
}

#arcane-root[class*="neon-"] .arcane-scaffold-main.arcane-scaffold-main::before {
  content: none !important;
  display: none !important;
}

#arcane-root[class*="neon-"] .kb-topbar {
  position: static;
  width: 100%;
  max-width: none;
  margin-left: 0;
  border: 0;
  background: transparent;
  box-shadow: none;
  backdrop-filter: none;
  -webkit-backdrop-filter: none;
  pointer-events: auto;
}

#arcane-root[class*="neon-"] .kb-topbar-inner {
  height: var(--kb-neon-dock-height);
  min-height: var(--kb-neon-dock-height);
  padding: 0;
  gap: 0.65rem;
  justify-content: space-between;
  clip-path: none;
  border: 0;
  border-radius: 0;
  background: transparent;
  box-shadow: none;
  backdrop-filter: none;
  -webkit-backdrop-filter: none;
}

#arcane-root[class*="neon-"] .kb-topbar-left,
#arcane-root[class*="neon-"] .kb-topbar-right {
  flex: 0 1 auto;
  gap: 0.3rem;
  height: var(--kb-neon-dock-height);
  padding: 0.28rem;
  clip-path: var(--kb-neon-clip-sm);
  border: 1px solid var(--kb-neon-line);
  border-radius: 0.3rem;
  background:
    linear-gradient(135deg, color-mix(in srgb, var(--kb-neon-panel-strong) 86%, transparent), color-mix(in srgb, var(--kb-neon-panel) 84%, transparent)),
    linear-gradient(90deg, color-mix(in srgb, var(--neon-magenta) 4%, transparent), transparent 38%, color-mix(in srgb, var(--primary) 5%, transparent));
  box-shadow: var(--kb-neon-shadow-panel);
  backdrop-filter: blur(18px) saturate(1.06);
  -webkit-backdrop-filter: blur(18px) saturate(1.06);
}

#arcane-root[class*="neon-"] .kb-topbar-left {
  flex: 0 1 auto;
  min-width: max-content;
  overflow: visible;
}

#arcane-root[class*="neon-"] .kb-topbar-right {
  flex: 0 0 auto;
  margin-left: auto;
  justify-content: flex-end;
}

#arcane-root[class*="neon-"] .kb-topbar-nav {
  margin-left: 0;
  gap: 0.25rem;
}

#arcane-root[class*="neon-"] .kb-topbar-brand {
  flex: 0 0 auto;
  width: auto;
  min-width: 0;
  height: 2.05rem;
  padding: 0 0.7rem 0 0.42rem;
  justify-content: flex-start;
  gap: 0.52rem;
  clip-path: var(--kb-neon-clip-sm);
  border: 1px solid var(--kb-neon-line);
  background:
    linear-gradient(90deg, color-mix(in srgb, var(--primary) 10%, transparent), var(--kb-neon-panel-strong) 68%, color-mix(in srgb, var(--neon-cyan) 5%, transparent));
  color: var(--kb-neon-node-alt);
  text-transform: uppercase;
  letter-spacing: 0;
  box-shadow: var(--kb-neon-shadow-soft);
}

#arcane-root[class*="neon-"] .kb-topbar-brand-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  flex: 0 0 auto;
  width: 1.35rem;
  height: 1.35rem;
  clip-path: var(--kb-neon-clip-sm);
  border: 1px solid var(--kb-neon-line);
  background:
    linear-gradient(135deg, var(--kb-neon-node-soft), color-mix(in srgb, var(--kb-neon-panel-strong) 80%, transparent));
  box-shadow:
    inset 0 -1px 0 var(--kb-neon-node),
    0 0 14px color-mix(in srgb, var(--kb-neon-node) 12%, transparent);
}

#arcane-root[class*="neon-"] .kb-topbar-brand-label {
  display: inline;
  min-width: 0;
  overflow: visible;
  color: var(--kb-neon-node-alt);
  font-size: 0.76rem;
  font-weight: 760;
  line-height: 1;
  text-overflow: clip;
  text-shadow: 0 0 14px color-mix(in srgb, var(--primary) 18%, transparent);
  white-space: nowrap;
}

#arcane-root[class*="neon-"] .kb-topbar-link,
#arcane-root[class*="neon-"] .kb-topbar-github,
#arcane-root[class*="neon-"] .kb-theme-toggle,
#arcane-root[class*="neon-"] .kb-stylesheet-select,
#arcane-root[class*="neon-"] .kb-hamburger {
  clip-path: var(--kb-neon-clip-sm);
  border-radius: 0.25rem;
  border: 1px solid var(--kb-neon-line-soft);
  background:
    linear-gradient(135deg, var(--kb-neon-node-soft), var(--kb-neon-panel));
  color: var(--kb-neon-ink);
  letter-spacing: 0;
}

#arcane-root[class*="neon-"] .kb-topbar-link {
  height: 2.05rem;
  padding: 0 0.55rem;
  font-size: 0.78rem;
}

#arcane-root[class*="neon-"] .kb-topbar-github,
#arcane-root[class*="neon-"] .kb-theme-toggle,
#arcane-root[class*="neon-"] .kb-hamburger {
  width: 2.05rem;
  height: 2.05rem;
}

#arcane-root[class*="neon-"] .kb-stylesheet-select {
  height: 2.05rem;
  min-width: 6.5rem;
}

#arcane-root[class*="neon-"] .kb-topbar-link:hover,
#arcane-root[class*="neon-"] .kb-topbar-link.active,
#arcane-root[class*="neon-"] .kb-topbar-github:hover,
#arcane-root[class*="neon-"] .kb-theme-toggle:hover,
#arcane-root[class*="neon-"] .kb-stylesheet-select:hover,
#arcane-root[class*="neon-"] .kb-hamburger:hover {
  background:
    linear-gradient(90deg, var(--kb-neon-node-soft), color-mix(in srgb, var(--primary) 12%, transparent));
  border-color: var(--kb-neon-line);
  color: var(--kb-neon-node-alt);
  box-shadow:
    inset 0 -2px 0 var(--kb-neon-node),
    var(--kb-neon-shadow-soft);
}

#arcane-root[class*="neon-"] .kb-search-input {
  width: 100%;
  height: 2.05rem;
  clip-path: var(--kb-neon-clip-sm);
  border-radius: 0.25rem;
  border: 1px solid var(--kb-neon-line);
  background:
    linear-gradient(135deg, color-mix(in srgb, var(--kb-neon-panel-strong) 88%, transparent), color-mix(in srgb, var(--kb-neon-panel) 86%, transparent));
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.08),
    0 0 0 1px color-mix(in srgb, var(--kb-neon-node) 4%, transparent);
}

#arcane-root[class*="neon-"] .kb-topbar-right .kb-search {
  flex: 0 0 auto;
  width: clamp(13rem, 22vw, 18rem);
}

#arcane-root[class*="neon-"] .search-results {
  clip-path: var(--kb-neon-clip-md);
  border-radius: 0.375rem;
  border: 1px solid var(--kb-neon-line);
  background:
    linear-gradient(135deg, color-mix(in srgb, var(--kb-neon-panel-strong) 92%, transparent), color-mix(in srgb, var(--kb-neon-panel) 90%, transparent));
  box-shadow: var(--kb-neon-shadow-panel);
}

#arcane-root[class*="neon-"] .kb-content-area {
  max-width: none;
  align-items: flex-start;
  gap: 1rem;
  padding: clamp(1rem, 1.8vw, 1.55rem);
}

#arcane-root[class*="neon-"] .kb-article-panel {
  position: relative;
  min-width: 0;
  max-width: min(100%, 58rem);
  padding: clamp(0.25rem, 0.9vw, 0.75rem);
  clip-path: none;
  border-radius: 0;
  border: 0;
  background: transparent;
  box-shadow: none;
  backdrop-filter: none;
  -webkit-backdrop-filter: none;
}

#arcane-root[class*="neon-"] .kb-article-panel::before {
  content: none;
  display: none;
}

#arcane-root[class*="neon-"] .kb-page-metadata,
#arcane-root[class*="neon-"] .kb-tags-footer,
#arcane-root[class*="neon-"] .kb-page-nav {
  border-color: color-mix(in srgb, var(--neon-cyan) 18%, var(--border));
}

#arcane-root[class*="neon-"] .kb-page-nav-link {
  clip-path: var(--kb-neon-clip-md);
  border-radius: 0.375rem;
  border-color: var(--kb-neon-line);
  background:
    linear-gradient(135deg, color-mix(in srgb, var(--primary) 5%, transparent), var(--kb-neon-panel-strong)),
    linear-gradient(90deg, var(--kb-neon-line-soft) 1px, transparent 1px);
  background-size: auto, 18px 18px;
  box-shadow: var(--kb-neon-shadow-soft);
}

#arcane-root[class*="neon-"] .kb-page-nav-link:hover {
  border-color: var(--kb-neon-line);
  background:
    linear-gradient(135deg, var(--kb-neon-node-soft), color-mix(in srgb, var(--primary) 7%, transparent));
  box-shadow: var(--kb-neon-shadow-soft);
}

#arcane-root[class*="neon-"] .sidebar-header {
  border-bottom-color: var(--kb-neon-line);
  background:
    linear-gradient(135deg, var(--kb-neon-node-soft), transparent 64%),
    linear-gradient(180deg, color-mix(in srgb, var(--kb-neon-panel-strong) 76%, transparent), transparent);
}

#arcane-root[class*="neon-"] .sidebar-brand-title {
  color: var(--kb-neon-node-alt);
  text-transform: uppercase;
  letter-spacing: 0;
  text-shadow: 0 0 18px color-mix(in srgb, var(--primary) 16%, transparent);
}

#arcane-root[class*="neon-"] .sidebar-section-header,
#arcane-root[class*="neon-"] .sidebar-summary {
  color: var(--kb-neon-ink);
  text-transform: uppercase;
  letter-spacing: 0;
}

#arcane-root[class*="neon-"] .sidebar-nav {
  padding: 0.7rem !important;
  gap: 0.35rem !important;
}

#arcane-root[class*="neon-"] .sidebar-tree {
  margin-left: 0;
  padding-left: 0.9rem;
  gap: 0.15rem;
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-tree {
  position: relative;
  padding-left: 1.12rem;
}

#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-tree-item,
#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-section {
  position: relative;
}

#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-tree-item::before,
#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-section::before {
  content: '';
  position: absolute;
  left: -0.72rem;
  top: 1.05rem;
  width: 0.42rem !important;
  height: 0.42rem !important;
  background: var(--kb-neon-panel-strong) !important;
  border: 1px solid var(--kb-neon-line) !important;
  transform: rotate(45deg);
  box-shadow: 0 0 0 3px var(--kb-neon-node-soft);
  z-index: 2;
}

#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-tree-item::after,
#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-section::after {
  content: '';
  position: absolute;
  left: -0.52rem !important;
  top: 1.55rem !important;
  bottom: -0.55rem !important;
  width: 1px !important;
  height: auto !important;
  background: linear-gradient(180deg, var(--kb-neon-line), transparent) !important;
  opacity: 0.76;
  z-index: 1;
}

#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-tree-item:last-child::after,
#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-section:last-child::after {
  display: none !important;
}

#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-section::before {
  border-color: color-mix(in srgb, var(--kb-neon-hazard) 42%, var(--kb-neon-line)) !important;
  box-shadow: 0 0 0 3px color-mix(in srgb, var(--kb-neon-hazard) 10%, transparent);
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-section {
  border: 0 !important;
  background: transparent !important;
  margin: 0.1rem 0 0.1rem 0;
  padding: 0;
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-details[open] > .sidebar-tree {
  margin-top: 0.16rem;
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-details[open] > .sidebar-tree::before {
  content: '' !important;
  display: block !important;
  position: absolute;
  left: 0.42rem;
  top: 0.1rem;
  bottom: 0.5rem;
  width: 1px;
  background:
    linear-gradient(180deg, transparent, var(--kb-neon-line) 18%, var(--kb-neon-line) 74%, transparent);
  opacity: 0.72;
}

#arcane-root[class*="neon-"] .sidebar-link,
#arcane-root[class*="neon-"] .sidebar-summary {
  position: relative;
  clip-path: var(--kb-neon-clip-sm);
  border-radius: 0.25rem;
  border: 1px solid transparent;
  transition: background 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease, color 0.15s ease;
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-link,
#arcane-root[class*="neon-"] .sidebar-tree .sidebar-summary {
  min-height: 2rem;
  margin: 0;
  padding: 0.45rem 0.65rem 0.45rem 1.25rem !important;
  color: var(--kb-neon-muted);
  background:
    linear-gradient(90deg, transparent, color-mix(in srgb, var(--kb-neon-panel-faint) 76%, transparent));
  border-color: transparent;
  border-left: 0 !important;
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-summary {
  font-size: 0.72rem;
  font-weight: 650;
  color: color-mix(in srgb, var(--kb-neon-ink) 74%, var(--kb-neon-node-alt));
  background:
    linear-gradient(90deg, color-mix(in srgb, var(--kb-neon-hazard) 8%, transparent), var(--kb-neon-panel-faint));
  border-color: color-mix(in srgb, var(--kb-neon-hazard) 18%, transparent);
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-link::before,
#arcane-root[class*="neon-"] .sidebar-tree .sidebar-summary::before {
  content: '';
  position: absolute;
  left: 0.42rem;
  top: 50%;
  width: 0.36rem;
  height: 0.36rem;
  border: 1px solid var(--kb-neon-line);
  background: color-mix(in srgb, var(--kb-neon-panel-strong) 82%, transparent);
  transform: translateY(-50%) rotate(45deg);
  box-shadow: 0 0 8px color-mix(in srgb, var(--kb-neon-node) 12%, transparent);
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-link::after,
#arcane-root[class*="neon-"] .sidebar-tree .sidebar-summary::after {
  content: '';
  position: absolute;
  left: 0.77rem;
  top: 50%;
  width: 0.26rem;
  height: 1px;
  background: var(--kb-neon-line);
  transform: translateY(-50%);
  opacity: 0.78;
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-tree .sidebar-link::before {
  width: 0.3rem;
  height: 0.3rem;
  border-radius: 999px;
  transform: translateY(-50%);
}

#arcane-root[class*="neon-"] .sidebar-tree .sidebar-tree .sidebar-summary::before {
  width: 0.34rem;
  height: 0.34rem;
  border-color: color-mix(in srgb, var(--kb-neon-hazard) 36%, var(--kb-neon-line));
  background:
    linear-gradient(135deg, color-mix(in srgb, var(--kb-neon-hazard) 18%, transparent), color-mix(in srgb, var(--kb-neon-panel-strong) 78%, transparent));
}

#arcane-root[class*="neon-"] .sidebar-link:hover,
#arcane-root[class*="neon-"] .sidebar-summary:hover,
#arcane-root[class*="neon-"] .sidebar-link.active {
  background:
    linear-gradient(90deg, var(--kb-neon-node-soft), color-mix(in srgb, var(--primary) 7%, transparent));
  border-color: color-mix(in srgb, var(--kb-neon-node) 56%, var(--kb-neon-line));
  color: var(--kb-neon-node-alt);
  box-shadow:
    inset 0 -1px 0 var(--kb-neon-node),
    0 0 0 1px color-mix(in srgb, var(--kb-neon-node) 18%, transparent),
    0 0 18px color-mix(in srgb, var(--kb-neon-node) 14%, transparent),
    var(--kb-neon-shadow-soft);
}

#arcane-root[class*="neon-"] .sidebar-link:hover::before,
#arcane-root[class*="neon-"] .sidebar-summary:hover::before,
#arcane-root[class*="neon-"] .sidebar-link.active::before {
  border-color: var(--kb-neon-node);
  background: var(--kb-neon-node);
  box-shadow:
    0 0 0 3px var(--kb-neon-node-soft),
    0 0 14px color-mix(in srgb, var(--kb-neon-node) 34%, transparent);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-main.arcane-scaffold-main,
#arcane-root.light[class*="neon-"] .arcane-scaffold-main.arcane-scaffold-main {
  background:
    linear-gradient(180deg, rgba(255, 255, 255, 0.9), rgba(243, 246, 251, 0.78) 58%, rgba(255, 255, 255, 0.88)),
    radial-gradient(circle at 96% 0%, rgba(255, 102, 0, 0.055), transparent 17rem),
    radial-gradient(circle at 0% 0%, rgba(132, 165, 242, 0.16), transparent 18rem) !important;
  border-color: rgba(36, 78, 209, 0.13) !important;
  box-shadow:
    0 18px 42px rgba(36, 78, 209, 0.1),
    0 1px 0 rgba(255, 255, 255, 0.95) !important;
}

html.light #arcane-root[class*="neon-"] .kb-topbar-left,
html.light #arcane-root[class*="neon-"] .kb-topbar-right,
#arcane-root.light[class*="neon-"] .kb-topbar-left,
#arcane-root.light[class*="neon-"] .kb-topbar-right {
  background:
    linear-gradient(135deg, rgba(255, 255, 255, 0.88), rgba(243, 246, 251, 0.78)),
    linear-gradient(90deg, rgba(132, 165, 242, 0.12), transparent 42%, rgba(255, 102, 0, 0.045));
  border-color: rgba(36, 78, 209, 0.18);
  box-shadow:
    0 14px 34px rgba(36, 78, 209, 0.11),
    0 1px 0 rgba(255, 255, 255, 0.95);
}

html.light #arcane-root[class*="neon-"] .kb-topbar-brand,
#arcane-root.light[class*="neon-"] .kb-topbar-brand {
  background:
    linear-gradient(90deg, rgba(132, 165, 242, 0.22), rgba(255, 255, 255, 0.88) 58%, rgba(255, 102, 0, 0.055));
  border-color: rgba(36, 78, 209, 0.24);
  color: #173a9f;
}

html.light #arcane-root[class*="neon-"] .kb-topbar-link,
html.light #arcane-root[class*="neon-"] .kb-topbar-github,
html.light #arcane-root[class*="neon-"] .kb-theme-toggle,
html.light #arcane-root[class*="neon-"] .kb-stylesheet-select,
html.light #arcane-root[class*="neon-"] .kb-hamburger,
#arcane-root.light[class*="neon-"] .kb-topbar-link,
#arcane-root.light[class*="neon-"] .kb-topbar-github,
#arcane-root.light[class*="neon-"] .kb-theme-toggle,
#arcane-root.light[class*="neon-"] .kb-stylesheet-select,
#arcane-root.light[class*="neon-"] .kb-hamburger {
  background:
    linear-gradient(135deg, rgba(132, 165, 242, 0.12), rgba(255, 255, 255, 0.82));
  border-color: rgba(36, 78, 209, 0.14);
  color: #101a3a;
}

html.light #arcane-root[class*="neon-"] .kb-search-input,
#arcane-root.light[class*="neon-"] .kb-search-input {
  background:
    linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(243, 246, 251, 0.86));
  border-color: rgba(36, 78, 209, 0.24);
  box-shadow:
    inset 0 1px 0 rgba(255, 255, 255, 0.88),
    0 0 0 1px rgba(132, 165, 242, 0.1);
}

html.light #arcane-root[class*="neon-"] .search-results,
#arcane-root.light[class*="neon-"] .search-results {
  background:
    linear-gradient(135deg, rgba(255, 255, 255, 0.96), rgba(243, 246, 251, 0.92));
  border-color: rgba(36, 78, 209, 0.2);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar.arcane-scaffold-sidebar,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar.arcane-scaffold-sidebar {
  background:
    radial-gradient(circle at 14% 0%, rgba(132, 165, 242, 0.22), transparent 15rem),
    radial-gradient(circle at 92% 100%, rgba(255, 102, 0, 0.055), transparent 16rem),
    linear-gradient(180deg, rgba(255, 255, 255, 0.94), rgba(243, 246, 251, 0.86) 54%, rgba(255, 255, 255, 0.9)) !important;
  border-color: rgba(36, 78, 209, 0.16) !important;
  box-shadow:
    0 18px 42px rgba(36, 78, 209, 0.11),
    0 0 18px rgba(132, 165, 242, 0.08) !important;
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-header,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-header {
  border-bottom-color: rgba(36, 78, 209, 0.15);
  background:
    linear-gradient(135deg, rgba(132, 165, 242, 0.18), transparent 62%),
    linear-gradient(180deg, rgba(255, 255, 255, 0.82), transparent);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-brand-title,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-brand-title {
  color: #173a9f;
  text-shadow: 0 0 12px rgba(36, 78, 209, 0.1);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-brand-subtitle,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-section-header,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-brand-subtitle,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-section-header {
  color: rgba(25, 42, 89, 0.7);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-summary,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-summary {
  color: rgba(16, 26, 58, 0.88);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-link,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-link {
  color: rgba(25, 42, 89, 0.72);
  background:
    linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.68));
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-summary,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-summary {
  color: rgba(23, 58, 159, 0.92);
  background:
    linear-gradient(90deg, rgba(255, 102, 0, 0.065), rgba(255, 255, 255, 0.72));
  border-color: rgba(255, 102, 0, 0.14);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-link:hover,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-summary:hover,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-link.active,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-link:hover,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-summary:hover,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-link.active {
  color: #173a9f;
  background:
    linear-gradient(90deg, rgba(132, 165, 242, 0.26), rgba(255, 255, 255, 0.8));
  border-color: rgba(36, 78, 209, 0.36);
  box-shadow:
    inset 0 -1px 0 rgba(36, 78, 209, 0.34),
    0 0 0 1px rgba(132, 165, 242, 0.14),
    0 0 14px rgba(36, 78, 209, 0.09);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-tree-item::before,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-section::before,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-tree-item::before,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-section::before {
  background: rgba(255, 255, 255, 0.9) !important;
  border-color: rgba(36, 78, 209, 0.34) !important;
  box-shadow: 0 0 0 3px rgba(132, 165, 242, 0.1);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-tree-item::after,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-section::after,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-tree-item::after,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree > .sidebar-section::after {
  background: linear-gradient(180deg, rgba(36, 78, 209, 0.22), transparent) !important;
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-link::before,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-summary::before,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-link::before,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-summary::before {
  background: rgba(255, 255, 255, 0.92);
  border-color: rgba(36, 78, 209, 0.3);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-link::after,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-summary::after,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-link::after,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-tree .sidebar-summary::after {
  background: rgba(36, 78, 209, 0.24);
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-icon,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-chevron,
html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .sidebar-chevron-icon,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-icon,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-chevron,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .sidebar-chevron-icon {
  color: currentColor;
  opacity: 0.9;
}

html.light #arcane-root[class*="neon-"] .arcane-scaffold-sidebar .kb-stylesheet-select,
#arcane-root.light[class*="neon-"] .arcane-scaffold-sidebar .kb-stylesheet-select {
  color: #173a9f;
  background: rgba(255, 255, 255, 0.88);
  border-color: rgba(36, 78, 209, 0.2);
}

#arcane-root[class*="neon-"] .sidebar-tree > .sidebar-tree-item:has(.sidebar-link.active)::before {
  background: var(--kb-neon-node) !important;
  border-color: var(--kb-neon-node) !important;
  box-shadow:
    0 0 0 3px var(--kb-neon-node-soft),
    0 0 16px color-mix(in srgb, var(--kb-neon-node) 30%, transparent);
}

#arcane-root[class*="neon-"] .kb-toc-panel {
  width: 13.75rem !important;
  top: 5rem !important;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc {
  position: relative;
  padding: 0.7rem;
  clip-path: var(--kb-neon-clip-md);
  border-radius: 0.375rem;
  border: 1px solid var(--kb-neon-line);
  background:
    linear-gradient(155deg, color-mix(in srgb, var(--neon-magenta) 3%, transparent), var(--kb-neon-panel-strong) 48%, var(--kb-neon-panel));
  box-shadow: var(--kb-neon-shadow-panel);
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc::before {
  content: '';
  position: absolute;
  top: 0.75rem;
  bottom: 0.75rem;
  left: 0.72rem;
  width: 1px;
  background: linear-gradient(180deg, transparent, var(--kb-neon-line), transparent);
  opacity: 0.9;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-title {
  position: relative;
  margin: 0 0 0.65rem 0.45rem;
  padding: 0 0 0.55rem 0.7rem;
  border-bottom: 1px solid var(--kb-neon-line-soft);
  color: var(--kb-neon-node-alt);
  font-family: var(--font-mono);
  font-size: 0.68rem;
  letter-spacing: 0;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content > ul,
#arcane-root[class*="neon-"] .kb-toc-panel .toc-content ul ul {
  padding-left: 0;
  margin-left: 0;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content li::before,
#arcane-root[class*="neon-"] .kb-toc-panel .toc-content li::after {
  display: none !important;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content a {
  position: relative;
  margin: 0.12rem 0 0.12rem 0.5rem;
  padding: 0.42rem 0.55rem 0.42rem 1rem !important;
  clip-path: var(--kb-neon-clip-sm);
  border-radius: 0.25rem;
  border: 1px solid transparent;
  color: var(--kb-neon-muted);
  background: transparent;
  line-height: 1.25;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content ul ul a {
  margin-left: 1rem;
  font-size: 0.75rem;
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content a::before {
  content: '';
  position: absolute;
  left: 0.34rem;
  top: 50%;
  width: 0.36rem;
  height: 0.36rem;
  background: var(--kb-neon-panel-strong);
  border: 1px solid var(--kb-neon-line);
  transform: translateY(-50%);
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content a:hover,
#arcane-root[class*="neon-"] .kb-toc-panel .toc-content a.toc-active {
  background:
    linear-gradient(90deg, var(--kb-neon-node-soft), color-mix(in srgb, var(--primary) 6%, transparent));
  border-color: var(--kb-neon-line-soft);
  color: var(--kb-neon-node-alt);
  box-shadow: inset 0 -1px 0 var(--kb-neon-node);
}

#arcane-root[class*="neon-"] .kb-toc-panel .toc-content a.toc-active::before {
  background: var(--kb-neon-node);
  border-color: var(--kb-neon-node);
  box-shadow: 0 0 12px color-mix(in srgb, var(--kb-neon-node) 30%, transparent);
}

html.light #arcane-root[class*="neon-"] .kb-toc-panel .toc,
#arcane-root.light[class*="neon-"] .kb-toc-panel .toc {
  background:
    linear-gradient(155deg, rgba(255, 102, 0, 0.035), rgba(255, 255, 255, 0.9) 45%, rgba(243, 246, 251, 0.84));
  border-color: rgba(36, 78, 209, 0.16);
  box-shadow:
    0 16px 34px rgba(36, 78, 209, 0.1),
    0 1px 0 rgba(255, 255, 255, 0.95);
}

html.light #arcane-root[class*="neon-"] .kb-toc-panel .toc::before,
#arcane-root.light[class*="neon-"] .kb-toc-panel .toc::before {
  background: linear-gradient(180deg, transparent, rgba(36, 78, 209, 0.22), transparent);
}

html.light #arcane-root[class*="neon-"] .kb-toc-panel .toc-content a:hover,
html.light #arcane-root[class*="neon-"] .kb-toc-panel .toc-content a.toc-active,
#arcane-root.light[class*="neon-"] .kb-toc-panel .toc-content a:hover,
#arcane-root.light[class*="neon-"] .kb-toc-panel .toc-content a.toc-active {
  background:
    linear-gradient(90deg, rgba(132, 165, 242, 0.24), rgba(255, 255, 255, 0.72));
  border-color: rgba(36, 78, 209, 0.18);
  color: #173a9f;
  box-shadow: inset 0 -1px 0 rgba(36, 78, 209, 0.28);
}

html.light #arcane-root[class*="neon-"] .prose a,
#arcane-root.light[class*="neon-"] .prose a {
  color: #244ed1;
}

html.light #arcane-root[class*="neon-"] .prose h1,
html.light #arcane-root[class*="neon-"] .prose h2,
html.light #arcane-root[class*="neon-"] .prose h3,
#arcane-root.light[class*="neon-"] .prose h1,
#arcane-root.light[class*="neon-"] .prose h2,
#arcane-root.light[class*="neon-"] .prose h3 {
  color: #101a3a;
  text-shadow: none;
}

html.light #arcane-root[class*="neon-"] .prose h2,
html.light #arcane-root[class*="neon-"] .prose h3,
#arcane-root.light[class*="neon-"] .prose h2,
#arcane-root.light[class*="neon-"] .prose h3 {
  border-bottom-color: rgba(36, 78, 209, 0.14);
}

html.light #arcane-root[class*="neon-"] .prose table,
#arcane-root.light[class*="neon-"] .prose table {
  border-color: rgba(36, 78, 209, 0.15);
  box-shadow: 0 8px 22px rgba(36, 78, 209, 0.055);
}

html.light #arcane-root[class*="neon-"] .prose th,
#arcane-root.light[class*="neon-"] .prose th {
  background: linear-gradient(180deg, rgba(231, 238, 252, 0.95), rgba(214, 225, 250, 0.88));
  border-color: rgba(36, 78, 209, 0.16);
  color: #173a9f;
}

html.light #arcane-root[class*="neon-"] .prose td,
#arcane-root.light[class*="neon-"] .prose td {
  background: rgba(255, 255, 255, 0.58);
  border-color: rgba(36, 78, 209, 0.11);
}

html.light #arcane-root[class*="neon-"] .prose code:not(pre code),
html.light #arcane-root[class*="neon-"] .kb-kbd,
html.light #arcane-root[class*="neon-"] .kb-tag,
#arcane-root.light[class*="neon-"] .prose code:not(pre code),
#arcane-root.light[class*="neon-"] .kb-kbd,
#arcane-root.light[class*="neon-"] .kb-tag {
  background: rgba(231, 238, 252, 0.86);
  border-color: rgba(36, 78, 209, 0.16);
  color: #173a9f;
}

html.light #arcane-root[class*="neon-"] .kb-page-metadata,
html.light #arcane-root[class*="neon-"] .kb-tags-footer,
html.light #arcane-root[class*="neon-"] .kb-page-nav,
#arcane-root.light[class*="neon-"] .kb-page-metadata,
#arcane-root.light[class*="neon-"] .kb-tags-footer,
#arcane-root.light[class*="neon-"] .kb-page-nav {
  border-color: rgba(36, 78, 209, 0.13);
}

#arcane-root[class*="neon-"] .prose {
  max-width: none;
}

#arcane-root[class*="neon-"] .prose h1,
#arcane-root[class*="neon-"] .prose h2,
#arcane-root[class*="neon-"] .prose h3 {
  text-transform: uppercase;
  letter-spacing: 0;
  scroll-margin-top: var(--kb-neon-dock-clearance);
}

#arcane-root[class*="neon-"] .prose pre,
#arcane-root[class*="neon-"] .kb-code-group,
#arcane-root[class*="neon-"] .kb-panel,
#arcane-root[class*="neon-"] .kb-frame,
#arcane-root[class*="neon-"] .kb-card,
#arcane-root[class*="neon-"] .kb-tile,
#arcane-root[class*="neon-"] .kb-step,
#arcane-root[class*="neon-"] .kb-banner {
  clip-path: var(--kb-neon-clip-md);
  border-radius: 0.375rem;
  border-color: var(--kb-neon-line);
  box-shadow: var(--kb-neon-shadow-soft);
}

#arcane-root[class*="neon-"] .kb-callout {
  clip-path: var(--kb-neon-clip-md);
  border-radius: 0.375rem;
}

#arcane-root[class*="neon-"] .markdown-alert {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
  border-radius: 0.125rem;
}

@media (max-width: 1100px) {
  #arcane-root[class*="neon-"] .arcane-scaffold-header {
    margin: 0.75rem 0.75rem 0 0.75rem !important;
    top: auto !important;
  }

  #arcane-root[class*="neon-"] .kb-topbar {
    width: 100%;
    max-width: none;
  }

  #arcane-root[class*="neon-"] .kb-topbar-inner {
    justify-content: space-between;
  }

  #arcane-root[class*="neon-"] .kb-topbar-left {
    flex-basis: auto;
    min-width: 0;
  }

  #arcane-root[class*="neon-"] .arcane-scaffold-body {
    grid-template-columns: minmax(0, 1fr) !important;
  }

  #arcane-root[class*="neon-"] .kb-content-area {
    padding-top: 0.55rem;
  }
}

@media (max-width: 900px) {
  #arcane-root[class*="neon-"] .arcane-scaffold-sidebar {
    width: min(21rem, 92vw) !important;
  }

  #arcane-root[class*="neon-"] .kb-topbar-brand {
    flex: 0 0 auto;
    width: 2.05rem;
    padding: 0;
    justify-content: center;
  }

  #arcane-root[class*="neon-"] .kb-topbar-brand-label {
    display: none;
  }

  #arcane-root[class*="neon-"] .kb-topbar-link {
    padding: 0 0.45rem;
  }
}
''';
}
