---
weight: 5
---

# Login
{:.no_toc}

* toc
{:toc}

The link `<a href="#login">Login</a>`{:.language-html} will ask for a GitHub personal token <https://github.com/settings/tokens/new>.  
This token will be hashed and stored in `storage` until a logout.

## User role

The `<html>`{:.language-html} element will have the corresponding login and user role class:
- `class='not-logged'`{:.language-ruby}
- `class='logged'`{:.language-ruby}
- `class='role-admin'`{:.language-ruby}
- `class='role-guest'`{:.language-ruby}

Elements with corresponding class will show up:
- `class='if-logged'`{:.language-ruby} hidden if not logged
- `class='if-role-admin'`{:.language-ruby} hidden if logged as a guest or not logged
- `class='if-role-guest'`{:.language-ruby} hidden if logged as admin or not logged