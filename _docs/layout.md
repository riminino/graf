---
weight: 2
---

# Write

Type
- Page: root folder
- Collection page: `_post`, `_docs`...
- Drafts: a unpublished collection with posts without a date `_draft`

Title
- Front matter `title: <My Title>`
- First heading `# My Title`

Filename
- Page: `title-slug.md`
- Blog post: `YYYY-MM-DD-title-slug.md`

Tags
- Front matter array `tags: ["tag1", "tag2"]`
- Iterating on `site.tags` gives `tag[0] = "tag1"` and `tag[1] = [<posts array>]`

Categories
- Front matter array `categories: ["category1", "category2"]`
- Iterating on `site.categories` gives `category[0] = "category1"` and `category[1] = [<posts array>]`

Excerpt
- By default is the first paragraph `post.excerpt`

Permalink
- `pretty` gives the date if present `/:categories/:year/:month/:day/:title/`
- Override with `permalink: /:collection/:name/` where `name` is the filename slug

## Actions

```yml
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