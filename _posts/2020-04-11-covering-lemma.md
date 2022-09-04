---
layout: post
title: "Covering Lemma"
date: 2020-04-11
comments: true
use-math: true
use-d3: true
image: true
thumb: covering.png
---

### Vitali Covering Lemma

#### Statement
Let $E$ be a measurable set in $\mathbb R ^n$, and 
let $\\{ B _\alpha \\} _{\alpha \in \Lambda}$ be a collection of balls that covers $E$ with uniformly bounded radii.
Then there exists a pairwise disjoint subcollection $\\{ B _{\alpha _j} \\}$ such that $\bigcup _j 5 B _{\alpha _j}$ covers $E$.

#### Algorithm
In $j$-th iteration, we 

* Find the largest ball $B _{\alpha _j}$
* Remove every $B _\beta$ that intersects with $B _{\alpha _j}$

<svg id='vitali' width='100%' viewBox="0 0 600 600"></svg>

<!-- <input type="button" value="Generate" onclick="generate()"> -->
<input type="button" value="Find Max" onclick="find_max()" disabled='disabled'>
<input type="button" value="Iterate Step" onclick="find_neighbors()" disabled='disabled'>
<input type="button" value="Remove" onclick="remove()"  disabled='disabled'>
<input type="button" value="Show Selection" id='show-hide' onclick="if(d3.select('#show-hide').attr('value') == 'Show Selection'){show_selection()}else if(d3.select('#show-hide').attr('value') == 'Show Removed'){show_removed()}else hide()" disabled='disabled'>

### Besicovitch (Безико́вич) Covering Lemma

#### Statement
Let $E$ be a measurable set in $\mathbb R ^n$, and Let $\\{ Q _\alpha \\} _{\alpha \in \Lambda}$ be a collection of cubes with uniformly bounded radii, such that for every $x \in E$ there exists at least one $Q _\alpha$ centering at $x$. 
Then there exists a finitely overlapping subcover of $E$.

#### Algorithm
In $j$-th iteration, we 

* Find the largest cube $Q _{\alpha _j}$
* Remove every $Q _\beta$ that centers within $Q _{\alpha _j}$

<svg id='besicovitch' width='100%' viewBox="0 0 600 600"></svg>

<!-- <input type="button" value="Generate" onclick="bgenerate()"> -->
<input type="button" value="Find Max" onclick="bfind_max()" disabled='disabled'>
<input type="button" value="Iterate Step" onclick="bfind_neighbors()" disabled='disabled'>
<input type="button" value="Remove" onclick="bremove()" disabled='disabled'>
<input type="button" value="Show Selection" id='bshow-hide' onclick="if(d3.select('#bshow-hide').attr('value') == 'Show Selection'){bshow_selection()}else if(d3.select('#bshow-hide').attr('value') == 'Show Removed'){bshow_removed()}else bhide()" disabled='disabled'>

<script src='{{ site.baseurl }}/assets/js/covering-lemma.js'></script>
