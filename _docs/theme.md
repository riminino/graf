---
weight: 1
---
# Theme

configurable in `_config.yml`

<details markdown="1">
  <summary>Config</summary>

```yml
css:
  theme: default
  width:
    main: 90%
    max: 100em
    mobile: 40em
  fonts:
    size: 15px
    line-height: 1.4
    main: sans-serif
    headings: serif
    code: monospace
  headings:
    color:
      dark: inherit
      light: inherit
    background:
      dark: none
      light: none
    border-bottom:
      dark: none
      light: none
  dark: hsl(0, 0%, 5%)
  light: hsl(0, 0%, 95%)
  accent: hsl(200, 100%, 40%)
  palette:
    dark:
      - lighten($dark, 10%)
      - $dark
      - $accent
      - lighten($accent, 20%)
    light:
      - darken($light, 10%)
      - $light
      - $accent
      - darken($accent, 20%)
  border-radius: none
```

</details>

## Elements visibility

Upon page load `<html>`{:.language-html} will have a class with the theme stored in `storage`:
- `class='theme-light'`{:.language-ruby}
- `class='theme-dark'`{:.language-ruby}

Elements with corresponding class will show up:
- `class='if-theme-light'`{:.language-ruby}
- `class='if-theme-dark'`{:.language-ruby}

## User role

Upon login `<html>`{:.language-html} will have a class with user role:
- `class='role-admin'`{:.language-ruby}
- `class='role-guest'`{:.language-ruby}

Elements with corresponding class will show up:
- `class='if-role-admin'`{:.language-ruby}
- `class='if-role-guest'`{:.language-ruby}
