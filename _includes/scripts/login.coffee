###
  Need:
  - Login link with href "login"
  - storage.coffee script
###
login =
  link: $ "[href='login']"
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
  return

login.serve = (e) ->
  e.preventDefault()
  token = prompt "Paste a GitHub personal token"
  if !token then return
  $.ajaxSetup {headers:
    "Authorization": "token #{token}"
    "Accept": "application/vnd.github.v3+json"
  }
  storage.set "login.token", token
  auth = $.get "{{ site.github.api_url }}/user"
  auth.done (data, status) ->
    storage.set "login.user", data.login
      .set "login.created", new Date()
    login.permissions()
    return
  auth.fail (request, status, error) -> notification "Login #{status} #{error}", 'error'
  return

login.permissions = ->
  repo = $.get "{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}"
  repo.fail (request, status, error) -> notification "Permissions #{status} #{error}"
  repo.done (data, status) ->
    storage.set "login.permissions", data.permissions
      .set "repository.fork", data.fork
      .set "repository.parent", data.parent?.full_name?
      .set "login.role", if data.permissions.admin then "admin" else "guest"
    return
  repo.always () ->
    login.setLink 'logout'
    notification login.text
  return

login.logout = (e) ->
  e.preventDefault()
  login.setLink 'login'
  notification 'Logged out', 'error'
  true

login.setLink = (status) ->
  if status is 'logout'
    login.link.text "Logout"
      .off "click"
      .on "click", login.logout
      .attr "title", login.text
  if status is 'login'
    storage.clear 'login'
    $.ajaxSetup {headers: {}}
    login.link.text "Login"
      .off "click"
      .on "click", login.serve
      .attr 'title', "Login link"
  return

login.init()