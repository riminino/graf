---
---
# ok
{% assign gh = site.github %}

```liquid
{% raw %}{% assign gh = site.github %}{% endraw %}
```

|`gh` property|value
|:--|:--|
|api_url|{{gh.api_url}}
|build_revision|{{gh.build_revision}}
|repository_nwo|{{gh.repository_nwo}}
|repository_url|{{gh.repository_url}}
|versions.jekyll|{{gh.versions.jekyll}} `<meta name="generator" content="Jekyll v3.9.0">`{:.language-html}
|is_user_page|{{gh.is_user_page|inspect}}
|is_project_page|{{gh.is_project_page|inspect}}
|contributors.size|{{gh.contributors.size}}

```liquid
{% raw %}{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}{% endraw %}
```
{% assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first %}

|`repo` property|value
|:--|:--|
|fork|{{repo.fork|inspect}}
|forks|{{repo.forks}}
|owner.type|{{repo.owner.type}}
|updated_at|{{repo.updated_at}}
|homepage|{{repo.homepage|inspect}}
|default_branch|{{repo.default_branch}}

```liquid
{% raw %}{% assign contributor = gh.contributors.first %}{% endraw %}
```
{% assign contributor = gh.contributors.first %}

|`contributor` property|value
|:--|:--
|login|{{contributor.login}}
|contributions|{{contributor.contributions}}
