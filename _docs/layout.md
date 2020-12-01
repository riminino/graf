---
weight: 2
---

# Layout
{:.no_toc}

* toc
{:toc}

Page layout use flexbox with `flex-direction: column;`{:.language-css}

```html
<body>
  <header><!-- Header --></header>
  <nav><!-- Navigation --></nav>
  <main><!-- Main content --></main>
  <footer><!-- Footer --></footer>
</body>
```

## Header and navigation

Configure the layout overriding `sass` variabiles in `assets/css/variabiles.sass`.

- To show the navigation on top, set `$nav-order: -1`{:.language-sass} since default items order is 0
- To stick navigation on top during scroll, set `$nav-position: sticky`{:.language-sass}
- To hide the `<header>`{:.lanhuage-html}, set `$header-display: none`{:.language-sass}

## Sidebar

The main content has an optional sidebar and use flexbox with `flex-direction: row-reverse;`{:.language-css}

```html
<main>
  <aside><!-- Sidebar --></aside>
  <section><!-- Content --></section>
</main>
```

To show the sidebar, set a widgets array `sidebar: [...]` for the relative pages:

- For every page

```yml
# _config.yml
defaults:
  - scope:
      path: ""
    values:
      sidebar: [...]
```
- For one or more collections

```yml
# _config.yml
defaults:
  - scope:
      type: my-collection
    values:
      sidebar: [...]
```
- for singular pages, in the _front-matter_

```yml
---
sidebar: [...]
---
```

Configure the sidebar overriding `sass` variabiles in `assets/css/variabiles.sass`.

- To move the sidebar to the left, set `$main-flex-direction: row`{:.language-sass}
- Sidebar width is `.4` times the section width; change with `$sidebar-width`{:.language-sass}
- To stick the sidebar on top during scroll, set `$sidebar-position: sticky`{:.language-sass} (overridden in mobile mode)

## Widths

Configure the widths overriding `sass` variabiles in `assets/css/variabiles.sass`.

```sass
// Limit maximum body width
$max-width:     100em !default
// Content width: specific amount or precentange of the body width
$content-width: 90% !default
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

Grids are `<div>`{:.language-html} elements (columns) contained in a `<div class="grid">`{:.language-html} element.

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