# Set stored theme
$('html').addClass "theme-#{storage.get 'storage.theme'}"

# Toggle
$("a[href='#theme']").on 'click', ->
  html = $('html').toggleClass('theme-dark theme-light')
  storage.set('storage.theme', if html.hasClass('theme-dark') then 'dark' else 'light')
  return