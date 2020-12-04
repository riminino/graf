---
weight: 4
schema:
  title: Profile
  path: default
  properties:
    name:
      title: Name
      type: string
      required: true
    color_1:
      title: Color 1
      type: string
      widget: color
    color_2:
      title: Color 2
      type: string
      widget: color
---
# Schema

* toc
{:toc}

## Path

Where to save the instance file: the path inside `_data` and filename without extension.

- If the property is not present in the schema, will console log the form in yaml
- If the user is not logged or `login.role != admin`, will alert at form submit

|Condition|Effect
|:--|:--
|repository is a fork|will commit in `_data/<data-path>.yml`
|repository is not a fork|will commit in `_data/users/<user>/<data-path>.yml` and pull request

## Type

<div class="grid">
  <div markdown="1">
The type of schema.
- `object` will replace the content
- `array` will append at the bottom
</div>
  <div>
{% include schema/form.html schema=page.schema %}
  </div>
</div>

# Tests

`autofocus: true`{:.language-yml} will autofocus the input field (will change initial scroll position)

## Simple

{% include schema/form.html schema=site.data.test.simple %}

## Widgets

{% include schema/form.html schema=site.data.test.widgets %}

## Refs

{% include schema/form.html schema=site.data.test.refs %}

## Numbers

{% include schema/form.html schema=site.data.test.numbers %}

## array

{% include schema/form.html schema=site.data.test.array %}

## additional properties

{% include schema/form.html schema=site.data.test.additional_properties %}