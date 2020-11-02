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