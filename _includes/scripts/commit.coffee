commit = (form) ->
  path = "_data/#{form.data('path') ? 'default'}.yml"
  url = "{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}/contents/#{path}"
  get = $.get url
  get.fail (request, status, error) ->
    if error == 'Not Found'
      load = {message: "Create file", content: btoa jsyaml.dump form.serializeJSON()}
      create = $.ajax url, {method: 'PUT', data: JSON.stringify load}
      create.fail (request, status, error) -> notification "Create #{status} #{error}", 'error'
      create.done (data, status) -> notification "Create #{status}"
    else notification "Get #{status} #{error}", 'error'
    return
  get.done (data, status) ->
    load = {message: "Update file", sha: data.sha, content: btoa jsyaml.dump form.serializeJSON()}
    update = $.ajax url, {method: 'PUT', data: JSON.stringify load}
    update.fail (request, status, error) -> notification "Update #{status} #{error}", 'error'
    update.done (data, status) -> notification "Update #{status}"
  return