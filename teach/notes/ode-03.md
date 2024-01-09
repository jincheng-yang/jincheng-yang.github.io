---
layout: note
title: "Lecture 3: Existence and uniqueness: Picard iteration"
use-math: true
---
# Banach fixed point theorem

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\by}{\boldsymbol y}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bv}{\boldsymbol v}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bf}{\boldsymbol f}
$$

The goal of this lecture is to locate a strong solution. Recall a strong solution $\bu$ to the aforementioned IVP satisfies

$$
	\bu (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s
$$

The idea of Picard is to view each continuous function $\bu$ as an element in the space of continuous functions, and view a strong solution as a fixed point to the following map:

$$
	T (\bu) (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s
$$

Indeed, $\bu$ is a solution if and only if $\bu = T (\bu)$. When does a mapping $T: C ^0 (I) \to C ^0 (I)$ has a fixed point? 

To answer this question, we recall a **metric space** $(X, d)$ is a nonempty set $X$ and a bivariate function $d: X \times X \to \R$ with the following properties:
1. $d (x, y) \ge 0$ for any $x, y \in X$. Equality holds if and only if $x = y$.
2. $d (x, y) = d (y, x)$. 
3. $d (x, y) + d (y, z) \ge d (x, z)$. 
A metric space is **complete** if every Cauchy sequence converges.

A mapping with the following property will be called **contraction mapping**.

> [!Theorem] 
> (Banach fixed point theorem) Let $(X, d)$ be a metric space. A map $T: X \to X$ is called a contraction if there exists a number $\gamma \in [0, 1)$ such that for any $x, y \in X$, it holds that 
> 
> $$
> 	d(T (x), T (y)) \le \gamma d (x, y).
> $$
> 
> If $X$ is complete and $T$ is a contraction, then $T$ admits a unique fixed point: $T (x ^*) = x ^*$. 

Proof. Take $x \bp 0 \in X$. For $n \ge 0$, define $x \bp {n + 1} = T x \bp n$. We claim $x \bp n$ is a Cauchy sequence. Denote $D = d (x \bp 0, x \bp 1)$. Then by the contraction property: 

$$
\begin{align*}
	d (x \bp 1, x \bp 2) &\le \gamma D \\
	d (x \bp 2, x \bp 3) &\le \gamma ^2 D \\
	 \dots \\
	d (x \bp n, x \bp {n + 1}) &\le \gamma ^n D.
\end{align*}
$$

Then $x \bp n$ forms a Cauchy sequence:

$$
	d (x \bp k, x \bp {k + l}) \le d (x \bp k, x \bp {k + 1}) + \dots + d (x \bp {k + l - 1}, x \bp {k + l}) \le (\gamma ^k + \gamma ^{k + 1} + \dots + \gamma ^{k + l - 1}) D \le \frac{\gamma ^k D}{1 - \gamma} \to 0
$$

as $k \to +\infty$. Because $X$ is complete, $x \bp n \to x ^*$ is converging to some $x ^\ast$.

$x ^*$ is a fixed point, because

$$
	d (x ^*, T (x ^*)) \le d (x ^*, x \bp n) + d (x \bp n, T (x \bp n)) + d (T (x \bp n), T (x ^*)) \le (1 + \gamma) d (x ^*, x \bp n) + \gamma ^n D \to 0
$$

as $n \to \infty$. $x ^\ast$ is unique, because if $y ^*$ is also a fixed point then 

$$
	d (x ^*, y ^*) = d (T (x ^*), T (y ^*)) \le \gamma d (x ^*, y ^*) \implies d (x ^*, y ^*) = 0.
$$

### Picard existence and uniqueness

> [!Theorem]
> (Existence and uniqueness of DS) Let $I \subset \R$ be an interval and let $U \subset \Rd$ be an open set. Let $L > 0$ and suppose $f: I \times U \to \Rd$ is a continuous function satisfying the following **$L$-Lipschitz condition in $x$**: for every $t \in I, x, y \in U$, it holds that
> $$
> 	|\bf (t, \bx) - \bf (t, \by)| \le L |\bx - \by|.
> $$
> Consider the following initial value problem: given $t _0 \in \bar I, \bx _0 \in U$,
> $$
> 	\bu' (t) = \bf (t, \bu (t)), \qquad \bu (t _0) = \bx _0.
> $$
> Then there exists an interval $t \in I' \subset I$ such that the IVP has a unique strong solution $\bu \in C ^0 (I' \to \Rd)$. 

Proof. 

Pick $\rho > 0$ such that $V = B _\rho (\bx _0) \subset \subset U$. Pick $\bx _0 \in I _1 \subset \subset I$ bounded. Since $\bf$ is continuous, there exists $M > 0$ such that 

$$
	\sup _{t \in I', \bx \in B _{\rho} (\bx _0)}|\bf (t, \bx)| \le M < \infty.
$$

For some bounded $I' \subset I _1$ to be determined, let $X = C ^0 (I' \to V)$ be the space of continuous and bounded functions from $I'$ to $V$. It is a metric space under the supremum of difference:

$$
	d (u, v) = \sup _{t \in I'} |u (t) - v (t)|.
$$

$(X, d)$ is complete: $u _n \to v$ in $X$ if and only if $u _n$ converges uniformly to $v$. 

We define a mapping $T$ by the following: 

$$
	T (\bu) (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s, \qquad \bu \in X.
$$

First, we verify that $T$ has image in $X$. Clearly $T (\bu)$ is continuous, so we only need to verify $T (\bu) (t) \in V$. To see this, note that 

$$
	|T (\bu) (t) - \bx _0| \le \abs{\int _{t _0} ^t \bf (s, \bu (s)) \d s} \le (t - t _0) M < \rho, 
$$

provided that $|t - t _0| < \frac \rho M$ in $I'$.

We claim it is a contraction. To see this, let $\bu, \bv \in X$. Then for any $t \in I$ with $t \ge t _0$, it holds that 

$$
\begin{align*}
	\abs{T (\bu) (t) - T (\bv) (t)} &= \abs{\int _{t _0} ^t \bf (s, \bu (s)) \d s - \int _{t _0} ^t \bf (s, \bv (s)) \d s } \\
	& \le \int _{t _0} ^t \abs{\bf (s, \bu (s)) - \bf (s, \bv (s))} \d s \\
	& \le \int _{t _0} ^t L \abs{\bu (s) - \bv (s)} \d s \\
	& \le L |t - t _0| d (\bu, \bv).
\end{align*}
$$

Similarly, for $t \le t _0$, $\abs{T (\bu) (t) - T (\bv) (t)} \le L |t - t _0|  d (\bu, \bv)$. Take the sup of $t \in I'$, we have verified that 

$$
	d (T (\bu), T (\bv)) \le L \sup _{t \in I'} |t - t _0| d (\bu, \bv).
$$

To make it contractive, it suffices to impose $|t - t _0| < \frac\gamma L$ for $t \in I'$. 

For instance, let $I' = I _2 \cap (t _0 - \frac\rho M, t _0 + \frac\rho M) \cap (t _0 - \frac\gamma L, t _0 + \frac\gamma L)$. 

Since $T$ is contractive, there exists a unique $\bu ^* \in X$ such that $\bu ^* = T (\bu ^*)$. That is, $\bu ^*: I' \to V$ is a strong solution. 

To see $\bu ^*$ is the unique $C ^0 (I' \to \Rd)$ strong solution, suppose there is another $\bv ^*: I' \to \Rd$. If $\bv ^* (t) \in V$ for any $t \in I'$, then $\bv ^* = \bu ^*$ by uniqueness. Otherwise, there exists a time $t _1$ such that $\bv ^* (t _1) \notin V$, but $\bv ^* (s) \in V$ for any $s$ between $t _0$ and $t _1$. Without loss of generality, let $t _1 > t _0$, and define $I'' = (t _0, t _1)$. Restricting to $I''$, $\bu ^*, \bv ^*: C ^0 (I'' \to V)$ are both strong solutions, so by the same uniqueness theorem, they agree in $I''$. By continuity, they agree at $t _1$, which contracts the fact that $\bv ^* (t _1) \notin V$ but $\bu ^* (t _1) \in V$. 


> [!Theorem]
> (Continuition) Under the assumptions on the previous theorem, $\bu$ is a classical solution. $\bu$ can be uniquely continued until $t \notin I$ or $\bu (t) \notin U$. 

Proof.

To see $\bu ^*$ is a classical solution, it suffices to verify $\bu ^* \in C ^1 (I' \to V)$. This can be verified directly because $\bu ^{\ast \prime} (t) = \bf (t, \bu ^* (t))$. 