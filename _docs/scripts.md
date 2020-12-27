---
weight: 5
---

# Scripts
{:.no_toc}

* toc
{:toc}

## Storage

API to manage an object in `localStorage`, Lempel-Ziv compressed to Base 64. The key si the string `{{ site.github.repository_nwo }}`.

Initialization `storage.init()` will sotre a default object like

```yml
storage:
  created: ...
  mode: ...
  logs: []
repository:
  url: ...
  updated: ...
```

Set a value for a key with _dot notation_
: `storage.set(key, value)`{:.language-js}

Get a key's value or whole object
: `storage.get([key])`{:.language-js}

Remove a key/value pair or clear whole object
: `storage.clear([key])`{:.language-js}

## Login

A login link `<a href="#" class="login-link">Login</a>`{:.language-html} will ask for a GitHub personal token <https://github.com/settings/tokens/new>.

This token will be hashed and stored in `storage` until a logout.

### User role

The `<html>`{:.language-html} element will have the corresponding login and user role classes:
- `class='not-logged'`{:.language-ruby}
- `class='logged'`{:.language-ruby}
- `class='role-admin'`{:.language-ruby}
- `class='role-guest'`{:.language-ruby}

Elements with corresponding class will show up:
- `class='show-if-logged'`{:.language-ruby} hidden if not logged
- `class='show-if-role-admin'`{:.language-ruby} hidden if logged as a guest or not logged
- `class='show-if-role-guest'`{:.language-ruby} hidden if logged as admin or not logged

## Widgets

A widget consists of a `_includes/widgets/` HTML file and a relative `_includes/scripts/widgets/` COFFEESCRIPT file.

### Datetime

Given a date will render a `<span>`{:.language-html} element with a _coutdown_ if in the future, or an _elapsed time_ if in the past.

`{% raw %}{% include widgets/datetime.html datetime="..." %}{% endraw %}`{:.language-liquid}

|Liquid options|Effect|Default
|:--|:--|:--
|`datetime`|The date|`"now"`
|`time`|Hour and minutes `HH:MM`|`nil`
|`text`|Text for the `span` element|`datetime`
|`title`|Text for the tooltip on hover|`datetime`
|`embed`|Add countdown or elapsed time on the element|`nil`
|`replace`|Replace the text with the countdown or elapsed time|`nil`
|`decimals`|Will round the countdown or the elapsed time decimals|0

### Mode toggle

A link with `class="mode-toggle-link"`{:.language-ruby} will toggle the _light/dark_ mode and store the new one in `storage`.

The script will set the mode on every page load applying a class `mode-light` or `mode-dark` to `<html>`{:.language-html}

## Write page form

An element with attributes `show-if-name="my-name" show-if-value="my-value"` will be visible only if the element with `name="my-name"` has value `my-value`.