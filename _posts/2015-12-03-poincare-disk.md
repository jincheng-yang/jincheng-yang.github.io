---
layout: post
title: "Poincaré Disk"
date: 2015-12-03
comments: true
image: true
use-math: true
thumb: poincare.gif
---	

This is a demonstration of a Poincare Disk for a 2-D ODE dynamic system. Through Poincare mapping, we can see the movements, traces, and ending of all the points.

The animation below is the Poincare Disk of the following system (you can press 1 or 2 to adjust speed),

$$
x'(t) = x(x + y - 1)
$$

$$
y'(t) = y(2x + 3y/2 - 3)
$$

<div class="pde" style="max-width:600px">
<script type="text/javascript" src="{{ site.roooot }}/plugin/processing.min.js"></script>
<canvas data-processing-sources="{{ site.roooot }}/assets/files/pde/Poincare/Poincare.pde"></canvas>
</div>

The program is based on a demonstration from the book Generative Design: Visualize, Program, and Create with Processing written by Hartmut Bohnacker. I should thank him for his inspiration.

---

Environment: Processing 2.0
