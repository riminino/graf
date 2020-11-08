commit = (form) ->
  yml = jsyaml.dump form.serializeJSON()
  path = "_data/#{form.data('path') ? 'default'}.yml"
  url = "{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}/contents/#{path}"
  get = $.get url
  get.fail (request, status, error) ->
    if error == 'Not Found'
      load = {message: "Create #{path}", content: btoa yml}
      create = $.ajax url, {method: 'PUT', data: JSON.stringify load}
      create.fail (request, status, error) -> notification "#{load.message} #{status} #{error}", 'error'
      create.done (data, status) -> notification "#{load.message} #{status}"
    else notification "Get #{status} #{error}", 'error'
    return
  get.done (data, status) ->
    content = if form.data('append')? then atob(data.content) + yml else yml
    load = {message: "Update #{path}", sha: data.sha, content: btoa content}
    update = $.ajax url, {method: 'PUT', data: JSON.stringify load}
    update.fail (request, status, error) -> notification "#{load.message} #{status} #{error}", 'error'
    update.done (data, status) -> notification "#{load.message} #{status}"
  return