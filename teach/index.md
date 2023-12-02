---
layout: grid
title: Jincheng's Website | Teaching
use-math: True
---

<div class="content" markdown="1">

# Teaching

I am interested in teaching mathematics, especially topics related to analysis and differential equations. I have taught the following subjects:

* calculus
* sequences and series
* linear algebra
* differential equations
* vector calculus

</div>


<div style="background-color:aliceblue">
<div class="content" markdown="1">

###### Instructor 

### The University of Chicago

<ul>
{% for teach in site.data.teach.uchicago %}
<li> {{ teach.Year }} {{ teach.Season }}: {{ teach.Code }} <a href="{{ teach.Link }}">{{ teach.Course }}</a></li>
{% endfor %}
</ul>

</div>
</div>

<div style="background-color:antiquewhite">
<div class="content" markdown="1">

###### Teaching Assistant

### The University of Texas at Austin

<ul>
{% for ta in site.data.teach.utaustin %}
<li> {{ ta.Year }} {{ ta.Season }}: {{ ta.Code }} <a href="{{ ta.Link }}">{{ ta.Course }}</a></li>
{% endfor %}
</ul>

### Xi'an Jiaotong University

- 2016 Summer: BIO101 Introductory Biology for non-majors

</div>
</div>

<div style="background-color:aliceblue">
<div class="content" markdown="1">

###### Directed Reading Program

The [Directed Reading Program](https://web.ma.utexas.edu/users/drp/about.html) is an RTG program that pairs undergraduate students with graduate student mentors to undertake independent projects in mathematics. 

### Mentees

<ul>
{% for drp in site.data.teach.DRP %}
<li> {{ drp.Year }} {{ drp.Season }}: <b>{{ drp.Name }}</b>, {{ drp.Topic }}</li>
{% endfor %}
</ul>

</div>
</div>