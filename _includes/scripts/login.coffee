###
  Need:
  - Login link with .login-link class
  - storage.coffee script
  - busy.coffee script
###
login =
  link: $ "a.login-link"
  text: -> "Logged as #{storage.get 'login.user'} (#{storage.get 'login.role'})"

login.init = ->
  if storage.get("login.token")
    $.ajaxSetup {headers:
      "Authorization": "token #{storage.get 'login.token'}"
      "Accept": "application/vnd.github.v3+json"
    }
    login.setLink 'logout'
  else
    login.setLink 'login'
  true

login.serve = (e) ->
  e.preventDefault()
  token = prompt "Paste a GitHub personal token"
  if !token then return
  $.ajaxSetup {headers:
    "Authorization": "token #{token}"
    "Accept": "application/vnd.github.v3+json"
  }
  storage.set "login.token", token
  busy login.link, true
  auth = $.get "{{ site.github.api_url }}/user"
  auth.done (data, status) ->
    storage.set "login.user", data.login
      .set "login.created", new Date()
    login.permissions()
    return
  auth.fail (request, status, error) ->
    notification "Login #{status} #{error}", 'danger'
    login.setLink 'login'
    return
  true

login.permissions = ->
  repo = $.get "{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}"
  repo.fail (request, status, error) -> notification "Permissions #{status} #{error}", 'danger'
  repo.done (data, status) ->
    storage.set "login.role", if data.permissions.admin then "admin" else "guest"
      .set "repository.fork", data.fork
      .set "repository.parent", data.parent?.full_name?
    return
  repo.always () ->
    login.setLink 'logout'
    notification login.text(), 'success'
    return
  true

login.logout = (e) ->
  e.preventDefault()
  login.setLink 'login'
  notification 'Logged out', 'info'
  true

login.setLink = (status) ->
  busy login.link, false
  if status is 'logout'
    login.link.text "Logout"
      .off "click"
      .on "click", login.logout
      .attr "title", login.text
    $('html').removeClass('not-logged').addClass "role-#{storage.get 'login.role'} logged"
  if status is 'login'
    storage.clear 'login'
    $.ajaxSetup {}
    login.link.text "Login"
      .off "click"
      .on "click", login.serve
      .attr 'title', "Login link"
    $('html').removeClass('role-admin role-guest logged').addClass 'not-logged'
  true

login.init()