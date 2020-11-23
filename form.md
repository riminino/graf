---
weight: 3
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
# Form

## Path

Where to save the instance file: the path inside `_data` and filename without extension.

|Schema property|Form attribute
|:--|:--
|`path`|`data-path`

- If the property is not present in the schema, will console log the form in yaml
- If the user is not logged or `login.role != admin`, will alert

|Condition|Effect
|:--|:--
|repository is a fork|will commit in `_data/<data-path>.yml`
|repository is not a fork|will pull request in `_data/users/<user>/<data-path>.yml`

## Type

The type of schema.

|Schema property|Form attribute
|:--|:--
|`type`|`data-type`

|Value|Effect
|:--|:--
|`object`|will replace the content
|`array`|will append at the bottom

{% include schema/form.html schema=page.schema %}