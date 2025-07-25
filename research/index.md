---
layout: grid
title: Jincheng's Website | Research
use-math: true
---

<div>
<div class="content" markdown="1">

# Research

My general research interest includes the area of analysis, dynamic systems, and partial differential equations, especially those arising in the field of fluid mechanics, including 

* Euler equations
* Navier-Stokes equations 
* Boltzmann equation
* Fokker-Planck equation

I am also interested in topics related to distributionally robust stochastic optimization.

</div>
</div>

<div style="background-color:antiquewhite" id="publications">
<div class="content" markdown="1">

###### Publications

{% include publication %}

</div>
</div>

<div style="background-color:aliceblue" id="talks">
<div class="content" markdown="1">

###### Talks

<ol>
{% for talk in site.data.talk.Talk %}
{% assign today_date = 'now' | date: '%s' %}
{% assign pre_date = talk.Date | date: '%s' %}
{% if today_date > pre_date %}
	<li>
		<a href = "{{ conference.URL }}"> {{ conference.Title }} </a>
		<p style="display: flex; justify-content: space-between">
			<span>
				<b>{{ talk.Title }}</b>
			</span>
			<span style="min-width: 6em; text-align: right">
				{{ talk.Date }}
			</span>
		</p>
		<p style="display: flex; justify-content: space-between">
			<span>
				{{ talk.Location }}, <i>{{ talk.Series }}</i>
			</span>
			<span style="min-width: 6em; text-align: right">
				<a style = "cursor:pointer" onclick="detail = document.getElementById('{{ talk.Date }}'); if(detail.style.display === 'none'){detail.style.display = 'block';}else{detail.style.display='none';}">Abstract</a>
			</span>
		</p>

		<div id="{{ talk.Date }}" style='display:none'>
			<p><b>Abstract</b>: {{ talk.Abstract }}</p>
		</div>	
	</li>
{% endif %}
{% endfor %}
</ol>

</div>
</div>

<div id="blog">
<div class="content" markdown="1">

###### Research Blog

<div class="post">
<ul class="posts">
{% for post in site.posts %}
{% if post.hide %}
{% else %}
	<li><span>{{ post.date | date: "%b. %-d, %Y" }}</span> » <a href="{{ site.baseurl }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a></li>
{% endif %}
{% endfor %}
</ul>
</div>

</div>
</div>

<div style="background-color:antiquewhite" id="conferences">
<div class="content" markdown="1">

###### Conferences

<ul>
{% assign cfs = site.data.conference.Conference | where: "Type", "conference" %}
{% for conference in cfs %}
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

###### Summer Schools

<ul>
{% assign ssc = site.data.conference.Conference | where: "Type", "summer school" %}
{% for conference in ssc %}
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
</div>


