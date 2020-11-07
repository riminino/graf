pull_request = (form) ->
  path = "_data/users/#{storage.get 'login.user'}/#{form.data('path') ? 'default'}.yml"
  console.log path, jsyaml.dump form.serializeJSON()