$("#write-page").each ->

  update_path = ->
    collection = if $('[name=type]:checked').val() is 'post'
      "_" + $('#collection').val()
    else ''
    $('#path').val [collection].filter(Boolean).join('/')
    return

  # Filename on 'title' input
  $('#title').on 'input', ->
    title_slug = $('#title').val().toLowerCase().replace /[^a-zA-Z0-9]+/g,'-'
    date = if $('#date').prop('checked') and !!$('#date:visible').length
      new Date().toISOString().slice(0, 10) + '-'
    else ''
    $('#filename').val date + title_slug + '.md'
    return

  # Date on filename
  $('#date').on 'change', -> $('#title').trigger 'input'

  # Path and Filename on page #type and #collection 'change'
  $('#collection, [name=type]').on 'change', ->
    update_path()
    $('#title').trigger 'input'
    return

  # Submit
  $(@).on 'submit', ->
    console.log $(@).serializeJSON()
    return

  return