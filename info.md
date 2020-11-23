---
permalink: /info
css:
  dark: Brown
---
# Info

{% assign gh = site.github %}
{%- assign repo = gh.public_repositories | where: "full_name", gh.repository_nwo | first -%}

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
