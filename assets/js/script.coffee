---
---
# Includes
# --------------------------------------
{% include scripts/notification.coffee %}
{% include scripts/storage.coffee %}
{% include scripts/login.coffee %}
{% include scripts/datetime.coffee %}
{% include scripts/forms.coffee %}
{% include scripts/commit.coffee %}
{% include scripts/pull_request.coffee %}

# Get storage
# --------------------------------------
console.log storage.get()

$("a[prevent-default]").on "click", (e) -> e.preventDefault()
$("form[prevent-default]").on "submit", (e) -> e.preventDefault()