notification = (text, cls="") ->
  div = $ '#notification'
  div.text text
    .attr 'class', cls
    .show()
  setTimeout ->
    div.fadeOut()
  , 2500
  return