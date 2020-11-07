$("form").each ->
  form = $ @
  
  # Update RANGE output
  form.find("input[type=range]").each ->
    $(@).on "input", (e) -> $(e.target).closest('div').find("output").val $(e.target).val()
    # Initial update
    $(@).trigger "input"
    return

  # Reset
  form.on "reset", (e) ->
    form.find("#timestamp").val ""
    # Remove array items and reset index
    form.find(".array-item").remove()
    setTimeout -> form.find("input[type=range]").trigger "input"
    # Remove invalid class
    form.find(".invalid").removeClass "invalid"
    return

  # Submit
  form.on "submit", (e) ->
    if !storage.get 'login.user'
      notification 'Need to login', 'error'
    else if form.data('personal')?
      if storage.get('login.role') is 'admin'
        notification 'Login as guest', 'error'
      else pull_request form
    else if storage.get('login.role') isnt 'admin'
      notification 'Login as admin', 'error'
    else commit form
    return