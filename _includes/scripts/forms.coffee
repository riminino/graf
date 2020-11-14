$("form").each ->
  form = $ @
  
  # Update RANGE output
  form.find("input[type=range]").each ->
    $(@).on "input", (e) -> $(e.target).closest('div').find("output").val $(e.target).val()
    # Initial update
    $(@).trigger "input"
    return

  # Reset event
  form.on "reset", (e) ->
    # form.find("#timestamp").val ""
    # # Remove array items and reset index
    # form.find(".array-item").remove()
    # Remove additional properties
    form.find("div.property").remove()
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
      parent_div.closest("div.additional-property").append template
    return

  # Remove additional property
  form.on "click", "a[data-remove-property]", (e) -> $(e.target).closest("div.property").remove()

  # Prevent event for injected links and reset invalid fields
  form.on "click", "a[prevent-default]", (e) ->
    e.preventDefault()
    form.find(".invalid").removeClass "invalid"

  # Submit event
  form.on "submit", (e) ->
    # Check if is live
    if form.data('live')?
      # Check if logged
      if !storage.get 'login.user'
        notification 'Need to login', 'error'
      # Logged, check if admin
      else if storage.get('login.role') isnt 'admin'
        notification 'Login as admin', 'error'
      # Logged as admin, check if personal
      else if form.data('personal')?
        # Personal, check if fork
        if storage.get('repository.fork')
          # Personal and fork, commit and pull request
          pull_request form
        else notification 'Need a fork to pull request', 'error'
      # Not personal, commit
      else commit form
    else console.log jsyaml.dump form.serializeJSON()
    return

  return