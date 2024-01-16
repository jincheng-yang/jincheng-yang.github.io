---
layout: note
title: "Lecture 4: Dependence on initial data and parameters"
use-math: true
---

# Dependence on initial data

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\by}{\boldsymbol y}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bv}{\boldsymbol v}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bf}{\boldsymbol f}
$$

The well-posedness for an initial value problem

$$
	\begin{cases}
		\bu' (t) = \bf (t, \bu (t)), \\
		\bu (t _0) = \bx _0
	\end{cases}
$$

means 

1. Existence: there exists at least one solution.
2. Uniqueness: there exists at most one solution.
3. Continuous dependence on initial data: if $\bx _0 \pp 1$ and $\bx _0 \pp 2$ are two different initial data that are sufficiently close, the corresponding solutions should be close in some sense.

Recall that a flow map $\Phi (t; t _0, \bx _0)$ gives the value of the solution to IVP at time $t$. The first two shows a flow map is well-defined, and the third shows the flow map is continuous in $\bx _0$. 

We have proven in the last lecture the existence and uniqueness of IVP. Now we study the continuous dependence. 

> [!Theorem] 
> Let $G \subset \R \times \Rd$. Suppose $\bf: G \to \Rd$ is continuous in $(t, \bx)$ and locally Lipschitz in $\bx$. Then $\Phi$ is continuous in $\bx _0$. 

Proof. Similar as the proof of continuation, we only need to prove it in a box. Suppose $I = [t _0 - T, t _0 + T]$, $U = \overline{B _\rho (\bx _0)}$, and $\bf$ is continuous in $I \times U \subset G$, bounded by $M$, and $L$-Lipschitz in $\bx$. Let $\tilde \bx _0 \in U$ and $\abs{\tilde \bx _0 - \bx _0} \le \frac\rho2$. Then for some $T' \in (0, T]$ to be determined, we can find strong solution $\bu$ and $\tilde \bu$, so for $t \in I' = [t _0 - T', t _0 + T']$, it holds that 

$$
\begin{align*}
	\bu (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s, \qquad \tilde \bu (t) = \tilde \bx _0 + \int _{t _0} ^t \bf (s, \tilde \bu (s)) \d s, \qquad 
\end{align*}
$$

If $\tilde \bu (t) \in U$ for all $t \in I'$, we take the difference, and conclude

$$
\begin{align*}
	\abs{\tilde \bu (t) - \bu (t)} &\le \abs{\tilde \bx _0 - \bx _0} + \int _{t _0} ^t \abs{\bf (s, \tilde \bu (s)) - \bf (s, \bu (s))} \d s \\
	&\le \abs{\tilde \bx _0 - \bx _0} + L \int _{t _0} ^t \abs{\tilde \bu (s) - \bu (s)} \d s =: G (t).
\end{align*}
$$

Since $G$ is continuously differentiable, and

$$
	G' (t) = L \abs{\tilde \bu (t) - \bu (t)} \le L G (t),
$$

we can use Grönwall inequality. For $t _0 \le t \le t _0 + T'$, 

$$
\begin{align*}
	\abs{\tilde \bu (t) - \bu (t)} &\le G (t) \le G (t _0) e ^{L (t - t _0)} = \abs{\tilde \bx - \bx} e ^{L (t - t _0)}.
\end{align*}
$$

By a same estimate on the left hand side, we conclude $\tilde \bu \to \bu$ uniformly in $I'$ as $\bx \pp 2 \to \bx \pp 1$. In particular, for any $t \in [t _0, t _0 + T']$, it holds that $\Phi (t; t _0, \tilde \bx _0) = \tilde \bu (t) \to \bu (t) = \Phi (t; t _0, \bx _0)$ as $\tilde \bx _0 \to \bx _0$. That is, for any $t \in [t _0, t _0 + T']$, $\Phi (t; t _0, \bx _0)$ is continuous in $\bx _0$.

In general, we let $(t _0, \bx _0) \in G$, then a strong solution $\bu$ exists in $(T _-, T _+)$. Pick $t _1 \in (T _-, T _+)$, now we show $\Phi (t _1; t _0, \cdot)$ is continuous at $\bx _0$. Without loss of generality assume $t _1 > t _0$. By the previous argument, for every $t \in [t _0, t _1]$, there exists an interval $I' _t$ such that for every $s \in I'$, $\Phi (s; t, \cdot)$ is continuous at $\bu (t)$. We now use the interior of $I' _t$ to form an open cover of $[t _0, t _1]$ and extract a finite subcover, yielding a sequence $t _0 = s _0 < s _1 < s _2 < \dots < s _n = t _1$ such that $\Phi (s _i; s _{i - 1}, \cdot)$ is continuous at $\bx _{i - 1} = \bu (s _{i - 1})$. Note that $\Phi (s _i; s _{i - 1}, \bx _{i - 1}) = \bx _i$. Therefore, 

$$
	\Phi (t _1; t _0, \cdot) = \Phi (s _n; s _{n - 1}, \cdot) \circ \dots \circ \Phi (s _1; s _0, \cdot)
$$

is continuous at $\bx _0$.

### Dependence on parameter

Sometimes, we have a differential system with an unknown parameter $\lambda \in \Lambda \subset \R ^{d'}$:

$$
\begin{align*}
	\begin{cases}
		\bu ' (t) = \bf (t, \bu (t); \lambda) \\
		\bu (t _0) = \bx _0
	\end{cases}
\end{align*}
$$

A natural question is: if $\lambda$ is changed by a little, is the solution going to be drastically different? In fact, we have the following dependence on $\lambda$.

> [!Theorem] 
> Let $G \subset \R \times \Rd$, $\Lambda \subset \RR{d'}$ be open sets. Suppose $\bf: G \times \Lambda \to \Rd$ is continuous in $(t, \bx, \lambda)$ and locally Lipschitz in $\bx$. Then $\Phi$ is continuous in $\lambda$.

Proof. This can be achieved by introducing another auxillary IVP: define

$$
	\tilde {\bf} : G \times \Lambda \to \Rd \times \RR{d'}, \qquad \tilde {\bf} (t, \bx, \lambda) = (\bf (t, \bx; \lambda), 0).
$$

That is, we treat the parameter $\lambda$ as additional dimensions and the system is static in these directions. Then 

$$
\begin{cases}
	\tilde{\bu} ' (t) = \tilde{\bf} (t, \tilde{\bu} (t)), \\
	\tilde{\bu} (t _0) = (\bx _0, \lambda)
\end{cases}
$$

We use continuity in initial condition to conclude the proof.

### Regularity

Suppose $\bu \in C (I)$ is a strong solution, then for any $t \in I$, 

$$
	\bu (t) = \bx _0 + \int _{t _0} ^t \bf (t, \bu (t)) \d t.
$$

Is $\bu$ a classical solution?

> [!Theorem] 
> Let $\bf: G \to \Rd$ and let $\bu \in C (I)$ be a strong solution. If $\bf \in C (G)$, then $\bu \in C ^1 (I ^\circ)$ is a classical solution. If $\bf \in C ^n (G)$ for $n \ge 1$, then $\bu \in C ^{n + 1} (I ^\circ)$. 

Proof. 

If $\bf$ is continuous, then $\bf (t, \bu (t))$ is continuous in $t$, so $\bu' (t) = \bf (t, \bu (t))$ is continuous in $t \in I ^\circ$. Assume without loss of generality that $G \subset I ^\circ \times \Rd$.

If $\bf$ is $C ^1 (G)$, then $\bu \in C ^1 (I ^\circ)$, and 

$$
	\bu '' (t) = \partial _t \bf (t, \bu (t)) + \bu' (t) \cdot \grad \bf (t, \bu (t)) = (\partial _t + \bu ' (t) \cdot \grad) \bf (t, \bu (t)).
$$

Denote $\frac{D}{Dt} = \partial _t + \bu ' (t) \cdot \grad$. Then $\bu' \in C ^0 (I)$ and

$$
	\boldsymbol g (t, \bx) = \frac {D \bf}{D t} (t, \bx) = (\partial _t + \bu ' (t) \cdot \grad) \bf (t, \bx)
$$

is $C ^0$ in $G$, so $\bu'' (t) = \boldsymbol g (t, \bu (t))$ is $C ^0$ in $I$, hence $\bu \in C ^2 (I ^\circ)$. 

If $\bf$ is $C ^2 (G)$, then $\bu \in C ^2 (I ^\circ)$, $\bu'$ is $C ^1$, so $\boldsymbol g \in C ^1 (G)$. and

$$
\begin{align*}
	\bu''' (t) &= \ddt \boldsymbol g (t, \bu (t)) = \frac{D \boldsymbol g}{Dt} (t, \bu (t)).
\end{align*}
$$

$\boldsymbol h = \frac{D \boldsymbol g}{Dt} \in C ^0 (G)$, and $\bu ''' (t) = \boldsymbol h (t, \bu (t))$ is thus continuous. We leave the induction as an exercise. 