---
layout: grid
title: Jincheng's Website | Teaching
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

- 2022 Autumn: Math 18500 [Mathematical Methods in the Physical Sciences III](2022/m18500)

</div>
</div>

<div style="background-color:antiquewhite">
<div class="content" markdown="1">

###### Teaching Assistant

### Xi'an Jiaotong University

- 2016 Summer: BIO101 Introductory Biology for non-majors

### The University of Texas at Austin

- 2017 Fall: M408K [Differential Calculus](2017/m408k)
- 2018 Spring: M408D [Sequences, Series, and Multivariable Calculus](2018/m408d)
- 2018 Fall: M427L [Advanced Calculus for Applications II](2018/m427l)
- 2019 Spring: M427J [Differential Equations with Linear Algebra](2019/m427j)
- 2019 Fall: M427J [Differential Equations with Linear Algebra](2019/m427j-2)
- 2020 Spring: M427J [Differential Equations with Linear Algebra](2020/m427j)
- 2020 Fall: M427J [Differential Equations with Linear Algebra](2020/m427j-2)
- 2021 Spring: M383D [Method of Applied Mathematics](2021/m383d)

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