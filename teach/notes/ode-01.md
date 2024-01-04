---
layout: note
title: "Lecture 1: First order ODE"
use-math: true
---
# Classification of ODEs

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bf}{\boldsymbol f}
$$

Ordinary differential equation (system), refers to one (or multiple) identities relating one or more univariate **unknown functions** and their derivatives and higher order derivatives. 

General form of **ODE**: find a scalar-valued function $u: I \subset \R \to \R$ that satisfies

$$
	F (t, u (t), u' (t), \dots, u \pp n (t)) = 0.
$$

for some given $F: \R \times \R ^n \to \R$. One may abbreviate it with $x = u (t)$ as 

$$
	F (t, x, x', \dots, x \pp n) = 0.
$$

$n$ is called the order of ODE.

General form of **a system of ODE**: find a vector-valued function $\bu: I \subset \R \to \R ^d$  that satisfies 

$$
	\bF (t, \bu (t), \bu' (t), \dots, \bu \pp n (t)) = \boldsymbol 0
$$

for some given $\bF: \R \times (\Rd) ^n \to \Rd$. One may reduce it to the case $n = 1$ by increasing the dimension $d$. If we write out $\bu = (u _1, \dots, u _d)$, and $\bF = (F _1, \dots, F _d)$, then 

$$
	F _i (t, u _1 (t), \dots, u _d (t), u _1' (t), \dots, u _d ' (t), \dots, u _d \pp n (t)) = 0, \qquad i = 1, \dots, d.
$$

Again, we may abbreviate it with $\bx = \bu (t)$ as 

$$
	\bF (t, \bx, \bx', \dots, \bx \pp n) = 0.
$$

General form of **dynamic system**: find a vector-valued function $\bu: I \subset \R \to \R ^d$  that satisfies 

$$
	\bu' (t) = \bf (t, \bu (t)).
$$

or 

$$
	\dot \bx = \dfr{\bx}t = \bf (t, \bx) = \bf _t (\bx).
$$

It is a special kind of ODE (and in many cases ODE are locally a dynamic system). $d$ is called the **dimension** of the dynamic system.

If $\bf$ is independent of $t$, we say the dynamic system is **autonomous**.

> [!Example] 
> Newton's second law: $g = 9.8$ 
> 
> $$
> 	x'' + g = 0 \qquad \implies \qquad \ddt \begin{pmatrix} x \\ v \end{pmatrix} = \begin{pmatrix} v \\ -g \end{pmatrix}
> $$
> 
> Simple pendulum: $L > 0$ is a constant
> 
> $$
> 	L \theta '' + g \sin (\theta) = 0 \qquad \implies \qquad \ddt \begin{pmatrix} \theta \\ \omega \end{pmatrix} = \begin{pmatrix} \omega \\ -\dfrac gL \sin \theta \end{pmatrix}
> $$
> 
> Van del Pol oscillator: $\mu \in \R$ and
> 
> $$
> 	\dfr{^2 x}{t ^2} - \mu (1 - x ^2) \dfr xt + x = 0.
> $$





If $\bF$ is affine in $\bx, \bx', \dots, \bx \pp n$, then we say the system of ODE is **linear**. In addition if $\bF$ is linear in $\bx, \bx', \dots, \bx \pp n$, we say the system of ODE is linear and **homogeneous**, otherwise ODE is **non-homogeneous**. 

If $\bF$ is affine in $\bx \pp n$, then we say the system of ODE is **quasilinear**.
# First order ODE

$$
    F (t, x, x') = 0.
$$

Trajectory/integral curve: the graph of $u$: $\{(t, x): t \in I, x = u (t)\}$.
## Separable equation

$$
	x' = \frac{f (t)}{g (x)}.
$$

If $x = u (t)$ is a solution, then 

$$
	f (t) = g (u (t)) u' (t).
$$

Integrate from some $t _0 \in I$ to $t$, 

$$
	\int _{t _0} ^t f (s) \d s = \int _{t _0} ^t g (u (s)) u' (s) \d s
$$

Suppose $G$ is a primitive of $g$, $F$ is a primitive of $f$, then 

$$
	F (t) - F (t _0) = G (u (t)) - G (u (t _0)).
$$

## First order linear equation
### Homogeneous linear equation

Given $p: I \to \R$.

$$
	x' + p (t) x = 0.
$$

If $x = u (t)$ is a solution, and $u > 0$ in $I$, then it is a separable equation with $f (t) = -p (t)$ and $g (x) = \frac1x$.

$$
	- \int _{t _0} ^t p (s) \d s = \log (u (t)) - \log (u (t _0)).
$$

Then

$$
	u (t) = u (t _0) \exp \pth{-\int _{t _0} ^t p (s) \d s}.
$$

Therefore, if $u (t _0) = C > 0$, then 

$$
	u (t) = C \exp \pth{-\int _{t _0} ^t p (s) \d s}.
$$

Similarly, if $u < 0$ in $I$, then for some $C < 0$, we have

$$
	u (t) = C \exp \pth{-\int _{t _0} ^t p (s) \d s}.
$$

If $u = 0$ in $I$, we can verify $u \equiv 0$ is a solution. Combined, we have shown that the solution are of the form 

$$
	u (t) = C \exp \pth{-\int _{t _0} ^t p (s) \d s}
$$

for some constant $C \in \R$. 

> [!Question] Are these all the solutions? Is it possible that $u$ changes sign in $I$?

### Inhomogeneous linear equation

Given $p, q: I \to \R$. 

$$
	x' + p (t) x = q (t)
$$

Method of integrating factor: define $\mu (t) = \exp (\int p (s) \d s)$ to be the exponential of some primitive of $p$. Since primitives can differ by a additional constant, choice of $\mu$ can differ by a multiplicative coefficient. $\mu (t)$ solves the following homogeneous equation: 

$$
	\mu' (t) = p (t) \mu (t).
$$

If $x = u (t)$ is a solution then multiplying by $\mu (t)$:

$$
		q (t) \mu (t) = u' (t) \mu (t) + p (t) \mu (t) u (t) = u' (t) \mu (t) + \mu' (t) u (t) = \ddt (\mu (t) u (t)).
$$

Integrate from $t _0 \in I$ to $t$, 

$$
	\mu (t) u (t) - \mu (t _0) u (t _0) = \int _{t _0} ^t \mu (s) q (s) \d s.
$$

So 

$$
	u (t) = \frac1{\mu (t)} \pth{
		\mu (t _0) u (t _0) + \int _{t _0} ^t \mu (s) q (s) \d s
	}.
$$

We can divide by $\mu$ because it is nonzero.

## Quasilinear equations

The scenarios above can be unified in the framework of quasilinear equations: 

$$
	M (t, x) + N (t, x) \dfr xt = 0 \iff M (t, x) \dt + N (t, x) \dx = 0.
$$

That is 

$$
	M (t, u (t)) + N (t, u (t)) u' (t) = 0.
$$

Geometrically, it means that on the $(t, x)$-plane, the graph of the solution $(t, u (t))$ is a curve that is **perpendicular** to the vector field $(M, N)$ everywhere. Of course, it is also perpendicular to $(\mu M, \mu N)$ for some nonzero function $\mu$ of $(t, x)$. 

For simplicity suppose $I = \R$. Recall that for a differentiable function $G: \R \times \R \to \R$, its **gradient fields** is perpendicular to its **contour** (level curves). Hence, if $(\mu M, \mu N) = \grad G = (\partial _t G, \partial _x G)$ is a gradient field of some scalar field $G$, then $(t, u (t))$ is constant on $G$, i.e. $G (t, u (t)) = C$ for some constant $C$. 

> [!Definition]
> $G$ is called an **integral** of the ODE if it is constant on any solution curve $(t, u (t))$.

The question becomes to find the correct integrating factor $\mu$ that makes $(\mu M, \mu N)$ a gradient field. 

- For separable equation: 

$$
	g (x) \d x - f (t) \d t = 0.
$$

- $(M (t, x), N (t, x)) = (-f (t), g (x)) = \grad (G (x) - F (t))$.
- For linear equation: 

$$
	\dx + (p(t) x - q (t)) \dt = 0
$$

- $\mu (x, t) = \exp (\int p (t) \dt)$. 

$$
\begin{align*}
	(\mu M, \mu N) &= (p (t) \mu (t) x - \mu (t) q (t), \mu (t)) \\
	&= (\mu' (t) x - \mu (t) q (t), \mu (t)) \\
	&= \grad \pth{\mu (t) x - \int \mu (t) q (t) \d t}
\end{align*}
$$

In general, the task of finding $\mu$ such that $\mu M = \partial _t G$, $\mu N = \partial _x G$ is not so trivial. If $G$ is twice continuously differentiable, then 

$$
	M \partial _x \mu + \mu \partial _x M = N \partial _t \mu + \mu \partial _t N.
$$

This is a first-order **partial differential equation** and outside the scope of this course (in fact, it is solved by converting it back to ODE).

$\mu$ is also nonunique: if $(\mu M, \mu N) = \grad G$, then for a differentiable, strictly increasing function $\beta: \R \to \R$, $\grad (\beta \circ G) = \beta' (G) \grad G = (\mu \beta' (G) M, \mu \beta' (G) N)$ is also a gradient field, so $\mu \beta' (G)$ is also an integrating factor. This is because the contours of $G$ and the contours of $\beta (G)$ are the same.