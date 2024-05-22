---
layout: post
title: Boundary Harnack inequality
date: 2024-04-27
use-math: true
use-d3: true
comments: true
hide: false
---

Let $e = (1, 0, \dots, 0)$. Consider a function $u$ satisfying

$$
\begin{cases}
	\La u = 0 & \inn \Omega \cap B _2 \\
	u \ge 0 & \inn \Omega \cap B _2 \\
	u = 0 & \onn \partial \Omega \cap B _2
\end{cases}
$$

> [!Theorem]
> If $u, v$ satisfies above then 
> * $$\max _{\Omega \cap B _1} u \le C u (e)$$
> * $$\sup _{\Omega \cap B _1} \frac uv \le C \frac{u(e)}{v(e)}$$
> * $$\left[\frac uv\right] _{C ^\alpha (\Omega \cap B _1)} \le C \frac{u (e)}{v (e)}$$

Recall that:

1. Interior Harnack inequality: if $x$ can be connected to $e$ by a chain of $N$ balls, then $u(x) \le C ^N u (e)$.
2. Therefore, if the boundary is Lipschitz (or more generally called nontangentially accessible domains) then $c d (x) ^q u (e) \le u (x) \le C d (x) ^{-q} u (e)$. Here $d (x) = d (x, \partial \Omega)$ 
3. Zero extension is subharmonic, for which weak Harnack inequality holds: if $\La u \ge 0$ in $B _1$, $u \le 1$ in $B _1$, $\abs{\set{u \le 0} \cap B _1} \ge \mu > 0$ then $\max _{B _\frac12} u \le 1- \theta$. $\theta$ can becomes large (close to 1) if $\mu$ is close to $\abs{B _1}$.
4. Weak Harnack inequality means: if $\La u \ge 0$ in $B _1$, $u (x) \ge 1$ at some $x \in B _\frac12$, $\abs{\set{u \le 0} \cap B _1} \ge \mu > 0$, then $\max _{B _\frac12} u \ge 1 + \theta$.

### Proof of 1.

If it fails, then for arbitrarily large $A$ we can find $x _1 \in \Omega \cap B _1$ with $u (x _1) > A$. 

* $x _1$ must be $\delta$-close to $\partial \Omega$, otherwise we can use regular Harnack
* by weak Harnack, there exists $x _2$ with $d(x _1, x _2) \le 2 d (x _1)$ such that $u (x _2) \ge (1 + \theta) u (x _1)$. Reason: take $r = d (x _1)$. Then $B _{2 r} (x _1)$ has a lot of zeros.
* Then $d (x _2) \le 3 d (x _1)$. We can find $x _3$ such that $d (x _2, x _3) \le 2 d (x _2)$, and $u (x _3) \ge u (x _2) (1 + \theta) ^2$.

Then 

$$
	C d (x _j) ^{-q} u (e) \ge u (x _j) \ge u (x _1) (1 + \theta) ^j \ge A (1 + \theta) ^j.
$$

So $d (x _j) ^q \le \pthf{C u (e)}A (1 + \theta) ^{-j} \to 0$. Then $u (x _j) \to 0$, contradicting to $u (x _j) \ge A$.

### Proof of 2. 

First we show the lemma.

> [!Lemma] 
> There exists $\delta, \varepsilon > 0$. If 
> 
> $$
> \begin{cases}
> 	\La u = 0 & \inn \Omega \cap B _1 \\
> 	u \ge 1 & \inn \Omega _\delta \cap B _1 \\
> 	u \ge -\varepsilon & \inn \Omega \cap B _1 \\
> 	u = 0 & \onn \partial \Omega \cap B _1
> \end{cases}
> $$
> 
> then $u \ge 0$ in $\Omega \cap B _{\frac12}$.

From Lemma to 2: WLOG $u (e) = v (e)$ and $u, v \le 1$ in $B _2$. Apply to $u - \varepsilon _0 v$. Regular Harnack implies $u - \varepsilon _0 v \ge c$.

> [!Lelemmamma]
> There exists $\delta, a > 0$. If  
> 
> $$
> \begin{cases}
> 	\La u = 0 & \inn \Omega \cap B _1 \\
> 	u \ge 1 & \inn \Omega _\delta \cap B _1 \\
> 	u \ge -\varepsilon & \inn \Omega \cap B _1 \\
> 	u = 0 & \onn \partial \Omega \cap B _1
> \end{cases}
> $$
> 
> then $u \ge a$ in $\Omega _{\frac\delta2} \cap B _{\frac12}$, and $u \ge -a \varepsilon$ in $\Omega \cap B _\frac12$.

Lemma is an extreme version of Lelemmamma with $a = 0$. 

From Lelemmamma to Lemma: Iterate it to get a cone of positivity, which is the union $\Omega _{\delta / 2 ^k} \cap B _{2 ^{-k}}$.

*Proof of Lelemmamma*. Let $v = u + \varepsilon _0$. $v \ge 0$ and $v \ge 1$ in $\Omega _\delta \cap B _\frac12$. So using Harnack *once* we can get $v \ge 2 a$ in $\Omega _{\delta/2} \cap B _\frac12$. 
Apply weak Harnack inequality to $u _- = \max (0, -u)$. 
Recall the $\theta$ can be large: $\max _{B _\frac12} u _- \le C \nor{u _-} _{L ^1 (B _1)}$. 
Since $u _-$ is only nonzero in $\Omega \setminus \Omega _\delta$, it is a thin strip with very little measure. 

### Proof of 3. 

Harnack inequality implies oscillation decay, which implies Hölder.

By part 2, $\frac1A \le \frac uv \le A$ in $B _1$. So 

$$\frac1A u \le v \le A u.$$ 

Now $A u - v$ and $A v - u$ are both harmonic and nonnegative in $B _1$ and vanish on $\partial \Omega$, so by boundary Harnack

$$
	\frac1C \le \frac{A u - v}{A v - u} \le C \qquad \text{ in } B _{\frac12} \cap \Omega.
$$

So 

$$
	\frac{C + A}{C + \frac1A} \cdot \frac1A u \le \frac{A + C}{A C + 1} u \le v \le \frac{A C + 1}{A + C} u = \frac{C + \frac1A}{C + A} \cdot A u.
$$

We have oscillation decay!