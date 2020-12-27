---
permalink: info/
---
# Info

{% assign gh = site.github %}
{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}

Repository |
--|--
Nwo | [{{ gh.repository_nwo }}]({{ gh.repository_url }})
Owner type | {{ repo.owner.type }}
Fork | {{ repo.fork | inspect }}
Updated | {% include widgets/datetime.html datetime=repo.updated_at replace=true %}
Site build | {% include widgets/datetime.html datetime=site.time replace=true %}

<table>
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

`gh` property | value
:--|:--|
build_revision | {{ gh.build_revision }}
repository_nwo | {{ gh.repository_nwo }}
versions.jekyll | {{ gh.versions.jekyll }}
is_user_page | {{ gh.is_user_page | inspect }}
is_project_page | {{ gh.is_project_page | inspect }}
environment | {{ gh.environment }}
contributors.size | {{ gh.contributors.size }}
releases.size | {{ gh.releases.size }}

## Repository
{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}

```liquid
{% raw %}{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}{% endraw %}
```

`repo` property | value
:--|:--|
fork | {{ repo.fork | inspect }}
forks | {{ repo.forks }}
owner.type | {{ repo.owner.type }}
updated_at | {{ repo.updated_at }}
default_branch | {{ repo.default_branch }}

## Contributor

```liquid
{% raw %}{% assign contributor = gh.contributors.first %}{% endraw %}
```
{% assign contributor = gh.contributors.first %}

`contributor` property | value
:--|:--|
login | {{ contributor.login }}
contributions | {{ contributor.contributions }}

## Release

```liquid
{% raw %}{% assign release = gh.releases.first %}{% endraw %}
```
{% assign release = gh.releases.first %}

`release` property | value
:--|:--|
tag_name | {{ release.tag_name }}
name | {{ release.name }}
body | {{ release.body }}
created_at | {{ release.created_at }}

## URLs

`site.url` | {{ site.url }}
`site.host` | {{ site.host }}
`site.baseurl` | {{ site.baseurl }}
`gh.repository_url` | {{ gh.repository_url }}
`gh.pages_hostname` | {{ gh.pages_hostname }}
`gh.api_url` | {{ gh.api_url }}
`repo.homepage` | {{ repo.homepage }}

</div>
</details>