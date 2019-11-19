---
layout: default
title: Jincheng's Website | Academic
use-math: true
---

# Talk

<div class="post">

<ul>
{% for talk in site.data.talk.Talk %}
	<li>{{ talk.Date | date: "%b. %-d, %Y" }} » <a style = "cursor:pointer" onclick="detail = document.getElementById('{{ talk.Date }}'); if(detail.style.display === 'none'){detail.style.display = 'block';}else{detail.style.display='none';}">{{ talk.Title }}</a></li>
	<div id="{{ talk.Date }}" style="display:none">
	<p><b>{{ talk.Location }}</b>, <i>{{ talk.Series }}</i></p>
	<p><b>Abstract</b>: {{ talk.Abstract }}</p>
	</div>
{% endfor %}
</ul>

</div>

# Conference and Summer School

<div class="post">

<ul>
{% for conference in site.data.conference.Conference %}
	<li>
		<a href = "{{ conference.URL }}"> {{ conference.Title }} </a>
		<p style="display: flex; justify-content: space-between">
			<span>
				<b>{{ conference.Location }}</b>
			</span>
			<span>
				{{ conference.Start | date: "%m/%d/%Y" }} - {{ conference.End | date: "%m/%d/%Y" }}
			</span>
		</p>
	</li>
{% endfor %}
</ul>

</div>