---
layout: default
title: Jincheng's Website | Blog
---

# Research Blog

<div class="post">
<ul class="posts">
{% for post in site.posts %}
{% if post.hide %}
{% else %}
	<li><span>{{ post.date | date: "%b. %-d, %Y" }}</span> » <a href="{{ post.url }}.html" title="{{ post.title }}">{{ post.title }}</a></li>
{% endif %}
{% endfor %}
</ul>
</div>

