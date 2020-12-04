---
weight: 3
sidebar: [toc]
---

# Kramdown
{:.no_toc}

* toc
{:toc}

Kramdown is the markdown converter for Jekyll.

If an HTML tag has an attribute `markdown="1"` then the content of the tag is parsed as [span level elements](https://kramdown.gettalong.org/syntax.html#html-spans "Kramdown Syntax > HTML Spans").

Links
: With a title on hover `[link](url "title")`
: Reference name `[link][reference]` and later `[reference]: url "title"`

Classes and ids
: `{: .class #id}`

Images
: `![alt-text](url)`

Attributes
: `{: attribute="value"}`

## Table of contents

The first line will be replaced with an ordered `1. toc` or unordered `- toc` nested list of headings, the second line must be `{:toc}`.

- The class `{:.no_toc}` exclude a heading from the list
- If the page has the `toc` widget in the `sidebar` array, the table of contents is moved to the sidebar

## Details

```html
<details>
  <summary>Handler</summary>
  Content
</details>
```

<details>
  <summary>Handler</summary>
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</details>

## Forms

Forms elements render

<form class="prevent-default">
<h3>Form title</h3>
<div>
  <label for="age">Age</label>
  <input type="number" id="age" name="age" placeholder="Age" required>
</div>
<div>
  <label for="color">Color</label>
    <input type="color" id="color" name="color">
</div>
<div>
  <label for="birt_date">Birth date</label>
    <input type="date" id="birt_date" name="birt_date" required>
</div>
<div>
  <label for="email">Email address</label>
  <input type="email" id="email" name="email" placeholder="Email address" required>
  <span>We'll never share your email with anyone else.</span>
</div>
<input type="text" placeholder="Disabled" disabled>
<input type="text" placeholder="Readonly" readonly>
<div>
  <label for="range">Range</label><output></output>
  <input type="range" id="range" name="range">
</div>
<!-- Select -->
<div>
  <label for="country">Country</label>
  <select id="country">
    <option selected>Choose...</option>
    <optgroup label="Europe">
      <option value="italy">Italy</option>
    </optgroup>
    <option value="usa">USA</option>
  </select>
</div>

<!-- Radios -->
<div>
  <label>Input inside label.radio</label>
  <label class="radio">
    <input type="radio" id="male" name="gender" value="male" checked> Male
  </label>
  <label class="radio">
    <input type="radio" id="female" name="gender" value="female"> Female
  </label>
  <label class="radio">
    <input type="radio" id="other" name="gender" value="other"> Other
  </label>
  <span>Label.radio</span>
</div>

<!-- Checkbox -->
<div>
  <label>Checkbox label > input + text</label>
  <label for="terms" class="boolean">
    <input type="checkbox" id="terms" name="terms"> I agree to the
  </label>
  <span>Desc</span>
</div>
<div>
  <label for="bio" class="boolean">Checkbox label + input</label>
  <input type="checkbox" id="bio" name="bio">
  <span>Desc</span>
</div>

<!-- Textarea -->
<div>
  <label for="textarea">Textarea</label>
  <textarea name="textarea" id="textarea" rows="5" placeholder="Text"></textarea>
  <span>Desc</span>
</div>

<!-- Button -->
<div>
  <label markdown="1">`input[type]`</label>
  <input type="submit" value="Submit">
  <input type="reset" name="" value="Reset">
  <input type="button" disabled name="" value="Disabled">
</div>
<!-- Button -->
<div>
  <label markdown="1">`button[type]`</label>
  <button type="submit">Submit</button>
  <button type="reset">Reset</button>
  <button type="button" disabled>Disabled</button>
</div>

</form>

## Code

Fenced <code class="highlight">```yml</code>

```yml
city: 1
coas: "ok"
array:
  - 1
  - 2
  - three
array: [1, 2, "three"]
```

Liquid `{% raw %}{%- highlight yml -%}{% endraw %}`{:.language-liquid}

{%- highlight yml -%}
city: 1
coas: "ok"
array:
  - 1
  - 2
  - three
array: [1, 2, "three"]
{%- endhighlight -%}

Kramdown code block `~~~ yml`

~~~ yml
city: 1
coas: "ok"
array:
  - 1
  - 2
  - three
array: [1, 2, "three"]
~~~

Kramdown lines indented `{:.language-yml}`

{:.language-yml}
    city: 1
    coas: "ok"
    array:
      - 1
      - 2
      - three
    array: [1, 2, "three"]

## Blockquotes

```md
> ### Heading
> {:.no_toc}
> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  
> A [link](#)
```

> ### Heading
> {:.no_toc}
> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### Alerts

Alerts are blockquotes elements with an optional Kramdon class.

```md
> success [link](#)
{:.success}
```

Examples:

> plain [link](#)

> success [link](#)
{:.success}

> info [link](#)
{:.info}

> warning [link](#)
{:.warning}

> danger [link](#)
{:.danger}

## Typography

### Inline text elements

|`__` or `**`|__Bold__
|`_` or `*`|_Italic_
|`<del>`{:.language-html}|<del>Deleted</del>
|`<ins>`{:.language-html}|<ins>Inserted</ins>
|`<abbr title="...">`{:.language-html}|<abbr title="Abbreviation">Abbreviation</abbr>
|`<cite>`{:.language-html}|<cite>Cite</cite>
|`<kbd>`{:.language-html}|<kbd>Ctrl + S</kbd>
|`<samp>`{:.language-html}|<samp>Sample</samp>
|`<mark>`{:.language-html}|<mark>Highlighted</mark>
|`<s>`{:.language-html}|<s>Strikethrough</s>
|`<u>`{:.language-html}|<u>Underline</u>
|`<small>`{:.language-html}|<small>small</small>
|`<sub>`{:.language-html}|Text<sub>Sub</sub>
|`<sup>`{:.language-html}|Text<sup>Sup</sup>

### Abbreviations

```md
This is an abbreviation

*[abbreviation]: Abbreviation explained
```

This is an abbreviation

*[abbreviation]: Abbreviation explained

### Footnotes

```md
This is a note[^1]

[^1]: This is the footnote
```
This is a note[^1]

[^1]: This is the footnote

The note will be rendered at the end of the document with this markup

```html
<div class="footnotes" role="doc-endnotes">
  <ol>
    <li id="fn:1" role="doc-endnote">
      <p>... <a href="#fnref:1" class="reversefootnote" role="doc-backlink">&#8617;</a></p>
    </li>
  </ol>
</div>
```

## Lists

### Unordered

Elements: `<ul><li>`{:.language-html}  
Markdown: `-` or `+` or `*`  
Escape: `\` to escape a marker `\- Not an item`

<blockquote markdown="1">
- Lorem ipsum dolor
* sit amet, consectetur adipisicing
+ elit, sed do eiusmod tempor
</blockquote>

### Ordered

Elements: `<ol><li>`{:.language-html}  
Markdown: `1.`, equal number are increased  
Escape: `\` to escape the dot `1984\. It was great`

<blockquote markdown="1">
1. ut labore et dolore
1. magna aliqua
1. Ut enim ad minim veniam
</blockquote>

### Definitions

Elements: `<dl><dt><dd>`{:.language-html}  
Markdown: `: ` for the descriptions, empty line before new title

```md
term
: definition
: another definition

another term
and another term
: and a definition for the term
```

<blockquote markdown="1">
term
: definition
: another definition

another term
and another term
: and a definition for the term
</blockquote>

## Tables

Use `|----` for a new `<tbody>`{:.language-html} and `|====` for a table footer `<tfoot>`{:.language-html}

This table has the `{:.no-borders}` class:

| Header1 | Header2 | Header3
|:--------|:-------:|--------:
| cell1   | cell2   | cell3
| cell4   | cell5   | cell6
|----
| cell1   | cell2   | cell3
|----
| cell4   | cell5   | cell6
|====
| Foot1   | Foot2   | Foot3
{:.no-borders}