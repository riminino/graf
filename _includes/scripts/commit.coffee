commit = (form) ->
  # Prepare data
  schema = if form.data 'schema' then JSON.parse decodeURIComponent form.data('schema')
  yml = jsyaml.dump form.serializeJSON()
  path = "_data/#{schema.path}.yml"
  url = "{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}/contents/#{path}"
  # Get file
  busy form, true
  get = $.get url
  get.fail (request, status, error) ->
    # Check if error is 'Not Found'
    if error == 'Not Found'
      # Create file
      load = {message: "Create #{path}", content: btoa yml}
      create = $.ajax url, {method: 'PUT', data: JSON.stringify load}
      create.fail (request, status, error) -> notification "#{load.message} #{status} #{error}", 'error'
      create.done (data, status) -> notification "#{load.message} #{status}"
      create.always -> busy form, false
    else
      # Some error
      notification "Get #{status} #{error}", 'error'
      busy form, false
    return
  # Update file
  get.done (data, status) ->
    # Check if `type` is `array`, append new element
    content = if schema.type is 'array' then atob(data.content) + yml else yml
    load = {message: "Update #{path}", sha: data.sha, content: btoa content}
    update = $.ajax url, {method: 'PUT', data: JSON.stringify load}
    update.fail (request, status, error) -> notification "#{load.message} #{status} #{error}", 'error'
    update.done (data, status) -> notification "#{load.message} #{status}"
    update.always -> busy form, false
  return