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
* ordinary differential equations
* vector calculus
* mathematical analysis
* partial differential equations

</div>


<div style="background-color:aliceblue">
<div class="content" markdown="1">

###### Instructor 

### Johns Hopkins University

<ul>
{% for teach in site.data.teach.jhu %}
<li> {{ teach.Year }} {{ teach.Season }}: {{ teach.Code }} <a href="{{ teach.Link }}">{{ teach.Course }}</a></li>
{% endfor %}
</ul>

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

###### Mentoring

### Directed Reading Program (DRP)

The [Directed Rea](https://web.ma.utexas.edu/users/drp/about.html)[ding Program](https://math.uchicago.edu/~drp/) is an RTG program that pairs undergraduate students with graduate student and postdoc mentors to undertake independent projects in mathematics. 

<ul>
{% for drp in site.data.teach.DRP %}
<li> {{ drp.Year }} {{ drp.Season }}: <b>{{ drp.Name }}</b>, {{ drp.Topic }}</li>
{% endfor %}
</ul>

### Research Experiences for Undergraduates (REU)

The [Research Experiences for Undergraduate](https://mathematics.uchicago.edu/undergraduate/mathematics-reu-program/) program pairs undergraduate students with faculty mentors. The heart of the REU is that all participants must write papers. The topics are chosen by the participants themselves, in consultation with their graduate mentors and faculty.

<ul>
{% for reu in site.data.teach.REU %}
<li> {{ reu.Year }} {{ reu.Season }}: <b>{{ reu.Name }}</b>, {{ reu.Topic }}</li>
{% endfor %}
</ul>

### Reading Course 

<ul>
{% for rc in site.data.teach.Reading_Course %}
<li> {{ rc.Year }} {{ rc.Season }}: <b>{{ rc.Name }}</b>, {{ rc.Topic }}</li>
{% endfor %}
</ul>

</div>
</div>