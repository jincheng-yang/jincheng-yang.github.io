---
layout: post
title: "2D Linear Dynamical System"
date: 2019-02-23
comments: true
image: false
use-math: true
---

### Animation

<canvas id="myCanvas2" width="600" height="600" style="margin-left:auto;margin-right:auto;display:block;"></canvas>

<p id="formula" kramdown="1">

\begin{align}
\frac{\mathrm{d}}{\mathrm{d}t} 
\begin{pmatrix}
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

### Control

#### Coefficient Matrix

<div style="text-align:center">
$\begin{pmatrix}
a _{11} & a _{12} \\
a _{21} & a _{22}
\end{pmatrix} = \bigg($
<table>
	<tr>
		<td>
			<input type="text" id="a11" onchange="updateArgument()" value="1" size="4">
		</td>
		<td>
			<input type="text" id="a12" onchange="updateArgument()" value="3" size="4"> 
		</td>
	</tr><tr>
		<td>
			<input type="text" id="a21" onchange="updateArgument()" value="-3" size="4">
		</td>
		<td>
			<input type="text" id="a22" onchange="updateArgument()" value="1" size="4">
		</td>		
	</tr>
</table>
$\bigg).$
</div> 

#### Bifurcation Diagram

<div style="text-align:center">
<p style="text-align:center">
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

$\det (A) = $ <input type="text" id="det" onchange="updateArgumentByDetTr()" value="1" size="8">
$, \mathrm{tr} (A) = $ <input type="text" id="tr" onchange="updateArgumentByDetTr()" value="3" size="8"> $.$
</div>

#### Eigenvalues

<input id="realEigens" type="radio" name="real-imag" value="Real" checked onclick="updateArgumentByLambda()"> Real Eigenvalues
<input id="complexEigens" type="radio" name="real-imag" value="Complex" onclick="updateArgumentByLambda()"> Complex Eigenvalues 


<div id="real_eigenvalue" style="text-align:center">

$\lambda _1 = $ 
<input type="text" id="lambda1" onchange="updateArgumentByLambda()" value="3" size="8">
$, \lambda _2 = $
<input type="text" id="lambda2" onchange="updateArgumentByLambda()" value="1" size="8">
$.$

</div>

<div id="imag_eigenvalue" style="text-align:center">

$\lambda = $
<input type="text" id="lambdaa" onchange="updateArgumentByLambda()" value="1" size="8">
$\pm$
<input type="text" id="lambdab" onchange="updateArgumentByLambda()" value="1" size="8">
$i.$

</div>

<div id="real_eigenvector" markdown="1">

#### Eigenvectors

<div style="text-align:center">

$v _1 = ($ <input type="text" id="v11" onchange="updateArgumentByDirection()" value="1" size="8">
$,$ <input type="text" id="v12" onchange="updateArgumentByDirection()" value="0" size="8">
$), $
$v _2 = ($ <input type="text" id="v21" onchange="updateArgumentByDirection()" value="0" size="8">
$,$ <input type="text" id="v22" onchange="updateArgumentByDirection()" value="1" size="8">
$).$

<p style="text-align:center">
    <svg width="120" height="120" onload="makeDraggable(evt)">
        <g transform="translate(60, 60) scale(50, -50)"> 
            <line x1="-1.2" y1="0" x2="1.2" y2="0" style="stroke:rgb(0,0,0);stroke-width:0.02" />
            <line x1="0" y1="-1.2" x2="0" y2="1.2" style="stroke:rgb(0,0,0);stroke-width:0.02" />
            <circle cx="0" cy="0" r="1" stroke="black" stroke-width="0.02" fill="none"/>
            <line id="ev_stroke1" x1="-1" y1="0" x2="1" y2="0" style="stroke: #6666cc; stroke-width: 0.05" />
            <line id="ev_stroke2" x1="0" y1="-1" x2="0" y2="1" style="stroke: #6666cc; stroke-width: 0.05" />
            <circle id="ev_handle1" class="draggable" cx="1" cy="0" r="0.1" stroke="#333366" stroke-width="0.02" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
            <circle id="ev_handle2" class="draggable" cx="0" cy="1" r="0.1" stroke="#333366" stroke-width="0.02" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
            <circle id="ev_handle3" class="draggable" cx="-1" cy="0" r="0.1" stroke="#333366" stroke-width="0.02" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
            <circle id="ev_handle4" class="draggable" cx="0" cy="-1" r="0.1" stroke="#333366" stroke-width="0.02" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
        </g>
    </svg>    
</p>

</div>

</div>

<div id="imag_eigenvector" markdown="1">

#### Direction and Eccentricity

<div style="text-align:center">

$v _3 = ($ <input type="text" id="v31" onchange="updateArgumentByDirection()" value="1" size="8">
$,$ <input type="text" id="v32" onchange="updateArgumentByDirection()" value="0" size="8">
$), \operatorname{ecc} = $
<input type="text" id="eccentricity" onchange="updateArgumentByDirection()" value="1" size="8">
$.$

<p style="text-align:center">
    <svg width="120" height="120" onload="makeDraggable(evt)">
        <g transform="translate(60, 60) scale(25, -25)"> 
            <line x1="-2.4" y1="0" x2="2.4" y2="0" style="stroke:rgb(0,0,0);stroke-width:0.04" />
            <line x1="0" y1="-2.4" x2="0" y2="2.4" style="stroke:rgb(0,0,0);stroke-width:0.04" />
            <circle cx="0" cy="0" r="1" stroke="black" stroke-width="0.04" fill="none"/>
            <ellipse id="ev_ellipse" cx="0" cy="0" rx="1" ry="1" stroke="#6666cc" stroke-width="0.1" fill="none" />
            <circle id="ev_handle5" class="draggable" cx="1" cy="0" r="0.2" stroke="#333366" stroke-width="0.04" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
            <circle id="ev_handle6" class="draggable" cx="0" cy="1" r="0.2" stroke="#333366" stroke-width="0.04" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
            <circle id="ev_handle7" class="draggable" cx="-1" cy="0" r="0.2" stroke="#333366" stroke-width="0.04" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
            <circle id="ev_handle8" class="draggable" cx="0" cy="-1" r="0.2" stroke="#333366" stroke-width="0.04" fill="#6666cc" style="cursor:move" onmouseover="this.style.fill='#9999ee';" onmouseout="this.style.fill='#6666cc';"/>
        </g>
    </svg>    
</p>

</div>

</div>

<script type="text/javascript" src="/users/jcyang/assets/js/2d-linear-dynamical-system.js"></script>
