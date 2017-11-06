---
layout: default
title: Jincheng's Website | Shorthand
---

# Learning List

{% assign monArr = 'January,February,March,April,May,June,July,August,September,October,November,December' | split:',' %}
{% assign scan_files = site.static_files | where: "shorthand-scan", true %}
<ol>
{% for myscan in scan_files %}
	{% assign year = myscan.basename | slice: 0, 4 %}
	{% assign month = myscan.basename | slice: 4, 2 | plus: -1 %}
	{% assign month = monArr[month] %}
	{% assign day = myscan.basename | slice: 6, 2 %}
	{% assign date = year | append: " " | append: month | append: " " | append: day %}
	<li>
		Notes on <a href = "{{ myscan.path }}">{{ date | date: "%B %d, %Y" }}</a>
	</li>
{% endfor %}
</ol>