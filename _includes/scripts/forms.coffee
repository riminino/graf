$("form").each ->
  form = $ @
  
  # Update RANGE output
  form.find("input[type=range]").each ->
    $(@).on "input", (e) -> $(e.target).closest('div').find("output").val $(e.target).val()
    # Initial update
    $(@).trigger "input"
    return