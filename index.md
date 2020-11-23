---
title: Home
weight: 0
---
# Schema
{:.no_toc}

- `autofocus: true`{:.language-yml} will autofocus the input field (will change initial scroll position)

1. toc
{:toc}

## Simple

{% include schema/form.html schema=site.data.test.simple %}

## Widgets

{% include schema/form.html schema=site.data.test.widgets %}

## Refs

{% include schema/form.html schema=site.data.test.refs %}

## Numbers

{% include schema/form.html schema=site.data.test.numbers %}

## array

{% include schema/form.html schema=site.data.test.array %}

## additional properties

{% include schema/form.html schema=site.data.test.additional_properties %}