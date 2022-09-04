---
layout: grid
title: Jincheng's Website | Academic
use-math: true
---

<div>
<div class="content" markdown="1">

# Academic

My general research interest includes the area of analysis, dynamic systems, and partial differential equations, especially those arising in the field of fluid mechanics, including 

* incompressible Euler equations
* incompressible Navier-Stokes equations 
* surface quasi-geostrophic equations
* transmission problems

</div>
</div>

<div style="background-color:antiquewhite" id="publications">
<div class="content" markdown="1">

###### Publications

### Preprints
1. Alexis Vasseur, Jincheng Yang: *Boundary Vorticity Estimates for Navier-Stokes and Application to the Inviscid Limit*, preprint (2021). [[arXiv:2110.02426](https://arxiv.org/abs/2110.02426)][[pdf](https://arxiv.org/pdf/2110.02426.pdf)]
2. Rui Gao, Jincheng Yang, Luhao Zhang: *Optimal Robust Policy for Feature-Based Newsvendor*, submitted (2021) [[Opt-Online](http://www.optimization-online.org/DB_HTML/2021/12/8749.html)][[pdf](http://www.optimization-online.org/DB_FILE/2021/12/8749.pdf)]
3. Luhao Zhang, Jincheng Yang, Rui Gao: *A Simple Duality Proof for Wasserstein Distributionally Robust Optimization*, submitted (2022) [[arXiv:2205.00362](https://arxiv.org/abs/2205.00362)][[pdf](https://arxiv.org/pdf/2205.00362.pdf)]

### Journal Articles

1. Jincheng Yang, Zhiwu Lin: *Linear Inviscid Damping for Couette Flow in Stratified Fluid*, [Journal of Mathematical Fluid Mechanics](https://doi.org/10.1007/s00021-017-0328-3), **20:** 445-472 (2018) [[arXiv:1610.08924](https://arxiv.org/abs/1610.08924)][[pdf]({{ site.baseurl }}/assets/files/Linear Inviscid Damping for Couette Flow in Stratified Fluid.pdf)]
2. Zhiwu Lin, Jincheng Yang, Hao Zhu: *Barotropic Instability of Shear Flows*, [Studies in Applied Mathematics](https://doi.org/10.1111/sapm.12297), **144:** 289-326 (2020) [[arXiv:1801.00950](https://arxiv.org/abs/1801.00950)][[pdf]({{ site.baseurl }}/assets/files/Barotropic Instability of Shear Flows.pdf)]
3. Alexis F. Vasseur, Jincheng Yang: *Second Derivatives Estimate of Suitable Solutions to the 3D Navier-Stokes Equations*, [Archive for Rational Mechanics and Analysis](https://doi.org/10.1007/s00205-021-01661-4), **241:** 683–727 (2021) [[arXiv:2009.14291](https://arxiv.org/abs/2009.14291)][[pdf]({{ site.baseurl }}/assets/files/Second Derivatives Estimate of Suitable Solutions to the 3D Navier–Stokes Equations.pdf)]
4. Jincheng Yang: *Construction of Maximal Functions associated with Skewed Cylinders Generated by Incompressible Flows and Applications*, [Annales de l'Institut Henri Poincaré C, Analyse Non Linéaire](https://doi.org/10.4171/aihpc/20), **39:** 793–818 (2022) [[arXiv:2008.05588](https://arxiv.org/abs/2008.05588)][[pdf]({{ site.baseurl }}/assets/files/Construction of Maximal Functions associated with Skewed Cylinders Generated by Incompressible Flows and Applications.pdf)]

### Book

1. Tao Xie, Xiangqian Cheng, Jincheng Yang: *RAPTOR Programme Design Tutorial*, [Tsinghua University Press](http://www.tup.tsinghua.edu.cn/booksCenter/book_05438303.html), Beijing (2014)

### Theses

1. Undergraduate thesis: *Linear Inviscid Damping of a Shear Flow in a Half-Space and a Finite Channel*, supervised by Prof. Dongsheng Li and Prof. Zhiwu Lin [[slides]({{ site.baseurl }}/assets/files/bachelor-slides.pdf)][[pdf]({{ site.baseurl }}/assets/files/bachelor.pdf)]
2. Doctoral thesis: *Partial regularity results for the three-dimensional incompressible Navier-Stokes equation*, supervised by Prof. Luis Caffarelli and Prof. Alexis Vasseur [[slides]({{ site.baseurl }}/assets/files/doctoral-slides.pdf)][[pdf]({{ site.baseurl }}/assets/files/doctoral.pdf)]

</div>
</div>

<div style="background-color:aliceblue" id="talks">
<div class="content" markdown="1">

###### Talks

{% for talk in site.data.talk.Talk %}

<div>

<h3 style="display: flex; justify-content: space-between">
<span>
	{{ talk.Title }}
</span>
<span>
	{{ talk.Date }}
</span>
</h3>

<div style="display: flex; justify-content: space-between">
<span>
	<b>{{ talk.Location }}</b>, <i>{{ talk.Series }}</i>
</span>
<span>
	<a style = "cursor:pointer" onclick="detail = document.getElementById('{{ talk.Date }}'); if(detail.style.display === 'none'){detail.style.display = 'block';}else{detail.style.display='none';}">Abstract</a>
</span>
</div>

<div id="{{ talk.Date }}" style='display:none'>
	<p><b>Abstract</b>: {{ talk.Abstract }}</p>
</div>	

</div>

{% endfor %}

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
	<li><span>{{ post.date | date: "%b. %-d, %Y" }}</span> » <a href="{{ site.baseurl }}/{{ post.url }}.html" title="{{ post.title }}">{{ post.title }}</a></li>
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

