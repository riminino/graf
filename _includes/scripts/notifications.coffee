# Render a single log for details
return_log = (log) ->
  span = $('<span/>', {
    datetime: log.time
    'data-replace': true
  })
  dateTime span
  row = $('<tr/>').append([
    $('<td/>').append(span),
    $('<td/>', {class: log.cls ? 'success'}).append(
      $('<span/>', {text: log.text})
    )
  ])
  return row

# Show notification on screen top
notification = (text, cls="success") ->
  # Store in storage
  logs_array = storage.get 'storage.logs'
  logs_array.unshift {time: new Date(), text: text, cls: cls}
  storage.set 'storage.logs', logs_array.slice(0, 20)
  # Append in logs details
  $('.logs').prepend return_log {
    time: new Date()
    text: text
    cls: cls
  }
  # Show notification
  $('#notification').empty().append(
    $('<div/>', {text: text, class: cls})
  ).show()
  # Fade out timer
  setTimeout ->
    $('#notification').fadeOut()
  , 3000
  return

# Click to hide
$('#notification').on 'click', -> $(@).hide()

# Populate logs details
$('.logs').append(Array.from(storage.get('storage.logs'), (log) -> return_log log ))