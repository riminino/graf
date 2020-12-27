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

Where to save the instance file: the path inside `_data` and filename without extension. To check a form path, hover on the form title.

Example `path: folder/file` will save the file to `_data/folder/file.yml`

- If the user is not logged as admin:  
  __will alert at form submit__
- If user is logged as admin:
  - If schema property `path` is not present:  
    __will console-log the form in yaml__
  - If schema property `path` is present:
    - If schema property `personal` is `true` and repository is a fork:  
      __will commit in `_data/users/<user>/<path>.yml` and pull request__
    - If schema property `personal` is `false` or not present, or repository is not a fork:  
      __will commit in `_data/<path>.yml`__

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
```liquid
{% raw %}{% include schema/form.html schema=site.data.test.simple %}{% endraw %}
```
<div class="grid">
<div markdown="1">
{% include schema/form.html schema=site.data.test.simple %}
</div>
<div markdown="1">
```yml
title: A registration form
description: A simple form example.
type: object
required:
  - firstName
  - lastName
properties:
  firstName:
    type: string
    title: First name
    default: Chuck
    autocomplete: family-name
  lastName:
    type: string
    title: Last name
  born:
    type: string
    format: date
    title: Born
    description: Earthian date
  bio:
    type: string
    title: Bio
    widget: textarea
  password:
    type: string
    title: Password
    widget: password
    minLength: 3
  telephone:
    type: string
    title: Telephone
    widget: tel
    minLength: 10
```
</div>
</div>

## Widgets
```liquid
{% raw %}{% include schema/form.html schema=site.data.test.widgets %}{% endraw %}
```
<div class="grid">
<div markdown="1">
{% include schema/form.html schema=site.data.test.widgets %}
</div>
<div markdown="1">
```yml
title: Widgets
type: object
properties:
  stringFormats:
    type: object
    title: String formats
    properties:
      email:
        type: string
        format: email
        default: chuck@norris.net
      uri:
        type: string
        format: uri
        default: 'http://chucknorris.com/'
  boolean:
    type: object
    title: Boolean field
    properties:
      checkbox1:
        type: boolean
        title: checkbox 1 (default)
        description: This is the checkbox-description
      checkbox2:
        type: boolean
        title: checkbox 2 (default)
        description: This is the checkbox-description
      radio:
        type: boolean
        title: radio buttons
        description: This is the radio-description
        enum:
          - true
          - false
        default: false
        widget: radio
  string:
    type: object
    title: String field
    properties:
      default:
        type: string
        title: text input (default)
      textarea:
        type: string
        title: textarea
        widget: textarea
        rows: 5
      color:
        type: string
        title: color picker
        default: '#151ce6'
        widget: color
  secret:
    type: string
    default: I'm a hidden string.
    widget: hidden
  disabled:
    type: string
    title: A disabled field
    default: I am disabled.
    disabled: true
  readonly:
    type: string
    title: A readonly field
    default: I am read-only.
    readonly: true
  readonly2:
    type: string
    title: Another readonly field
    default: I am also read-only.
    readOnly: true
  selectWidgetOptions:
    title: Select widget with names
    type: string
    enum:
      - foo
      - bar
    enumNames:
      - Foo
      - Bar
```
</div>
</div>

## Refs
```liquid
{% raw %}{% include schema/form.html schema=site.data.test.refs %}{% endraw %}
```
<div class="grid">
<div markdown="1">
{% include schema/form.html schema=site.data.test.refs %}
</div>
<div markdown="1">
```yml
title: References
type: object
id: _data/test/refs.json
definitions:
  omp:
    type: object
    properties:
      name:
        type: string
      age:
        type: number
properties:
  person:
    $ref: '#/definitions/omp'
  population:
    type: array
    items:
      $ref: '#/definitions/omp'
```
</div>
</div>

## Numbers
```liquid
{% raw %}{% include schema/form.html schema=site.data.test.numbers %}{% endraw %}
```
<div class="grid">
<div markdown="1">
{% include schema/form.html schema=site.data.test.numbers %}
</div>
<div markdown="1">
```yml
type: object
title: Number fields & widgets
properties:
  number:
    title: Number
    type: number
    default: 3.14
    multipleOf: 0.01
  integer:
    title: Integer
    type: integer
  numberEnum:
    type: number
    title: Number enum
    enum:
      - 1
      - 2
      - 3
  numberEnumRadio:
    type: number
    title: Number radio enum
    enum:
      - 1
      - 2
      - 3
    widget: radio
  integerRange:
    title: Integer range
    type: integer
    description: 42-100
    minimum: 42
    maximum: 100
    widget: range
  integerRangeSteps:
    title: Integer range (by 10)
    description: 50-100
    type: integer
    minimum: 50
    maximum: 100
    multipleOf: 10
    widget: range
```
</div>
</div>

## array
```liquid
{% raw %}{% include schema/form.html schema=site.data.test.array %}{% endraw %}
```
<div class="grid">
<div markdown="1">
{% include schema/form.html schema=site.data.test.array %}
</div>
<div markdown="1">
```yml
title: Array
type: object
id: _data/test/array.yml
path: array
properties:
  array:
    type: array
    items:
      type: string
  arrayItems:
    type: array
    items:
      type: object
      properties:
        obj1:
          type: string
        obj2:
          type: string
  tasks:
    type: array
    title: Tasks
    items:
      type: object
      required:
        - title
      properties:
        title:
          type: string
          title: Title
          description: A sample title
        details:
          type: string
          widget: textarea
          title: Task details
          description: Enter the task details
        done:
          type: boolean
          title: Done?
```
</div>
</div>

## Additional properties
```liquid
{% raw %}{% include schema/form.html schema=site.data.test.additional_properties %}{% endraw %}
```
<div class="grid">
<div markdown="1">
{% include schema/form.html schema=site.data.test.additional_properties %}
</div>
<div markdown="1">
```yml
title: Additional Properties
description: A simple form with additional properties example
type: object
path: additionalProperties
additionalProperties:
  type: number
properties:
  name:
    type: string
    title: Name
    default: Name
  style:
    type: object
    properties:
      name:
        type: string
        title: 'Style[name]'
        default: 'Style[name]'
      body:
        type: object
        properties:
          name:
            type: string
            title: 'Style[body][name]'
            default: 'Style[body][name]'
        additionalProperties:
          type: number
          description: description
      surname:
        type: string
        title: 'Style[surname]'
        default: 'Style[surname]'
    additionalProperties:
      type: string
      format: email
```
</div>
</div>