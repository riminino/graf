---
weight: 1
---
# Theme
{:.no_toc}

* toc
{:toc}

Configurable in `_config.yml`, default theme is `default`.

```yml
css:
  theme: default
```

## Dark and light mode

The mode is stored in `storage` and the `<html>`{:.language-html} will have the corresponding  class: `mode-light` or `mode-dark`.

- Toggle link: `{% raw %}{% include widgets/mode_toggle_link.html %}{% endraw %}`{:.language-liquid} {% include widgets/mode_toggle_link.html %}
- Opposite mode: apply `class="mode-opposite"`{:.language-ruby} to an element to use the opposite mode colors.
- Elements visibility: apply `class='if-mode-light'`{:.language-ruby} and `class='if-mode-dark'`{:.language-ruby} to show an element only in one mode.

## Syntax highlight

Configurable in `_config.yml` for dark and light modes.  
Preview of __Pygments__ and __Rouge__ color scheme: <https://trasparente.github.io/rosso/>.

```yml
css:
  syntax:
    dark: rouge/gruvbox
    light: rouge/github
```

## Customization

Theme default values can be overridden in the empty file `assets/css/variabiles.sass`.  
Below some examples, the full list is in `_sass/default/_variabiles.sass`.