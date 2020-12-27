---
weight: 2
---

# Write

- toc
{:toc}

Todo: Render form with schema

{% include page/write_form.html %}

## Path

Type
- Page: root folder or subfolders (included in `page.path`)
  - `site.html_pages | map: "weight"`: {{ site.html_pages | map: "weight" | inspect }}
- Collection page: `_post`, `_docs`...
  - `site.collections | map: "weight"`: {{ site.collections | map: "weight" | inspect }}
- Drafts: a unpublished collection with posts without a date `_draft`

Filename
- Page: `title-slug.md`
- Blog post: `YYYY-MM-DD-title-slug.md`
- Date can be overriden in page _front matter_ with `YYYY-MM-DD HH:MM:SS +/-TTTT`
- `date: "%Y-%m-%d"`: {{ site.time | date: "%Y-%m-%d" }}

Permalink
- `pretty` gives the date if present `/:categories/:year/:month/:day/:title/`
- Override with `permalink: /:collection/:name/` where `name` is the filename slug
- `site.permalink`: {{ site.permalink | inspect }}

Categories
- directory structure above `_posts`, for example `/cat1/cat2/_posts/post.md`
- Iterating on `site.categories` gives `category[0] = "category1"` and `category[1] = [<posts array>]`
- `site.categories`: {{ site.categories | inspect }}

## Front matter

Title
- Front matter `title: My Title`
- First heading `# My Title`

Tags
- Front matter array `tags: ["tag1", "tag2"]`
- Iterating on `site.tags` gives `tag[0] = "tag1"` and `tag[1] = [<posts array>]`

Categories
- Front matter array `categories: ["category1", "category2"]`

## Content

Excerpt
- By default is the first paragraph `post.excerpt`
- `site.excerpt_separator`: {{ site.excerpt_separator | inspect }}

# Actions

```yml
# GMT
# At minute 1 past every hour
#- cron:  '1 */1 * * *'
# At minute 1 past every 24th hour
- cron: '1 */24 * * *'
```

```js
console.log(context)
Context {
  payload: { schedule: '1 */1 * * *' },
  eventName: 'schedule',
  sha: '5ab49d454bde3f08f19ab423d9db516ccf955d0a',
  ref: 'refs/heads/main',
  workflow: 'Request Page Build',
  action: 'actionsgithub-script',
  actor: 'trasparente',
  job: 'build',
  runNumber: 7,
  runId: 401533782
}
```

```js
console.log(build)
data: {
  status: 'queued',
  url: 'https://api.github.com/repositories/308975011/pages/builds/latest'
}
```

```js
// Get GitHub Pages to get source branch
const pages = github.repos.getPages({
  owner: context.repo.owner,
  repo: context.repo.repo
});

// Get branch to get branch sha
//const branch = await github.repos.getBranch({
//  owner: context.repo.owner,
//  repo: context.repo.repo,
//  branch: pages.source.branch
//});

// Request Pages Build
github.repos.requestPagesBuild({
  owner: context.repo.owner,
  repo: context.repo.repo
})

// Output
console.log(pages, pages.source.branch)
```