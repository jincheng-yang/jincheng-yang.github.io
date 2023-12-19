---
layout: post
title: "Drag and lift"
date: 2023-12-02
use-math: true
comment: true
---

Let $K _t = K + t u _\infty$ be an object moving with constant horizontal velocity $u _\infty$. It experiences a thrust force and gravity $F _{\text{thrust}} \parallel u _\infty$ and $F _{\text{gravity}} \perp u _\infty$. Fluid around it obeys the Navier-Stokes equation:

$$
\begin{align}
	& \pt u + u \cdot \grad u = \div (-p \,\Id + \tau), \qquad \div u = 0 \\
	& u \at{\partial K _t} = u _\infty, \qquad u \at{|x| = \infty} = 0.
\end{align}
$$

Here $\tau = 2 \nu D u$ is the deviatoric stress tensor, and $-p\,\Id$ is the volumetric stress tensor. $\div \tau = \nu \La u$. 
Make a change of variable: 

$$
\begin{align*}
	v (t, x) &= u (t, x + t u _\infty) - u _\infty \\
	\pi (t, x) &= p (t, x + t u _\infty) \\
	R (t, x) &= \tau (t, x + t u _\infty) = 2 \nu D v.
\end{align*}
$$

Then $v, \pi$ solves 

$$
\begin{align*}
	& \pt v + v \cdot \grad v + \grad \pi = \div R, \qquad \div v = 0 \\
	& v \at{\partial K} = 0, \qquad v \at{|x| = \infty} = -u _\infty.
\end{align*}
$$

Total force exerted by the fluid to body: ($n$ is inward of $K _t$)

$$
	F = \int _{\partial K _t} (p \,\Id - \tau) n \d S = \int _{\partial K} (\pi \,\Id - R) n \d S = F _{\text{form}} + F _{\text{skin}}.
$$

Form force is 

$$
	F _{\text{form}} = \int _{\partial K} \pi n \d S = F _{\text{form drag}} + F _{\text{form lift}}.
$$

Skin force is 

$$
	F _{\text{skin}} = -\int _{\partial K} R n \d S = -2 \nu \int _{\partial K} D v \d S = - \nu \int _{\partial K} \nabla v + \nabla v ^\top \d S = -\nu \int _{\partial K} \partial _n v \d S = F _{\text{skin drag}} + F _{\text{skin lift}}.
$$

If $u$ has fast decay, then 

$$
	F \cdot u _\infty = \int _{\partial K _t} u _\infty ^\top (p \,\Id - \tau) n \d S = \int _{\partial K _t} u ^\top (p \,\Id - \tau) n \d S = \int _{\RR3 \setminus K _t} \div ((p \,\Id - \tau) ^\top u) \d x.
$$

Here

$$
\begin{align*}
	\div ((p \,\Id - \tau) ^\top u) &= \div (p \,\Id - \tau) \cdot u + (p \,\Id - \tau) : \grad u \\
	&= (-\pt u - u \cdot \nabla u) \cdot u + p \div u - 2 \nu D u : \nabla u
\end{align*}
$$

So 

$$
	F \cdot u _\infty = -\int _{\RR3 \setminus K _t} (\pt + u \cdot \grad) \frac{|u| ^2}2 \dx - 2 \nu \int _{\RR3 \setminus K _t} |D u| ^2 \d x.
$$

If the total energy is conserved, then 

$$
	\int _{\RR3 \setminus K _t} (\pt + u \cdot \grad) \frac{|u| ^2}2 \dx = \int _{\partial K _t} \hfsq u (u \cdot n) \dx = \int _{\partial K _t} \hfsq {u _\infty} (u _\infty \cdot n) \dx = 0.
$$

So we have 

$$
	F \cdot u _\infty = F _{\text{drag}} \cdot u _\infty = -2 \nu \int _{\RR3 \setminus K _t} |D u| ^2 \dx = -2\nu \int _K |D v| ^2 \dx.
$$

There are two types of integration by part:

$$
\begin{align}
	u \cdot \La u &= \div(\grad u ^\top u ) - |\grad u| ^2. \\
	u \cdot \La u &= -u \cdot \curl \omega = \div (u \cross \omega) - |\omega| ^2 \\
	\notag
	\implies 2 u \cdot \La u &= \div (-(S u) \omega) - |S u| ^2.
\end{align}
$$

Here $S u = \frac12 (\grad u - \grad u ^\top)$, $\grad u = D u + S u$. 
Note that $|\grad u| ^2 = |S u| ^2 + |D u| ^2$ and $2 u \cross \omega = (Su) u$. So we have a third identity:

$$
	-u \cdot \La u = \div ((D u) u) - |D u| ^2.
$$
