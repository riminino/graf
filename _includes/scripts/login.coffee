###
  Need:
  - Login link with href "login"
  - storage.coffee script
###
$.ajaxSetup
  url: "{{ site.github.api_url }}/graphql"
  type: "POST"

login =
  link: $ "[href='login']"
  text: -> "Logout as #{storage.get 'login.user'} (#{storage.get('login.permission')})"

login.init = ->
  if storage.get("login.token")
    $.ajaxSetup {headers: "Authorization": "token #{storage.get 'login.token'}"}
    login.setLink 'logout'
  else
    login.setLink 'login'
  return

login.serve = (e) ->
  e.preventDefault()
  token = prompt "Paste a GitHub personal token"
  if !token then return
  $.ajaxSetup {headers: "Authorization": "token #{token}"}
  storage.set "login.token", token
  graph = $.ajax data: JSON.stringify { query:
    'query{viewer{login}repository(owner:"riminino", name:"graf"){viewerPermission isFork}}'
  }
  graph.done (obj, status) ->
    storage.set "login.user", obj.data.viewer.login
      .set "login.created", new Date()
      .set "login.permission", obj.data.repository.viewerPermission
    login.setLink 'logout'
    notification login.text
    return
  graph.fail (request, status, error) ->
    storage.clear 'login'
    $.ajaxSetup {headers: {}}
    notification "#{status} #{error}", 'error'
  return

login.logout = (e) ->
  e.preventDefault()
  storage.clear 'login'
  $.ajaxSetup {headers: {}}
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
    login.link.text "Login"
      .off "click"
      .on "click", login.serve
      .attr 'title', "Login link"
  return

login.init()