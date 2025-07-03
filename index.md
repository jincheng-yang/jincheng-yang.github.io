---
layout: grid
title: Jincheng's Website | About
---

<div class="content" markdown="1">

![Photo]({{ site.baseurl }}/assets/images/photo7.jpg){: style="width:200px; float:right; padding-left:80px; max-width:100%"}

# About Me

Hi, I am Jincheng! I am an assistant professor in the [Department of Applied Mathematics and Statistics](https://engineering.jhu.edu/ams/) of [Johns Hopkins University](https://www.jhu.edu). I was previously a member of [Institute for Advanced Study](https://ias.edu) and a Dickson instructor in the [Department of Mathematics](https://mathematics.uchicago.edu) at [The University of Chicago](https://www.uchicago.edu). I completed my Ph.D. in Mathematics at [The University of Texas at Austin](https://www.ma.utexas.edu) in March 2022, under the supervision of [Prof. Caffarelli](https://web.ma.utexas.edu/users/caffarel/) and [Prof. Vasseur](https://web.ma.utexas.edu/users/vasseur/). My research interests include analysis, partial differential equations, fluid dynamics, especially the incompressible Euler and Navier-Stokes equation. 

<!-- I received my bachelor's degree at [Xi'an Jiaotong University](http://www.xjtu.edu.cn), where I was also a student in the Special Class for the Gifted Young before my undergraduate study.  -->

<!-- This year, I co-organize the [Calderón-Zygmund Analysis Seminar](https://math.uchicago.edu/~cz/) at UChicago. -->

<!-- As in the fall of 2024, I am on the job market for a tenure-track position. -->

<!-- Starting fall of 2025, I will join the [Department of Applied Mathematics and Statistics](https://engineering.jhu.edu/ams/) of [Johns Hopkins University](https://www.jhu.edu). -->

</div>

<div style="background:white;display:none">
<div class="content" markdown="1">

[![You Belong Here]({{ site.baseurl }}/assets/images/YouBelongHere.jpg){: width='35%'}](https://cns.utexas.edu/diversity)
[![You Belong Here Flyer]({{ site.baseurl }}/assets/images/YouBelongHereFlyer.svg){: width='60%' style='float:right'}]({{ site.baseurl }}/assets/files/YouBelongHereFlyer.pdf)

</div>
</div>

<div style="background:antiquewhite">
<div class="content" markdown="1">

###### Contact Information

<div style="float:right">
<div style="display:inline" markdown="1">

- Office: Wyman N418
- Email: [jincheng@jhu.edu](mailto:jincheng@jhu.edu)

</div>
</div>

<div>
<p style="margin:0px; padding:0px">
Department of Applied Mathematics and Statistics
</p>
<p style="margin:0px; padding:0px">
Johns Hopkins University
</p>
<p style="margin:0px; padding:0px">
3400 North Charles Street
</p>
<p style="margin-top:0px; padding:0px">
Baltimore, MD 21218
</p>
</div>

</div>
</div>

<div style="background: aliceblue">
<div class="content" markdown="1">

<!-- ###### Education

- **Xi'an Jiaotong University**, B.Sc. in Mathematics and Applied Mathematics (Aug. 2013 - June 2017)
- **The University of Texas at Austin**, Ph.D. in Mathematics (Aug. 2017 - May 2022)

###### Visiting

- **Columbia University in the City of New York**, Visiting Undergraduate Student (Jan. 2015 - May 2015)
- **Georgia Institute of Technology**, School of Mathematics and Language Institute Visiting Honors Student Program (Jan. 2016 - May 2016)
- **Georgia Institute of Technology**, Visiting Research Student (Jan. 2017 - May 2017) -->

{% include publication_index %}

</div>
</div>

<div style="background:linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('{{ site.baseurl }}/assets/images/gallary.jpg');background-size:cover;background-position:center">
<div class="content">

<h6 style="color: #EEE">Gallary</h6>

<div style="display:grid;grid-template-columns:30% 30% 30%;align-items:center;justify-content:space-between;grid-row-gap:2.5em">

{% assign my_posts = site.posts | where:"image", true %}
{% for post in my_posts limit: 12 %}

	<div class="thumb">
	<a href="{{ site.baseurl }}{{ post.url }}.html" title="{{ post.title }}">
		<div class="thumbpic" style="background-image:url('{{ site.baseurl }}/assets/images/thumbnails/{{ post.thumb }}')"></div>
	</a>
	<h5>{{ post.date | date_to_string }}</h5>
	<a href="{{ site.baseurl }}{{ post.url }}.html" title="{{ post.title }}">
		<h4>{{ post.title }}</h4>
	</a>
	</div>

{% endfor %}

</div>

</div>
</div>

