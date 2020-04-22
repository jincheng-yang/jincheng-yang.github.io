---
layout: base
title: Jincheng's Website | About
---

<div class="transparent">
<div class="container" markdown="1">

<img src="/users/jcyang/assets/images/photo5.jpg" style="float:right; width:200px; max-width:100%; padding-left: 80px">

# About Me

Hi, I am a third year Ph.D. candidate at [The University of Texas at Austin](https://www.utexas.edu). I major in mathematics, and my research interest include analysis, partial differential equations, especially fluid equations, including incompressible Euler equations, Navier-Stokes equations and surface quasi-geostrophic equations. I received my bachelor's degree at [Xi'an Jiaotong University](http://www.xjtu.edu.cn), where I was also a student of the Special Class for the Gifted Young before my undergraduate study. 

Apart from mathematics, I also love programming and music.

It is my honor to be coadvised by [Prof. Caffarelli](https://web.ma.utexas.edu/users/caffarel/) and [Prof. Vasseur](https://web.ma.utexas.edu/users/vasseur/).


</div>
</div>

<div class="eggshell">
<div class="container" markdown="1">

###### Contact Information

<div style="float:right">
<div style="display:inline" markdown="1">
- Office: RLM 11.130
- Email: [jcyang@math.utexas.edu](mailto:jcyang@math.utexas.edu)
- Tel: +1 (512) 317-7231
</div>
</div>

<div>
<p style="margin:0px; padding:0px">
Jincheng Yang (杨 金成)
</p>
<p style="margin:0px; padding:0px">
Department of Mathematics
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

###### Education

- **Xi'an Jiaotong University**, B.Sc. in Mathematics and Applied Mathematics (Aug. 2013 - June 2017)
- **The University of Texas at Austin**, Ph.D. in Mathematics (Aug. 2017 - Present)

###### Visiting

- **Columbia University in the City of New York**, Visiting Undergraduate Student (Jan. 2015 - May 2015)
- **Georgia Institute of Technology**, School of Mathematics and Language Institute Visiting Honors Student Program (Jan. 2016 - May 2016)
- **Georgia Institute of Technology**, Visiting Research Student (Jan. 2017 - May 2017)

</div>
</div>


<div class="gallery">
<div class="container" markdown="1">

<h6 class="whiteh">Gallary</h6>

<div style="display:flex;justify-content:space-between;flex-wrap:wrap">
{% assign my_posts = site.posts | where:"image", true %}
{% assign firstPost = true %}
{% for post in my_posts limit: 9 %}{% if firstPost == true %}
<div class="thumb" style="background-color:#DDD">
	{% assign firstPost = false %}
{% else %}<div class="thumb" style="background-color:#DDD">
{% endif %}
<a href="{{ post.url }}" title="{{ post.title }}">
<div class="thumbpic" style="background-color:white;background-image:url('/users/jcyang/assets/images/thumbnails/{{ post.thumb }}');background-repeat:no-repeat;"></div>
</a>
<h5>{{ post.date | date_to_string }}</h5>
<a href="{{ post.url }}" title="{{ post.title }}">
	<h4>{{ post.title }}</h4>
</a>
</div>{% endfor %}
</div>

</div>
</div>

