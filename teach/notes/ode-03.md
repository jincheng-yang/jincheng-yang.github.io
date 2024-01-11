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

The goal of this lecture is to locate a strong solution. Recall a strong solution $\bu$ to 

$$
\begin{align}
	\label{eqn:DS}
	\begin{cases}
		\bu' (t) = \bf (t, \bu (t)), \\
		\bu (t _0) = \bx _0
	\end{cases}
\end{align}
$$

satisfies

$$
	\begin{align}
	\label{eqn:DS-strong}
	\bu (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s
	\end{align}
$$

The idea of Picard is to start the following iteration: define $\bu \bp 0 = \bx _0$, and

$$
	\begin{align*}
		\bu \bp 1 (t) &= \bx _0 + \int _{t _0} ^t \bf (s, \bu \bp 0 (s)) \d s, \\
		\bu \bp 2 (t) &= \bx _0 + \int _{t _0} ^t \bf (s, \bu \bp 1 (s)) \d s, \\
		\bu \bp 3 (t) &= \bx _0 + \int _{t _0} ^t \bf (s, \bu \bp 2 (s)) \d s, \\
		&\dots
	\end{align*}
$$

If $\bu \bp n$ converges to some $\bu ^\ast$, then $\bu ^\ast$ should be a strong solution. How to prove it?

We can view each continuous function $\bu$ as an element in the space of continuous functions, and view a strong solution as a fixed point to the following map:

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
\begin{align*}
	d (x \bp k, x \bp {k + l}) &\le d (x \bp k, x \bp {k + 1}) + \dots + d (x \bp {k + l - 1}, x \bp {k + l}) \\
	&\le (\gamma ^k + \gamma ^{k + 1} + \dots + \gamma ^{k + l - 1}) D \le \frac{\gamma ^k D}{1 - \gamma} \to 0
\end{align*}
$$

as $k \to +\infty$. Because $X$ is complete, $x \bp n \to x ^*$ is converging to some $x ^\ast$.

$x ^*$ is a fixed point, because

$$
\begin{align*}
	d (x ^*, T (x ^*)) &\le d (x ^*, x \bp n) + d (x \bp n, T (x \bp n)) + d (T (x \bp n), T (x ^*)) \\
	&\le (1 + \gamma) d (x ^*, x \bp n) + \gamma ^n D \to 0
\end{align*}
$$

as $n \to \infty$. $x ^\ast$ is unique, because if $y ^*$ is also a fixed point then 

$$
	d (x ^*, y ^*) = d (T (x ^*), T (y ^*)) \le \gamma d (x ^*, y ^*) \implies d (x ^*, y ^*) = 0.
$$

### Picard existence and uniqueness

> [!Theorem]
> (Existence and uniqueness) Let $t _0, T \in \R$ and $I = [t _0 - T, t _0 + T]$. Let $\bx _0 \in \Rd$, $\rho > 0$, and $U = \overline{B _\rho (\bx)}$. 
> Let $L, M > 0$ be two constants.
> Suppose $f: I \times U \to \Rd$ is a piecewise continuous function that satisfies:
>
> 1. Boundedness: $\abs{f (t, \bx)} \le M$ for all $(t, \bx) \in I \times U$.
> 2. Lipschitzness: $\abs{f (t, \bx) - f (t, \by)} \le L \abs{\bx - \by}$ for all $t \in I, \bx, \by \in U$.
>
> Define $T' = \min \set{T, \frac\rho M, \frac 1{2L}}$, $I' = [t _0 - T', t _0 + T']$. 
> There exists a unique $\bu \in C ^0 (I' \to U)$ solving \eqref{eqn:DS}.

Proof. 

let $X = C ^0 (I' \to U)$ be the space of continuous and bounded functions from $I'$ to $U$. It is a metric space under the supremum of difference:

$$
	d (u, v) = \sup _{t \in I'} |u (t) - v (t)|.
$$

$(X, d)$ is complete: $u _n \to v$ in $X$ if and only if $u _n$ converges uniformly to $v$. 

We define a mapping $T$ by the following: 

$$
	T (\bu) (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s, \qquad \bu \in X.
$$

First, we verify that $T$ has image in $X$. Clearly $T (\bu)$ is a continuous function, so we only need to verify $T (\bu) (t) \in U$. To see this, note that 

$$
	|T (\bu) (t) - \bx _0| \le \abs{\int _{t _0} ^t \bf (s, \bu (s)) \d s} \le (t - t _0) M \le T' M \le \rho. 
$$

We claim $T$ is a contraction. To see this, let $\bu, \bv \in X$. Then for any $t \in I$ with $t \ge t _0$, it holds that 

$$
\begin{align*}
	\abs{T (\bu) (t) - T (\bv) (t)} &= \abs{\int _{t _0} ^t \bf (s, \bu (s)) \d s - \int _{t _0} ^t \bf (s, \bv (s)) \d s } \\
	& \le \int _{t _0} ^t \abs{\bf (s, \bu (s)) - \bf (s, \bv (s))} \d s \\
	& \le \int _{t _0} ^t L \abs{\bu (s) - \bv (s)} \d s \\
	& \le L |t - t _0| d (\bu, \bv) \le \frac12 d (\bu, \bv).
\end{align*}
$$

Similarly, for $t \le t _0$, $\abs{T (\bu) (t) - T (\bv) (t)} \le \frac12 d (\bu, \bv)$. 
Take the sup of $t \in I'$, we have verified that 

$$
	d (T (\bu), T (\bv)) \le \frac12 d (\bu, \bv).
$$

Since $T$ is contractive, there exists a unique $\bu ^\ast \in X$ such that $\bu ^\ast = T (\bu ^\ast)$. That is, $\bu ^\ast: I' \to U$ is a strong solution. 

> [!Theorem]
> (Continuation) Let $G \subset \R \times \Rd$ be an open set. Suppose $f: G \to \Rd$ is a continuous function that are locally Lipschitz in $x$: for every $(t _1, \bx _1) \in G$, there exists $\e > 0$, $\rho > 0$, $L > 0$ such that 
>
> $$
> 	|\bf (t, \bx) - \bf (t, \by)| \le L |\bx - \by|, \qquad \forall t \in [t _1 - \e, t _1 + \e], \bx, \by \in \overline{B _\rho (x)}.
> $$
>
> Consider \eqref{eqn:DS} with some $(t _0, \bx _0) \in G$. There exists a classical solution $\bu ^\ast: (t _-, t _+) \to \Rd$, such that $\operatorname{Graph} (\bu ^*) \subset G$. Moreover, one of the following holds:
> 
> 1. $t _+ = +\infty$
> 2. $\lim _{t \uparrow t _+} \bu (t)$ diverges and $\abs{\bf (t, \bu (t))}$ is unbounded 
> 3. $\lim _{t \uparrow t _+} \bu (t)$ converges and $(t _+, \bu (t _+)) \in \partial G$
> 
> Similar trichotomy holds for $t _-$. Moreover, any strong solution agrees with $\bu ^\ast$.
> $(t _-, t _+)$ is called the maximum interval of existence. 

Proof. 

First, we start at $(t _0, \bx _0)$. Local Lipschitz-ness implies we can find $\e _0 > 0$, $L _0 > 0$, $M _0 > 0$, and by existence theorem a strong solution $\bu \bp 0: [t _0 - \e _0', t _0 + \e _0'] \to B _{\rho _0} (\bx _0)$, with $\e _0' = \min \set{\e _0, \frac {\rho _0} {M _0}, \frac 1{2L _0}}$. There are different choices of $\e _0$ which leads to different $L _0, M _0, \e' _0$. We assume we pick the one that maximizes $\e _0'$ (say, greater than half the supremum). 

Define $t _1 = t _0 + \e _0'$ and $\bx _1 = \bu \bp 0 (t _1)$. Now from $(t _1, \bx _1)$, we can construct another solution $\bu \bp 1$ of length $\e _1' > 0$. It can be shown that $\bu \bp 0$ and $\bu \bp 1$ agrees on their domain (why?), and we can concatenate them to a strong solution $\bu \bp 1 ^\ast$ whose domain is the union of these two (why?). Now start at $t _2 = t _1 + \e _1 '$ and $\bx _2 = \bu \bp 0 (t _2)$, we continue the solution $\bu \bp 2 ^\ast$. Repeating this process, we get a sequence of solutions $\bu \bp n$. We can also do this backward: find $t _{-1} = t _0 - \e _0'$, $t _{-2} = t _{-1} - \e _{-1} '$ etc. Concatenating all the $\bu \bp n$ yields a strong solution $\bu ^\ast: (t _-, t _+) \to \Rd$.

Now we prove the trichotomy. Suppose $t _+ < +\infty$.

If $\lim _{t \uparrow t _+} \bu (t)$ converges and $(t _+, \bu (t _+)) \in G$, then near $(t _+, \bu (t _+))$ we can find $\e _+, L _+, M _+$ as before. However, this means if $(t _n, \bu (t _n))$ is sufficiently close to $(t _+, \bu (t _+))$, we should be able to find a better $\e _n'$ such that $t _{n + 1} = t _n + \e _n' > t _+$, a contradiction. For instance, if $\abs{t _n - t _+} < \frac{\e _+'}4$ and $\abs{\bu (t _n) - \bu (t _+)} < \frac{M _+ \e _+'}4$, then $f$ is bounded by $M _+$ and is $L _+$-Lipschitz in $x$ inside $[t _n - \frac{\e' _+}2, t _n + \frac{\e' _+}2] \times \overline{B _{\frac{M _+ \e' _+}2} (\bx _n)}$. By existence theorem, we can extend $\bu$ til $t _n + \frac{\e' _+}2$, contradicting our claim that we maximized $\e' _n$. 

If $\abs{\bf (t, \bu (t))} \le M$ as $t \uparrow t _+$, then $\abs{\bu (t) - \bu (s)} \le \int _t ^s \abs{\bf (t, \bu (t))} \dt \le M (t - s)$. Therefore, $\bu$ is $M$-Lipschitz. For any sequence $t _n \to t _+$, $\bu (t _n)$ is a Cauchy sequence. Hence $\bu (t)$ converges as $t \uparrow t _+$.