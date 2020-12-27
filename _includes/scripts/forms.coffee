$("form").each ->
  form = $ @
  schema = if form.data 'schema' then JSON.parse decodeURIComponent form.data('schema') else {}

  # DIV `show-if-name` `show-if-value`
  form.find('[show-if-name]').each ->
    $(@).hide()
    name = $(@).attr 'show-if-name'
    value = $(@).attr 'show-if-value'
    form.find("[name=#{name}]").each (i, e) =>
      $(e).on 'change', => if $(e).val() is value then $(@).show() else $(@).hide()
      return
    return

  # Update RANGE output
  form.find("input[type=range]").each ->
    $(@).on "input", (e) -> $(e.target).closest('div').find("output").val $(e.target).val()
    # Initial update
    $(@).trigger "input"
    return

  # Reset event
  form.on "reset", (e) ->
    # form.find("#timestamp").val ""
    # Remove additional properties and array elements
    form.find(".property, .array-item").remove()
    setTimeout -> form.find("input[type=range]").trigger "input"
    return

  # Add property
  form.on "click", "a[data-add-property]", (e) ->
    property_name = prompt "Property name"
    if property_name
      # Added property id
      id = if $(e.target).data('add-property')
        "#{$(e.target).data('add-property')}[#{property_name}]"
      else property_name
      # Check if already exist
      if $("[name='#{id}']").length > 0
        notification "Property #{id} already present", 'danger'
        return
      # Get elements
      parent_div = $(e.target).closest "div"
      template = $ parent_div.find("template").clone().prop "content"
      # Index labels for and input id
      timestamp = new Date().getTime()
      template.find("div:not(.property)").each () ->
        $(@).find("label")
          .attr "for", "#{id}"
          .html (i, val) -> "#{val}".replace "[]", "[#{property_name}]"
        $(@).find(":input")
          .attr "id", "#{id}"
          .attr "name", "#{id}"
        return
      # Append property
      parent_div.closest(".additional-property").append template
    return

  # Remove additional property
  form.on "click", "a[data-remove-property]", (e) -> $(e.target).closest(".property").remove()

  # Add array item
  form.on "click", "a[data-add]", (e) ->
    # Get elements
    parent_div = $(e.target).closest "div"
    container_div = parent_div.closest ".array"
    # Get template
    template = $ container_div.find("template").clone().prop "content"
    # Index labels for and input id
    timestamp = new Date().getTime()
    template.find("div:not(.array-item)").each () ->
      $(@).find("label").attr "for", (i, val) -> "#{val}#{timestamp}"
      $(@).find(":input").attr "id", (i, val) -> "#{val}#{timestamp}"
      return
    # Append item
    container_div.find("template").after template
    return

  # Remove array item
  form.on "click", "a[data-remove]", (e) -> $(e.target).closest(".array-item").remove()

  # Prevent event for injected links
  form.on "click", "a.prevent-default", (e) -> e.preventDefault()

  # Submit event
  form.on "submit", (e) ->
    # Check if has a path
    if schema.path
      # Check if logged
      if !storage.get 'login.user'
        notification 'Need to login', 'error'
      # Logged, check if admin
      else if storage.get('login.role') isnt 'admin'
        notification 'Login as admin', 'error'
      # Admin, check if fork
      else if storage.get('repository.fork') and schema.personal
        # Admin and fork, commit and pull request
        pull_request form
      # Admin, no fork or no personal, commit
      else commit form
    # No path, log yaml
    else console.log jsyaml.dump form.serializeJSON()
    return

  return