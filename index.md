---
title: Home
---
# GitHub
{% assign gh = site.github %}

```liquid
{% raw %}{% assign gh = site.github %}{% endraw %}
```

|`gh` property|value
|:--|:--|
|pages_hostname|{{gh.pages_hostname}}
|api_url|{{gh.api_url}}
|build_revision|{{gh.build_revision}}
|repository_nwo|{{gh.repository_nwo}}
|repository_url|{{gh.repository_url}}
|versions.jekyll|{{gh.versions.jekyll}} `<meta name="generator" content="Jekyll v3.9.0">`{:.language-html}
|is_user_page|{{gh.is_user_page|inspect}}
|is_project_page|{{gh.is_project_page|inspect}}
|contributors.size|{{gh.contributors.size}}

# Repository
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
|homepage|{{repo.homepage|inspect}}
|default_branch|{{repo.default_branch}}

# Contributor

```liquid
{% raw %}{% assign contributor = gh.contributors.first %}{% endraw %}
```
{% assign contributor = gh.contributors.first %}

|contributor.login|{{contributor.login}}
|contributor.contributions|{{contributor.contributions}}

# URLs

|site.url|{{site.url}}
|site.host|{{site.host}}
|site.baseurl|{{site.baseurl}}
|gh.environment|{{gh.environment|inspect}}