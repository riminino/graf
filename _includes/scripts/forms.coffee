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
    # form.find("#timestamp").val ""
    # # Remove array items and reset index
    # form.find(".array-item").remove()
    setTimeout -> form.find("input[type=range]").trigger "input"
    return

  # Submit
  form.on "submit", (e) ->
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
    return