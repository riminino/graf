notification_el = $ '#notification'
notification_el.on 'click', -> $(@).empty().hide()

notification = (text, cls="") ->
  # Store in logs
  logs_array = storage.get 'storage.logs'
  logs_array.unshift {time: new Date(), text: text, cls: cls}
  storage.set 'storage.logs', logs_array.slice(0, 15)
  # Show notification
  notification_el.empty().append(
    $('<div/>', {text: text, class: cls})
  ).show()
  setTimeout ->
    notification_el.fadeOut()
  , 2500
  return


$("a[href='#logs']").on "click", (e) ->
  e.preventDefault()
  notification_el.empty().show()
  for log in storage.get 'storage.logs'
    span = $('<span/>', {
      datetime: log.time
      'data-replace': true
    })
    dateTime span
    notification_el.append(
      $('<div/>', {
        class: log.cls
      }).append([
        span,
        $('<span/>', {text: ": #{log.text}"})
      ])
    )
  true
