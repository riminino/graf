---
---
# Includes
# --------------------------------------
{% include scripts/storage.coffee %}
{% include scripts/login.coffee %}
{% include scripts/datetime.coffee %}
{% include scripts/forms.coffee %}
{% include scripts/commit.coffee %}
{% include scripts/pull_request.coffee %}
{% include scripts/notifications.coffee %}

# Get storage
# --------------------------------------
console.log storage.get()

# Prevent default events
$("a[prevent-default]").on "click", (e) -> e.preventDefault()
$("form[prevent-default]").on "submit", (e) -> e.preventDefault()

# Initialize serialize
$.serializeJSON.defaultOptions.parseAll = true
$.serializeJSON.defaultOptions.skipFalsyValuesForTypes = "text,number,date,password,tel,email".split ","