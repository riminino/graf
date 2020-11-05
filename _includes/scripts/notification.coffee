notification = (text, cls="") ->
  div = $ '#notification'
  div.text text
  div.attr 'class', cls
  div.show()
  setTimeout ->
    div.fadeOut()
  , 2000
  return