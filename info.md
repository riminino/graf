---
---
# Info

{% assign gh = site.github %}
{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}
<table>
  <thead>
    <tr>
      <th>Repository</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Nwo</td>
      <td><a href="{{ gh.repository_url}}">{{ gh.repository_nwo }}</a></td>
    </tr>
    <tr>
      <td>Owner type</td>
      <td>{{ repo.owner.type }}</td>
    </tr>
    <tr>
      <td>Fork</td>
      <td>{{ repo.fork | inspect }}</td>
    </tr>
  </tbody>
  <thead>
    <tr>
      <th>Updates</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Repository</td>
      <td>{% include widgets/datetime.html datetime=repo.updated_at replace=true %}</td>
    </tr>
    <tr>
      <td>Site</td>
      <td>{% include widgets/datetime.html datetime=site.time replace=true %}</td>
    </tr>
  </tbody>
  <thead>
    <tr>
      <th>Logs</th>
      <th></th>
    </tr>
  </thead>
  <tbody class="logs">
    <tr class="if-alone">
      <td colspan="2">No activity</td>
    </tr>
  </tbody>
</table>

<details><summary>GitHub Meatadata</summary>
<div markdown="1">
## GitHub
{% assign gh = site.github %}

```liquid
{% raw %}{% assign gh = site.github %}{% endraw %}
```

|`gh` property|value
|:--|:--|
|build_revision|{{gh.build_revision}}
|repository_nwo|{{gh.repository_nwo}}
|versions.jekyll|{{gh.versions.jekyll}}
|is_user_page|{{gh.is_user_page|inspect}}
|environment|{{gh.environment}}
|is_project_page|{{gh.is_project_page|inspect}}
|contributors.size|{{gh.contributors.size}}

## Repository
{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}

```liquid
{% raw %}{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}{% endraw %}
```

|`repo` property|value
|:--|:--|
|fork|{{repo.fork|inspect}}
|forks|{{repo.forks}}
|owner.type|{{repo.owner.type}}
|updated_at|{{repo.updated_at}}
|default_branch|{{repo.default_branch}}

## Contributor

```liquid
{% raw %}{% assign contributor = gh.contributors.first %}{% endraw %}
```
{% assign contributor = gh.contributors.first %}

|`contributor` property|value
|:--|:--|
|login|{{contributor.login}}
|contributions|{{contributor.contributions}}

## URLs

|`site.url`|{{site.url}}
|`site.host`|{{site.host}}
|`site.baseurl`|{{site.baseurl}}
|`gh.repository_url`|{{gh.repository_url}}
|`gh.pages_hostname`|{{gh.pages_hostname}}
|`gh.api_url`|{{gh.api_url}}
|`repo.homepage`|{{repo.homepage}}

</div>
</details>