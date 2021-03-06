# Set stored mode
$('html').addClass "mode-#{storage.get 'storage.mode'}"

# Toggle
$("a.mode-toggle-link").on 'click', (e) ->
  html = $('html').toggleClass('mode-dark mode-light')
  storage.set('storage.mode', if html.hasClass('mode-dark') then 'dark' else 'light')
  return