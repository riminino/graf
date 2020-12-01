---
---
# Includes
# --------------------------------------
{% include scripts/storage.coffee %}
{% include scripts/busy.coffee %}
{% include scripts/login.coffee %}
{% include scripts/datetime.coffee %}
{% include scripts/forms.coffee %}
{% include scripts/commit.coffee %}
{% include scripts/pull_request.coffee %}
{% include scripts/notifications.coffee %}
{% include scripts/mode_toggle.coffee %}
{% include scripts/toc.coffee %}

# Get storage
# --------------------------------------
console.log storage.get()

# Prevent default events
$("a.prevent-default").on "click", (e) -> e.preventDefault()
$("form.prevent-default").on "submit", (e) -> e.preventDefault()

# Initialize serialize
$.serializeJSON.defaultOptions.parseAll = true
$.serializeJSON.defaultOptions.skipFalsyValuesForTypes = "text,number,date,password,tel,email".split ","

# YML preview
# console.log jsyaml.dump {{site.data.test.widgets | jsonify }}

# Storage
# ls =
#   set: (key, value) ->
#     localStorage.setItem("{{ site.github.repository_nwo }}/#{key}", value)
#     ls
#   get: (key) ->
#     if key
#       return localStorage.getItem "{{ site.github.repository_nwo }}/#{key}"
#     else
#       for own key of localStorage
#         console.log key, localStorage.getItem key
#       return
#   clear: (key) ->
#     if key then localStorage.removeItem key else localStorage.clear()
#     ls
# 
# ls.get()
