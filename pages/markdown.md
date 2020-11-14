---
permalink: markdown
weight: 2
---

# Markdown

This is a paragraph with a [link](#).

## Details

<details>
  <summary>Open detail</summary>
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</details>

## Forms

Top margin

<form prevent-default>
<h3>Form title</h3>
<div>
  <label for="age">Age</label>
  <input type="number" id="age" name="age" placeholder="Age" required>
</div>
<div>
  <label for="color">Color</label>
    <input type="color" id="color" name="color">
</div>
<div>
  <label for="birt_date">Birth date</label>
    <input type="date" id="birt_date" name="birt_date" required>
</div>
<div>
  <label for="email">Email address</label>
  <input type="email" id="email" name="email" placeholder="Email address" required>
  <small>We'll never share your email with anyone else.</small>
</div>
<input type="text" placeholder="Disabled" disabled>
<input type="text" placeholder="Readonly" readonly>
<div>
  <label for="range">Range</label><output></output>
  <input type="range" id="range" name="range">
</div>
<!-- Select -->
<div>
  <label for="country">Country</label>
  <select id="country">
    <option selected>Choose...</option>
    <optgroup label="Europe">
      <option value="italy">Italy</option>
    </optgroup>
    <option value="usa">USA</option>
  </select>
</div>

<!-- Radios -->
<div>
  <label>Gender</label>
  <label for="male">
    <input type="radio" id="male" name="gender" value="male" checked> Male
  </label>
  <label for="female">
    <input type="radio" id="female" name="gender" value="female"> Female
  </label>
  <label for="other">
    <input type="radio" id="other" name="gender" value="other"> Other
  </label>
</div>

<textarea name="textarea" id="textarea" rows="5" placeholder="Text"></textarea>

<!-- Checkbox -->
<div>
  <label>Checkboxes</label>
  <label for="terms">
    <input type="checkbox" id="terms" name="terms"> I agree to the
  </label>
  <label for="bio">
    <input type="checkbox" id="bio" name="bio"> Terms and Conditions
  </label>
</div>

<!-- Button -->
<div>
  <input type="submit" value="Submit">
  <input type="reset" name="" value="Reset">
  <input type="button" disabled name="" value="Disabled">
</div>
<!-- Button -->
<div>
  <button type="submit">Submit</button>
  <button type="reset">Reset</button>
  <button type="button" disabled>Disabled</button>
</div>

</form>

Check bottom margin

## Code

Fenced <code class="highlight">```yml</code>

```yml
city: 1
coas: "ok"
array:
  - 1
  - 2
  - three
array: [1, 2, "three"]
```

Liquid `{% raw %}{%- highlight yml -%}{% endraw %}`{:.language-liquid}

{%- highlight yml -%}
city: 1
coas: "ok"
array:
  - 1
  - 2
  - three
array: [1, 2, "three"]
{%- endhighlight -%}

Kramdown code block `~~~ yml`

~~~ yml
city: 1
coas: "ok"
array:
  - 1
  - 2
  - three
array: [1, 2, "three"]
~~~

Kramdown lines indented `{:.language-yml}`

{:.language-yml}
    city: 1
    coas: "ok"
    array:
      - 1
      - 2
      - three
    array: [1, 2, "three"]