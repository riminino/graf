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
