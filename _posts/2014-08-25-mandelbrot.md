---
layout: post
title: "Mandelbrot Set"
date: 2014-08-25
comments: true
image: true
use-math: true
thumb: mandelbrot.gif
---

This is the first program I wrote with Processing. It can draw Mandelbrot set in a simple way. You can press the mouse button to zoom in or out, and change the speed with your keyboard. Mandelbrot set is the set of $c$'s which its related series

$$
\begin{align*}
z _c (0) &= 1, \\
z _c (n) &= z _c (n - 1) ^2 + c, \forall n \in \mathbb{N}^*.
\end{align*}
$$

converges in the complex plane. The black section in the picture is the Mandelbrot set.


<div class="pde" style="max-width:400px">
<script type="text/javascript" src="{{ site.baseurl }}/plugin/processing.min.js"></script>
<canvas data-processing-sources="{{ site.baseurl }}/assets/files/pde/Mandelbrot.pde"></canvas>
</div>

Left click to zoom in, right click to zoom out.


---

Environment: Processing 2.1