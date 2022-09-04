---
layout: post
title: "Jensen's Approximation"
date: 2021-02-05
use-math: true
comment: true
use-d3: true
image: true
thumb: jensen.svg
---

### Introduction

Given a continuous function $u \in C (\mathbb T ^n)$, consider 
$
\newcommand{\xo}{x _0}
\newcommand{\ue}{u ^\e}
\newcommand{\xos}{x _0 ^*}
\newcommand{\Pd}{P ^\delta}
\newcommand{\ve}{v _\e}
$
\begin{align\*}
    \ue (\xo) := \sup _x \set{
        u (x) - \frac1\e \abs{x - \xo} ^2
    } = \sup _h \set{
        u (\xo - h) - \frac1\e \abs h ^2.
    }.
\end{align\*}
Think each of the function inside $\set{}$ as a function of $\xo$, there are two intepretations:
1. $\ue$ is a sup of a family of paraboloids (concave of opening $\frac2\e$). (Left)
2. $\ue$ is a sup of a family of translations of $u$ ($h$ horizontally, $\frac1\e\abs h ^2$ downwards). (Right)

![Jensen's Approximation Solution]({{ site.baseurl }}/assets/images/thumbnails/jensen.svg){: .center-image}

It has the following properties.

1. $\ue (\xo) = u (\xos) - \frac1\e \abs{x - \xos} ^2$ for some $\xos$. $\ue (\xo) = u (\xo - h ^\*) - \frac1\e \abs{h ^\*} ^2$.
> This is because the sup is attainable in a compact set.
2. $\ue (\xo) \ge u(\xo)$.
> By definition, set $x = \xo$.
3. $\ue$ is $\frac2\e \diam(\mathbb T)$-Lipschitz.
> This is because for every $x$, $u (x) - \frac1\e\abs{x - \xo} ^2$ is $\frac2\e \diam(\mathbb T)$-Lipschitz in $\xo$.
4. $\ue$ decreases as $\e \to 0$.
> Because $u (x) - \frac1\e\abs{x - \xo} ^2$ decreases as $\e \to 0$.
5. $\abs{\xos - \xo} ^2 \le \e \osc u$.
> Because $u (\xo) \le u (\xos) - \frac1\e\abs{\xos - \xo} ^2$.
6. $0 \le \ue (\xo) - u (\xo) \le u (\xos) - u (\xo)$.
> Because 1. and 2.

<div theorem='Lemma' markdown='1'>
1. $\ue \in C (\mathbb T ^n)$.
2. $\ue \downarrow u$ uniformly as $\e \to 0$.
3. For every $\xo$ there exists a concave paraboloid of opening $2/\e$ that touches $\ue$ by below at $\xo$. Hence $\ue$ is $C ^{1,1}$ by below. In particular, $\ue$ is punctually second order differentiable almost everywhere.
</div>

#### Proof. 
1. We even have Lipschitz continuity from Property 3.
2. Property 4. implies monotonocity. Uniformily can be seen from 
\begin{align\*}
    \ue (\xo) - u (\xo) \le u (\xos) - u(\xo) \to 0
\end{align\*}
uniformly since $\xos \to \xo$ uniformly and $u$ is uniform continuous.
3. Because Property 1. asserts that the sup is attained by $\xos$, $\ue$ is touched by a paraboloid by below.

### Jensenn's Approximate Solutions

<div theorem='Theorem'>
Suppose $u$ is a viscosity subsolution of $F (D ^2 u) = 0$, we have that $\ue$ is a viscosity subsolution of $F (D ^2 u) = 0$. In particular $F (D ^2 \ue) \ge 0$ a.e.
</div>

#### Proof. 

Let $P (x)$ touches $\ue$ at $\xo$ by above. Then it touches a translation of $u$ by above (using the second intepretation mentioned at the beginning): $P (\xo) = \ue (\xo) = u (\xo - h ^\*) - \frac1\e \abs{h ^\*} ^2$.

Consider
\begin{align\*}
    Q (x) = P (x + h ^*) + \frac1\e \abs{h ^\ast} ^2.
\end{align\*}
Then $Q$ touches $u$ by above at $\xos$. Since $F (D ^2 u) \ge 0$ in the viscosity sense, 
\begin{align\*}
0 \le F (D ^2 Q) = F(D ^2 P).
\end{align\*}
Therefore $\ue$ is a viscosity subsolution.

### Uniqueness

<div theorem='Theorem'>
Let $u$ be a viscosity subsolution and $v$ be a viscosity supersolution to $F (D ^2 w) = 0$ in $\Omega$. Then
\begin{align*}
    u - v \in \underline S (\lambda/n, \Lambda).
\end{align*}
</div>

#### Proof. 

It suffices to show $f := u ^\e - \ve \in \underline S (\lambda/n, \Lambda)$ in the interior because $S$ is closed under uniform convergence. Let $P$ be a paraboloid that touches $f$ from above at $\xo$. 

By Approximation theorem, $\ue$ and $\ve$ are again viscosity sub/supersolutions, and punctually second order differentiable almost everywhere. In particular, if they are both punctually second order differentiable at $\xo$, then 
\begin{align\*}
    0 \le F (D ^2 \ue (\xo)) - F (D ^2 \ve (\xo)) \le \mathcal M ^+ (D ^2 f (\xo); \lambda/n, \Lambda) \le \mathcal M ^+ (D ^2 P (\xo); \lambda/n, \Lambda)
\end{align\*}
which finishes the proof. The problem is that we don't know if $\ue$ and $\ve$ are punctually second order differentiable at $\xo$.

To overcome this, we fix a small $r > 0$ and define
\begin{align\*}
    \Pd (x) = P (x) + \delta \abs{x - \xo} ^2 - \delta r ^2.
\end{align\*}
That is, we pinch $\Pd$ a little such that it bends more downward without changing its value on $\partial B _r (\xo)$. Then we still have $\Pd > f$ on $\partial B _r (\xo)$ but $\Pd < f$ at $\xo$. Define $w = \Pd - f$. Let $\Gamma _w$ be the convex envelope of $-w ^- \ind{B _r (\xo)}$, then since $w$ can be touched from above by a paraboloid with uniform opening at any given point ($\ue$ can be touched by below, $\ve$ can be touched from above by a paraboloid of opening $2/\e$, and $\Pd$ is a paraboloid), by Lemma 3.5 we know that the contact set $\set{w = \Gamma _w}$ has positive measure.

Let $x _1$ be a point in $B _r$ intersect $\set{w = \Gamma _w}$ intersect the punctual second order differentiability set of $\ue - \ve$. Then at this point, $D ^2 w (x _1) = D ^2 \Gamma _w (x _1)$ is nonnegative, so
\begin{align\*}
    0 &\le F (D ^2 \ue (x _1)) - F (D ^2 \ve (x _1)) 
    \newline 
    &\le F (D ^2 \ue (x _1) + D ^2 w (x _1)) -  F (D ^2 \ve (x _1))
    \newline
    &\le \mathcal M ^+ (D ^2 w (x _1) + D ^2 f (x _1); \lambda/n, \Lambda) 
    \newline 
    &\le \mathcal M ^+ (D ^2 \Pd; \lambda/n, \Lambda)
    \newline
    &\le \mathcal M ^+ (D ^2 P; \lambda/n, \Lambda) + 2 \Lambda \delta.
\end{align\*}
Finally take $\delta \to 0$.

<div theorem='Corollary'>
The Dirichlet problem 
\begin{align*}
    \begin{cases}
        F (D ^2 u) = 0 & \inn \Omega, \newline
        u = \vp & \onn \partial \Omega
    \end{cases}
\end{align*}
has at most one viscosity solution $u \in C (\bar \Omega)$.
</div>