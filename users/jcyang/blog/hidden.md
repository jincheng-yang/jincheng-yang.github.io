---
layout: default
title: Jincheng's Website | Blog
---

# Research Blog

<div class="post">
<ul class="posts">
{% for post in site.posts %}
	<li><span>{{ post.date | date: "%b. %-d, %Y" }}</span> » <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
</div>

