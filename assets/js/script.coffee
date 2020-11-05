---
---
# Includes
# --------------------------------------
{% include scripts/storage.coffee %}
{% include scripts/login.coffee %}

# Get storage
# --------------------------------------
console.log storage.get()

$("a[prevent-default]").on "click", (e) -> e.preventDefault()
$("form[prevent-default]").on "submit", (e) -> e.preventDefault()

$.ajaxSetup
  url: "{{ site.github.api_url }}/graphql"
  headers: "Authorization": "token #{storage.get 'login.token'}"
  type: "POST"

jery = $.ajax data: JSON.stringify { query:
  'query{viewer{login}repository(owner:"riminino", name:"graf"){viewerPermission isFork}}'
}

jery.done (data, status) -> console.log data, status

jery.fail (request, status, error) -> console.log status, error