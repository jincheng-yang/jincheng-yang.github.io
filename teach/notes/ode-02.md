---
layout: note
title: "Lecture 2: Comparison principle, Grönwall inequality"
use-math: true
---
# Solution curve and flow map

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bf}{\boldsymbol f}
$$

The graph of a solution $u: I \to \R$ to an ODE is called a **solution curve** or **trajectory**. Suppose the ODE is a one dimensional dynamic system:

$$
	u' (t) = f (t, u (t)).
$$

Pick $t \in I$ and $x = u (t)$. Then the tangent vector of a solution passing $(t, x)$ is $(1, u' (t)) = (1, f (t, x))$. The solution curve is tangent to the vector field $(1, f (t, x))$ everywhere.

We will show soon that under suitable conditions, a dynamic system coupled with an initial datum admits a unique solution.

$$
	\begin{cases}
		\bu ' (t) = \bf (t, \bu (t)) \\
		\bu (t _0) = \bx _0
	\end{cases}
	\iff
	\begin{cases}
		\dot \bx = \bf _t (\bx) \\
		\bx \at{t = t _0} = \bx _0
	\end{cases}
$$

A **flow map** is a function $\Phi$ is defined by $\Phi (t; t _0, x _0) = \bu (t)$ if $\bu (t)$ is the solution to this dynamic system with initial datum. 

### Weaker version of solutions to autonomous dynamic system

> [!Definition] 
> Consider an autonomous dynamic system
> 
> $$
> \begin{align}
 >	\begin{cases}
 >		\bu' (t) = \bf (\bu (t)) \\
 >		\bu (t _0) = \bx _0 
 >	\end{cases}
 >\end{align}
 >$$
 >
> $\bu \in C ^1 _{\loc} (I \to \Rd)$ is called a classical solution if it solves it for every $t \in I$. 
> $\bu \in C ^0 _\loc (I \to \Rd)$ is called a strong solution if it solves 
> 
> $$
>	\bu (t) = \bx _0 + \int _{t _0} ^t \bf (\bu (s)) \d s
> $$
> 
> for every $t \in I$. ($\int _{t _0} ^t = -\int _t ^{t _0}$ if $t < t _0$)

### Comparison lemma

> [!Lemma] 
> (comparison lemma) If $f (t, x) > g (t, x)$, $u, v: I \to \R$ solves
>  
> $$
> 	u' (t) = f (t, u (t)), \qquad v' (t) = g (t, v (t))
> $$
> 
> and $u (t _0) > v (t _0)$, then $u (t) > v (t)$ for every $t > t _0$. Accordingly, if $u (t _0) < v (t _0)$, then $u (t) < v (t)$ for every $t < t _0$.

