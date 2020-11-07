---
permalink: markdown
weight: 2
---

# Markdown

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