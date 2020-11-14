---
permalink: form
weight: 3
schema:
  default:
    title: Profile
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

**Attributes**

- `live`  

  `login.role = admin` & `repository.fork = false`  
  will commit in `_data/<data-path>.yml`  

  `login.role = admin` & `repository.fork = true`  
  will pull request in `_data/users/<user>/<data-path>.yml`  

  If not present will log the form in yaml

- `data-path`  
  Path and filename (no extension) inside `_data/`  
  If not present is `default` saved in `_data/default.yml`

- `data-append`  
  If present will append, otherwise will replace

{% include schema/form.html schema=page.schema.default %}