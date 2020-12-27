---
---
# Includes
# --------------------------------------
{% include scripts/storage.coffee %}
{% include scripts/widgets/mode_toggle.coffee %}
{% include scripts/busy.coffee %}
{% include scripts/login.coffee %}
{% include scripts/widgets/datetime.coffee %}
{% include scripts/widgets/sidebar_toc.coffee %}
{% include scripts/forms.coffee %}
{% include scripts/commit.coffee %}
{% include scripts/pull_request.coffee %}
{% include scripts/notifications.coffee %}
{% include scripts/write_page.coffee %}

# Get storage
# --------------------------------------
console.log storage.get()

# Prevent default events
$("a.prevent-default").on "click", (e) -> e.preventDefault()
$("form.prevent-default").on "submit", (e) -> e.preventDefault()

# Initialize serialize
$.serializeJSON.defaultOptions.parseAll = true
$.serializeJSON.defaultOptions.skipFalsyValuesForTypes = "text,number,date,password,tel,email".split ","
# textarea has no type

# YML preview
# console.log jsyaml.dump {{site.data.test.widgets | jsonify }}