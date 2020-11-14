# Render a single log for details
return_log = (log) ->
  span = $('<span/>', {
    datetime: log.time
    'data-replace': true
  })
  dateTime span
  div = $('<div/>').append([
    span,
    $('<code/>', {text: log.text, class: log.cls ? 'success'})
  ])
  return div

# Show notification on screen top
notification = (text, cls="success") ->
  notification_el = $ '#notification'
  # Store in storage
  logs_array = storage.get 'storage.logs'
  logs_array.unshift {time: new Date(), text: text, cls: cls}
  storage.set 'storage.logs', logs_array.slice(0, 20)
  # Append in logs details
  $("summary:contains('Logs')").parent("details").prepend return_log {
    time: new Date()
    text: text
    cls: cls
  }
  # Show notification
  notification_el.empty().append(
    $('<div/>', {text: text, class: cls})
  ).show()
  # Fade out timer
  setTimeout ->
    notification_el.fadeOut()
  , 3000
  return

# Click to hide
$('#notification').on 'click', -> $(@).hide()

# Populate logs details
$("summary:contains('Logs')").parent("details").append(Array.from(storage.get('storage.logs'), (log) -> return_log log
))