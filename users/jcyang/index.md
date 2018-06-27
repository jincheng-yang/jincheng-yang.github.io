---
layout: base
title: Jincheng's Website | About
---

<div class="transparent">
<div class="container" markdown="1">

<img src="/users/jcyang/assets/images/photo5.jpg" style="float:right; width:200px; max-width:100%; padding-left: 100px">

# About Me

Hi, I am a first year graduate student at [The University of Texas at Austin](https://www.utexas.edu). I major in Mathematics, and I am interested in differential equations. I received my bachelor degree at [Xi'an Jiaotong University](http://www.xjtu.edu.cn), where I was also a student of [Special Class for the Gifted Young](http://www.xajdsnb.com) before my undergraduate study. 

Currently, I do not have an academic advisor. 

Apart from the math study, I also love programming and piano performance.

</div>
</div>

<div class="eggshell">
<div class="container" markdown="1">

### Contact Information

<div style="float:right">
<div style="display:inline" markdown="1">
- Office: RLM 11.134
- Email: [jcyang@math.utexas.edu](mailto:jcyang@math.utexas.edu)
- Tel: +1 (512) 317-7231
</div>
</div>

<div>
<p style="margin:0px; padding:0px">
Jincheng Yang (杨 金成)
</p>
<p style="margin:0px; padding:0px">
Department of Mathematics, RLM 11.130
</p>
<p style="margin:0px; padding:0px">
The University of Texas at Austin
</p>
<p style="margin:0px; padding:0px">
2515 Speedway Stop C1200
</p>
<p style="margin-top:0px; padding:0px">
Austin, TX 78712-1202, USA
</p>
</div>

</div>
</div>

<div class="aliceblue">
<div class="container" markdown="1">

### Education

- **Xi'an Jiaotong University**, B.Sc. in Mathematics and Applied Mathematics (Aug. 2013 - June 2017)
- **The University of Texas at Austin**, Ph.D. candidate in Mathematics (Aug. 2017 - Present)

</div>
</div>


<div class="gallery">
<div class="container">

<h3>Gallery</h3>

{% assign my_posts = site.posts | where:"image",true %}
{% assign firstPost = true %}
{% for post in my_posts limit: 3 %}{% if firstPost == true %}
<div class="thumb">
	{% assign firstPost = false %}
{% else %}<div class="thumb" style="margin-left:5%">
{% endif %}
<a href="{{ post.url }}" title="{{ post.title }}">
<div class="thumbpic" style="background-image:url('/users/jcyang/assets/images/thumbnails/{{ post.thumb }}')"></div>
</a>
<h5>{{ post.date | date_to_string }}</h5>
<a href="{{ post.url }}" title="{{ post.title }}">
	<h4>{{ post.title }}</h4>
</a>
</div>{% endfor %}

</div>
</div>