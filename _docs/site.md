---
title: Site
weight: 1
---
* toc
{:toc}

# Structure

The top navigation will show on the left (on the top in mobile mode) the pages links, sorted by `weight` liquid numeric variabile (pages without `weight` value will be left out), then the site collections as dropdowns.

Collections also are sorted by `weight` value, and collections documents too.

Pages sorted in _front matter_

```yml
---
weight: 1
---
```

Collections sorted in `_config.yml`

```yml
# _config.yml
collections:
  my-collection:
    output: true
    title: Collection title
    weight: 1
```

Collections documents sorted in _front matter_

```yml
---
weight: 1
---
```

# Theme

Configurable in `_config.yml`, default theme is `default`.

```yml
css:
  theme: default
```

## Light and dark mode

The mode is stored in `storage` and the `<html>`{:.language-html} will have the corresponding  class: `.mode-light` (default) or `.mode-dark`.

- Toggle link: `{% raw %}{% include widgets/mode_toggle_link.html %}{% endraw %}`{:.language-liquid} {% include widgets/mode_toggle_link.html %}
- Opposite mode: apply `class="mode-opposite"`{:.language-ruby} to an element to use the opposite mode colors.
- Elements visibility: apply `class='show-if-mode-light'`{:.language-ruby} and `class='show-if-mode-dark'`{:.language-ruby} to show an element only in one mode.

## Syntax highlight

Configurable in `_config.yml` for light and dark modes as a string with `rouge` or `pygments` folder, and the filename without extension.

Preview of __Pygments__ and __Rouge__ color scheme: <https://trasparente.github.io/rosso/>.

```yml
css:
  syntax:
    light: rouge/github
    dark: rouge/molokai
```

## Customization

Theme default values can be overridden in the empty file `assets/css/variabiles.sass`.

Below some examples, the full list is in `_sass/default/_variabiles.sass`.

# Layout

Page layout use flexbox with `flex-direction: column;`{:.language-css}

```html
<body>
  <header><!-- Header --></header>
  <nav><!-- Navigation --></nav>
  <main><!-- Main content --></main>
  <footer><!-- Footer --></footer>
</body>
```

## Page classes

Apply CSS classes to customize pages via YAML `classes` array:

<div class="grid">
<div markdown="1">

For every page

```yml
# _config.yml
defaults:
  - scope:
      path: ""
    values:
      classes: [...]
```
</div>
<div markdown="1">

For pages in one or more collections

```yml
# _config.yml
defaults:
  - scope:
      type: my-collection
    values:
      classes: [...]
```
</div>
</div>
For singular pages, in the _front-matter_

```yml
---
classes: [...]
---
```

### Classes list

Header
: `no-header` to hide header

Navigation
: `sticky-nav` to stick navigation on top during scroll
: `top-nav` to show navigation above the header

Sidebar
: `right-sidebar` to show the sidebar on the right
: `left-sidebar` to show the sidebar on the left
: `sticky-sidebar` to stick sidebar on top during scroll

Accents
: `blue`, `red`, `green`, `orange` the link color
: Defined with SASS lists `$accents-dark`{:.language-sass}, `$accents-light`{:.language-sass}

## Sidebar

The main page content has an optional sidebar and use flexbox with `flex-direction: row-reverse;`{:.language-css} for a right sidebar.

```html
<main>
  <aside><!-- Sidebar --></aside>
  <section><!-- Page content --></section>
</main>
```

### Widgets

The sidebar will be populated with widgets included from `_includes/widgets/sidear/`.

Select the widgets with a YAML array `sidebar: [...]` for the relative pages:

<div class="grid">
<div markdown="1">

For every page

```yml
# _config.yml
defaults:
  - scope:
      path: ""
    values:
      sidebar: [...]
```
</div>
<div markdown="1">

For pages in one or more collections

```yml
# _config.yml
defaults:
  - scope:
      type: my-collection
    values:
      sidebar: [...]
```
</div>
</div>

For singular pages, in the _front-matter_

```yml
---
sidebar: [...]
---
```

### Widgets list

Table of contents
: `toc` Will move the table of contents (generated in the page with `{:toc}`) to the sidebar

## Widths

Configure the widths overriding `sass` variabiles in `assets/css/variabiles.sass`.

```sass
// Limit maximum body width
$max-width:     100em !default
// Content width: specific amount or precentange of the body width
$content-width: 90% !default
// Sidebar width: value relative to the section width
$sidebar-width: .4
// Mobile threshold for media-query
$mobile-width:  700px !default
```

## Mobile
When viewport is under `$mobile-width`{:.language-sass}

- Hidden elements in wide view `class="if-small-screen"`{:.language-ruby} will be shown
- Elements with `class="if-big-screen"`{:.language-ruby} will be hidden
- Navigation will be replaced with a `<details>`{:.language-html} version
- Sidebar will be stacked on page top
- Grid items will be vertically stacked

## Grids

Grids are `<div>`{:.language-html} elements (columns) contained in a `<div class="grid">`{:.language-html} elements (rows).

```html
<!-- HTML markup -->
<div class="grid">
  <div> column 1 </div>
  <div> column 2 </div>
  ...
</div>
```

<div class="grid">
  <div markdown="1">
### Column 1
{:.no_toc}

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  </div>
  <div markdown="1">
### Column 2
{:.no_toc}

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  </div>
</div>