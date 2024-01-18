---
layout: note
title: "Lecture 5: Euler solution, Peano existence"
use-math: true
---

# Euler solution

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\by}{\boldsymbol y}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bv}{\boldsymbol v}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bf}{\boldsymbol f}
$$

We learned that if $\bf$ is locally Lipschitz, then a unique solution exists. What if $\bf$ is not locally Lipschitz? Locally, without Lipschitz condition, the Picard iteration could diverge.

$$
	\begin{cases}
		\bu' (t) = \bf (t, \bu (t)), \\
		\bu (t _0) = \bx _0
	\end{cases}
$$

If we are willing to give up on uniqueness but only focus on existence, then there is an alternative approach. We construct "approximate solutions" without using the Picard's scheme, but with Euler's scheme. The idea is very straightforward.

> [!Definition] 
> Let $\bf: [t _0 - T, t _0 + T] \times \overline{B _\rho (\bx _0)} \to \Rd$ be continuous, $\abs{\bf (t, x)} \le M$. Let $T' = \min \set{T, \frac\rho M}$. We choose "step size" $h _n = \frac{T'}n$. For $t > t _0$, define **Euler solution** with step-size $h _n$ by first construct discrete solution:
> 
> $$
> \begin{align*}
> 	t _k &= t _0 + k h \\
> 	\bx _{k + 1} &= \bx _k + \bf (t _k, \bx _k) h,
> \end{align*}
> $$
> 
> then we connect them by a piecewise affine function:
> 
> $$
> 	\bu _n (t) = \frac{t _{k + 1} - t}h \bx _k + \frac{t - t _{k}}h \bx _{k + 1}, \qquad t _k \le t \le t _{k + 1}, 0 \le k < n.
> $$
> 
> We extend similarly to the left.

By sending $n \to +\infty$, we should have more and more "accurate" solution. Do they converge (up to a subsequence) to a solution? Let's justify this by using Arzelà-Ascoli lemma.

> [!Lemma]
> (Arzelà-Ascoli lemma) Let $I \subset \R$ be a closed interval. If $\bu _n: I \to \R ^d$ is a sequence of functions with the following properties:
> 
> 1. Uniformly bounded: there exists a constant $M > 0$ such that $\abs{\bu _n (t)} \le M$, for all $n \in \mathbb N$ and $t \in I$.
> 2. Equicontinuous: for any $\e > 0$, there exists $\delta > 0$ (depending only on $\e$, not $n$), such that for every $n \in \mathbb N$, $x, y \in I$ with $\abs{x - y} \le \delta$, it holds that $\abs{\bu _n (x) - \bu _n (y)} \le \e$.
> 
> Then there exists a subsequence $\bu _{n _k}$ that converges uniformly. 

Proof. Let $Q = \set{t _n}$ be a dense subset of $I$ (e.g. the rationals). We will construct a subsequence that converges on $Q$. We use the following strategy:

* Step 1. $\set{\bu _n (t _1)} _{n = 1} ^\infty$  is a sequence of points in bounded by $M$, so there is a subsequence $\set{\bu _{n _{1, k}} (t _1)} _{k = 1} ^\infty$ that converges.

* Step 2. $\set{\bu _{n _{1, k}}} _{k = 1} ^\infty$ converges at $t _1$ but maybe not at other $t$. For instance, its value at $t _2$, which is $\set{\bu _{n _{1, k}} (t _2)} _{k = 1} ^\infty$ might diverge. However, it is bounded by $M$, so we can find a subsequence $\set{\bu _{n _{2, k}} (t _2)} _{k = 1} ^\infty$. 

* Step 3. $\set{\bu _{n _{2, k}}} _{k = 1} ^\infty$ is a subsequence of $\set{\bu _{n _{1, k}}} _{k = 1} ^\infty$, so its value at both $t _1$ and $t _2$ converges. Its value at $t _3$ is bounded, so we extract a further subsequence $\set{\bu _{n _{3, k}}} _{k = 1} ^\infty$ that converges at $t _3$.

* ...

* Step $\infty$: After this iteration, we have a sequence of subsequences

$$
	\set{\bu _n} _{n = 1} ^\infty \supset \set{\bu _{n _{1, k}}} _{k = 1} ^\infty \supset \set{\bu _{n _{2, k}}} _{k = 1} ^\infty \supset \set{\bu _{n _{3, k}}} _{k = 1} ^\infty \supset \dots.
$$

Now we pick the **diagonal sequence** $\set{\bu _{n _{k, k}}} _{k = 1} ^\infty$ which, except for the first $m$ terms, is a subset of $\set{\bu _{n _{m, k}}} _{k = 1} ^\infty$, hence converges at $t _m$. This is true for any $m$, so it converges pointwise in $Q$. For $m \ge 1$, denote $\bx _m = \lim _{k \to \infty} \bu _{n _{k, k}} (t _m)$.

It remains to show: convergence in $I$ and uniformity. Given $\e > 0$, let $\delta$ be the corresponding number in equicontinuity assumption. Since $Q$ is dense, the first $N$ points form a $\delta$-net of $I$. That is, $I$ is covered by $\set{B _{\delta} (t _m)} _{m = 1} ^N$. For each $m \le N$, by $\bx _m = \lim _{k \to \infty} \bu _{n _{k, k}} (t _m)$ we know that there exists $N _m$ such that $\abs{\bu _{n _{k, k}} (t _m) - \bx _m} \le \e$ for every $m \ge N _m$, so for every $k \ge N _m$, $t \in B _\delta (t _m)$, it holds that  

$$
	\abs{\bu _{n _{k,k}} (t) - \bx _m} \le \abs{\bu _{n _{k,k}} (t) - \bu _{n _{k,k}} (t_m)} + \abs{\bu _{n _{k, k}} (t_m) - \bx _m} \le 2 \e.
$$

Therefore, for every $k, l \ge \max _m N _m$, 

$$
	\sup _I \abs{\bu _{n _{k,k}} - \bu _{n _{l, l}}} \le 4 \e.
$$

Therefore $\set{\bu _{n _{k, k}}} _{k = 1} ^\infty$ is a Cauchy sequence in the supremum metric, thus it converges uniformly in $I$. $\square$ 


Now, back to Euler solutions. 

> [!Theorem] 
> Euler solutions $\bu _n$ converge uniformly to a classical solution.

Proof. Note that each $\bu _n$ is $M$-Lipschitz: the speed in every segment of time is bounded by $M$. As a consequence, They are uniformly bounded by $\abs{\bx _0} + M T'$, and they are equicontinuous by $\delta = \e / M$. Therefore, a subsequence of $\bu _n$ converges uniformly to $\bu ^*$ in $I'$.

Why is $\bu ^*$ a strong solution? To verify it is a strong solution we need 

$$
	\bu ^* (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu ^* (s)) \d s.
$$

Now we compute the error of the $n$-th approximation:

$$
	\boldsymbol e _n (t) := \bu _n (t) - \bx _0 - \int _{t _0} ^t \bf (s, \bu _n (s)) \d s. 
$$

Suppose $t > t _0$. Since $\bu _n$ is Lipschitz, it is easy to see that $\boldsymbol e _n$ is $2M$-Lipschitz. We compute 

$$
\begin{align*}
	\boldsymbol e _n (t _k) &= \bx _k - \bx _0 - \sum _{j = 1} ^k \int _{t _{j - 1}} ^{t _j} \bf (s, \bu _n (s)) \d s \\
	&= \sum _{j = 1} ^k \bx _{j} - \bx _{j - 1} - \int _{t _{j - 1}} ^{t _j} \bf (s, \bu _n (s)) \d s \\
	&= \sum _{j = 1} ^k \int _{t _{j - 1}} ^{t _j} \bf (t _{j - 1}, \bx _{j - 1}) - \bf (s, \bu _n (s)) \d s.
\end{align*}
$$

Note that $\abs{(t _{j - 1}, \bx _{j - 1}) - (s, \bu _n (s))} \le h _n + M h _n = (M + 1) h _n \to 0$ as $n \to 0$. Since $\bf$ is continuous, it is uniformly continuous on $I' \times \overline {B _{\rho} (\bx _0)}$, hence $\abs{\boldsymbol e _n (t _k)} \to 0$ uniformly in $k$ as $n \to \infty$. 

Since $\bu _n \to \bu ^\ast$ uniformly, $\abs{\boldsymbol e _n} \to 0$ uniformly (why?), $\bf (\cdot, \bu _n (\cdot)) \to \bf (\cdot, \bu ^* (\cdot))$ uniformly (why?), $\int _{t _0} ^\cdot \bf (s, \bu _n (s)) \to \int _{t _0} ^\cdot \bf (s, \bu ^\ast (s))$ uniformly (why?), we established $\bu ^\ast$ is a strong solution, and hence a classical solution due to continuity of $\bf$. $\square$

## Comparison lemma revisited

Now consider scalar-valued functions. Let $f: [t _0 - T, t _0 + T] \times [x _0 - \rho, x _0 + \rho] \to \R$ be continuous, $\abs{f (t, x)} \le M$. Let $T' = \min \set{T, \frac\rho M}$. Without local Lipschitz condition, uniqueness is not guaranteed. In fact, there exists a continuous $f$ such that from any initial condition there are at least two solutions!

What are the relations of these solutions? In fact, with an initial condition, we can find a maximum solution and a minimum solution, such that any solution is between them.

> [!Lemma]
> (Maximal and minimal solution) $\overline u$ and $\underline u$ are called maximal and minimal solution of 
> 
> $$
> 	u' (t) = f (t, u (t)), \qquad u (t _0) = x _0
> $$
> 
> if they are solutions and every solution $u$ is between them: $\underline u \le u \le \overline u$. 
> 
> If $f$ is continuous, then there exists a unique maximal solution and a unique minimal solution in $I'$.

Proof. Uniqueness follows from the definition. For $n \ge 1$, $f _n = f + \frac1n$ is a continuous function, so we can find a solution $u _n$ to the following system:

$$
	u' _n (t) = f _n (t, u _n (t)) = f (t, u _n (t)) + \frac1n, \qquad t \in [t _0, t _0 + T '_n]
$$

Here $T _n' = \min\set{T, \frac\rho{M + \frac1n}}$.

By our old comparison lemma, $u _n (t) > u (t)$ at any $t > t _0$ for any solution $u$. $\abs{f _n} \le M + 1$, so $u _n$ are uniformly bounded and equicontinuous. For any $\e > 0$, in $[t _0, t _0 + T - \e]$, a subsequence of $u _n$ converges uniformly to $\overline u$. As a consequence, $u \le \overline u$ in $[t _0, t _0 + T - \e]$. $\overline u$ is a strong solution: this is an exercise in the homework. We construct similarly in the upper left, lower left, and lower right of $(t _0, x _0)$, which are the desired maximal solution and minimal solution. $\square$

Now we are ready to have a better comparison lemma, which allows drivers to be equal.

> [!Lemma] 
> (Second comparison lemma) Let $G$ be open, $f, g \in C (G)$ and $f \le g$. Let $\underline u, \underline v, \overline u, \overline v: I \to \R$ be maximal and minimal solutions to
>  
> $$
> 	u' (t) \le f (t, u (t)), \qquad v' (t) \ge g (t, v (t)).
> $$
> 
> If $\underline u (t _0) \le \overline v (t _0)$, then $\underline u (t) \le \overline v (t)$ for every $t > t _0$. 
> 
> If $\overline u (t _0) \ge \underline v (t _0)$, then $\overline u (t) > \underline v (t)$ for every $t < t _0$.

Proof. This is proven by constructing approximating solutions as in the previous lemma. 

> [!Remark]
> If uniqueness is holds, for instance when $f$ and $g$ are locally Lipschitz, then the maximal and minimal solutions coincide, and we have comparison lemmas between these unique solutions. 

