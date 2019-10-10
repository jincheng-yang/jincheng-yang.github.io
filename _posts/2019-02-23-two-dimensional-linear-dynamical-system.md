---
layout: post
title: "2D Linear Dynamical System"
date: 2019-02-23
comments: true
image: false
use-math: true
hide: True
---

### Animation

<canvas id="myCanvas2" width="600" height="600" style="margin-left:auto;margin-right:auto;display:block;"></canvas>

<p id="formula" kramdown="1">

\begin{align}

\frac{\mathrm{d}}{\mathrm{d}t} \begin{pmatrix}
x \\
y
\end{pmatrix} = 
\begin{pmatrix}
a _{11} & a _{12} \\
a _{21} & a _{22}
\end{pmatrix} \begin{pmatrix}
x \\
y
\end{pmatrix}
\end{align}

</p>

### Bifurcation Diagram

<!--p id="det_tr"></p-->

$a _{11} = $ <input type="text" id="a11" onchange="updateArgument()" value="1" size="4">,
$a _{12} = $ <input type="text" id="a12" onchange="updateArgument()" value="3" size="4"> 

$a _{21} = $ <input type="text" id="a21" onchange="updateArgument()" value="-3" size="4">,
$a _{22} = $ <input type="text" id="a22" onchange="updateArgument()" value="1" size="4">

<p>
    <svg width="136" height="120" onload="makeDraggable(evt)">
        <g transform="translate(50,65)"> 
            <line x1="-50" y1="0" x2="50" y2="0" style="stroke:rgb(0,0,0);stroke-width:2" />
            <line x1="0" y1="-50" x2="0" y2="50" style="stroke:rgb(0,0,0);stroke-width:2" />
            <path d="M -50,-50 Q 0,50 50,-50" stroke="black" stroke-width="2" fill="none" />
            <text x="-48" y="14" style="font-family:Helvetica;font-size:12">-8</text>
            <text x="40" y="14" style="font-family:Helvetica;font-size:12">8    </text>
            <text x="-20" y="47" style="font-family:Helvetica;font-size:12">-16</text>
            <text x="-16" y="-39" style="font-family:Helvetica;font-size:12">16</text>
            <text x="-33" y="-54" style="font-family:Helvetica;font-size:12">Determinent</text>
            <text x="52" y="4" style="font-family:Helvetica;font-size:12">Trace</text>
            <circle id="cir" class="draggable" cx="0" cy="0" r="5" stroke="#333366" stroke-width="1" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
        </g>
    </svg>    
</p>

$\det (A) = $ <input type="text" id="det" onchange="updateArgumentByDetTr()" value="1" size="8">,
$\mathrm{tr} (A) = $ <input type="text" id="tr" onchange="updateArgumentByDetTr()" value="3" size="8"> 

<input id="realEigens" type="radio" name="real-imag" value="Real" checked> Real Eigenvalues
<input id="complexEigens" type="radio" name="real-imag" value="Complex"> Complex Eigenvalues 

$\lambda _1 = $ 
<input type="text" id="lambda1" onchange="updateArgumentByLambda()" value="1" size="8">,

$\lambda _2 = $
<input type="text" id="lambda2" onchange="updateArgumentByEigens()" value="1" size="8">

$\lambda = $
<input type="text" id="lambdaa" onchange="updateArgumentByEigens()" value="1" size="8">
$\pm$
<input type="text" id="lambdab" onchange="updateArgumentByEigens()" value="1" size="8">
$i$.

$v _1 = ($ <input type="text" id="v11" onchange="updateArgumentByEigens()" value="1" size="8">
$,$ <input type="text" id="v12" onchange="updateArgumentByEigens()" value="0" size="8">
$)$, 
$v _2 = ($ <input type="text" id="v21" onchange="updateArgumentByEigens()" value="0" size="8">
$,$ <input type="text" id="v22" onchange="updateArgumentByEigens()" value="1" size="8">
$)$

Eccentricity $ = $
<input type="text" id="eccentricity" onchange="updateArgumentByEigens()" value="1" size="8">

$v _3 = ($ <input type="text" id="v31" onchange="updateArgumentByEigens()" value="1" size="8">
$,$ <input type="text" id="v32" onchange="updateArgumentByEigens()" value="0" size="8">
$)$

<script type="text/javascript" src="/users/jcyang/assets/js/2d-linear-dynamical-system.js"></script>
