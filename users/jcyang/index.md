---
layout: grid
title: Jincheng's Website | About
---

<div class="content" markdown="1">

![Photo](/users/jcyang/assets/images/photo5.jpg){: style="width:200px; float:right; padding-left:80px; max-width:100%"}

# About Me

Hi, I am a fifth-year Ph.D. candidate at [The University of Texas at Austin](https://www.utexas.edu). I major in mathematics, and my research interest includes analysis, partial differential equations, fluid dynamics, including incompressible Euler equations, Navier-Stokes equations, and surface quasi-geostrophic equations. I received my bachelor's degree at [Xi'an Jiaotong University](http://www.xjtu.edu.cn), where I was also a student of the Special Class for the Gifted Young before my undergraduate study. 

Apart from mathematics, I also love programming and music.

It is my honor to be co-advised by [Prof. Caffarelli](https://web.ma.utexas.edu/users/caffarel/) and [Prof. Vasseur](https://web.ma.utexas.edu/users/vasseur/).

</div>

<div style="background:white">
<div class="content" markdown="1">

[![You Belong Here](/users/jcyang/assets/images/YouBelongHere.jpg){: width='35%'}](https://cns.utexas.edu/diversity)
[![You Belong Here Flyer](/users/jcyang/assets/images/YouBelongHereFlyer.svg){: width='60%' style='float:right'}](/users/jcyang/assets/files/YouBelongHereFlyer.pdf)

</div>
</div>

<div style="background:antiquewhite">
<div class="content" markdown="1">

###### Contact Information

<div style="float:right">
<div style="display:inline" markdown="1">

- Office: PMA 11.130
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

<div style="background: aliceblue">
<div class="content" markdown="1">

###### Education

- **Xi'an Jiaotong University**, B.Sc. in Mathematics and Applied Mathematics (Aug. 2013 - June 2017)
- **The University of Texas at Austin**, Ph.D. in Mathematics (Aug. 2017 - Present)

###### Visiting

- **Columbia University in the City of New York**, Visiting Undergraduate Student (Jan. 2015 - May 2015)
- **Georgia Institute of Technology**, School of Mathematics and Language Institute Visiting Honors Student Program (Jan. 2016 - May 2016)
- **Georgia Institute of Technology**, Visiting Research Student (Jan. 2017 - May 2017)

</div>
</div>


<div style="background:linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/users/jcyang/assets/images/gallary.jpg');background-size:cover;background-position:center">
<div class="content">

<h6 style="color: #EEE">Gallary</h6>

<div style="display:grid;grid-template-columns:30% 30% 30%;align-items:center;justify-content:space-between;grid-row-gap:2.5em">

{% assign my_posts = site.posts | where:"image", true %}
{% for post in my_posts limit: 12 %}

	<div class="thumb">
	<a href="{{ post.url }}.html" title="{{ post.title }}">
		<div class="thumbpic" style="background-image:url('/users/jcyang/assets/images/thumbnails/{{ post.thumb }}')"></div>
	</a>
	<h5>{{ post.date | date_to_string }}</h5>
	<a href="{{ post.url }}.html" title="{{ post.title }}">
		<h4>{{ post.title }}</h4>
	</a>
	</div>

{% endfor %}

</div>

</div>
</div>

