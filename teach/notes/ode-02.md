---
layout: note
title: "Lecture 2: Comparison lemma, Grönwall inequality"
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

A **flow map** is a function $\Phi$ is defined by $\Phi (t; t _0, \bx _0) = \bu (t)$ if $\bu (t)$ is the solution to this dynamic system with initial datum $\bx _0$. 

### Comparison lemma

> [!Lemma] 
> (comparison lemma) Let $f (t, x) < g (t, x)$ for all $(t, x)$. Let $u, v: I \to \R$ be two differentiable functions satisfying
>  
> $$
> 	u' (t) \le f (t, u (t)), \qquad v' (t) \ge g (t, v (t)).
> $$
> 
> If $u (t _0) \le v (t _0)$, then $u (t) < v (t)$ for every $t > t _0$. 
> 
> If $u (t _0) \ge v (t _0)$, then $u (t) > v (t)$ for every $t < t _0$.

Proof. We prove by contradiction. Suppose $u (t _0) \le v (t _0)$, and $u (t _1) \ge v (t _1)$ for some $t _1 > t _0$. Let $S = \set{t \in [t _0, t _1]: u (t) = v (t)}$ be the set of times when they meet. For every $t \in S$,  $u' (t) \le f (t, u (t)) < g (t, v (t)) \le v' (t)$. This means every time $u$ and $v$ meet, $u$ cross $v$ from above to below. Intuitively, this cannot happen. Below we make a step-by-step rigorous proof of this intuition. 

1. $S$ is isolated: if $t \in S$, $u' (t) < v' (t)$, then $u (s) > v (s)$ for $s < t$ sufficiently close, and $u (s) < v (s)$ for $s > t$ sufficiently close. 
2. $S$ contains at least one point. This is because $u (t _0) \le v (t _0)$ and $u (t _1) \ge v (t _1)$. Since $u,v$ are both differentiable, they are continuous, and we can find at least one point by intermediate value theorem. 
3. $S$ contains at least two points. To prove this, the previous step yields $t _2 \in [t _0, t _1]$. If $t _2 > t _0$, we can find $s _2 < t _2$ sufficiently close to $t _2$ such that $u (s _2) > v (s _2)$. We run IVT again in $[t _0, s _2]$ to locate another point in $S$. If $t _2 = t _0$, then we find $s _2 > t _2$ sufficiently close such that $u (s _2) < v (s _2)$. We run IVT in $[s _2, t _1]$. 
4. Let $t _2, t _3$ be two adjacent points in $S$. Then we find $s _2 > t _2$ with $u (s _2) > v (s _2)$, $s _3 < t _3$ with $u (s _3) < v (s _3)$. We run IVT in $[s _2, s _3]$ yielding another point in $S$, which is a contradiction. 

Here we request $f < g$ strictly. What happens if $f \le g$? We defer this to the next lecture.

### Grönwall inequality

> [!lemma] 
> (Grönwall inequality) If $u (t): I \to \R$ is $C ^1$, positive, and satisfies the inequality 
> 
> $$
> 	u' (t) \le \beta (t) u (t)
> $$
> 
> and $\beta$ is continuous, then for any $t _0, t \in I$ with $t _0 < t$, it holds that 
> 
> $$
> 	u (t) \le u (t _0) \exp \left(
> 		\int _{t _0} ^{t} \beta (s) \d s
> 	\right).
> $$


Proof. Define $f (t, x) =  \beta (t) x$. Then $u' (t) \le f (t, u (t))$. Fix $\e > 0$ and define

$$
	g (t, x) = \begin{cases}
		(\beta (t) + \e) x & x > 0 \\
		\beta (t) x + \e & x \le 0.
	\end{cases}
$$

Then $f (t, x) < g (t, x)$. Let $v (t)$ solves $v' (t) = g (t, v (t))$ with $v (t _0) = u (t _0)$. Then $v (t) = u (t _0) \exp \pth{\int _{t _0} ^{t} (\beta (s) + \e) \d s}$ is continuous and differentiable. By comparison lemma, 

$$
	u (t) < v (t) = u (t _0) \exp \pth{\int _{t _0} ^{t} (\beta (s) + \e) \d s}
$$

for any $\e > 0$. Taking $\e \to 0$ finishes the proof.

# Strong solutions of dynamic system

Recall $I$ is an interval. It can be either open, closed, half open half closed, finite or infinite. Now we introduce the following **function spaces**.

We define $C ^0 (I)$ to be the set of functions $u: I \to \R$ that are continuous and bounded. We define $C ^1 (I)$ to be the set of differentiable functions $u \in C ^0 (I)$ with $u' \in C ^0 (I)$. We define $C ^n (I)$ to be the set of differentiable functions $u \in C ^{n - 1} (I)$ with $u' \in C ^{n - 1} (I)$.

For vector-valued function $\bu: I \to \Rd$, we say $\bu \in C ^n (I \to \Rd)$ (or $C ^n (I; \Rd)$) if each component of $\bu$ is in $C ^n (I)$. 

We say $u \in C ^n _\loc (I)$, if for every $x \in I$, $x$ has a neighborhood $x \in U \subset I$ such that $u \at U \in C ^n (U)$. Vector-valued version is defined similarly.

Next, we generalize the notion of "solution". 

> [!Definition] 
> The following is called an initial value problem (DS + initial condition)
> 
> $$
> \begin{align}
 >	\begin{cases}
 >		\bu' (t) = \bf (t, \bu (t)) \\
 >		\bu (t _0) = \bx _0 
 >	\end{cases}
 >\end{align}
 >$$
 >
 >Let $I \subset \R$ be an interval such that $t _0 \in \bar I$.
 >
> $\bu \in C ^1 _{\loc} (I \to \Rd)$ is called a classical solution if it solves it for every $t \in I$. 
> 
> $\bu \in C ^0 _\loc (I \to \Rd)$ is called a **strong solution** if it satisfies 
> 
> $$
>	\bu (t) = \bx _0 + \int _{t _0} ^t \bf (s, \bu (s)) \d s
> $$
> 
> for every $t \in I$. (Recall $\int _{t _0} ^t = -\int _t ^{t _0}$ if $t < t _0$)


