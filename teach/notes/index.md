---
layout: post
title: Lecture notes
---
### Ordinary Differential Equations

{% assign pages = site.pages %}
{% for page in pages %}{% if page.path contains "teach/notes/ode" %}
* [{{ page.title }}]({{site.baseurl}}{{ page.url }})
{% endif %}{% endfor %}