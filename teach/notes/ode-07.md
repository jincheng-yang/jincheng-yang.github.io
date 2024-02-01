---
layout: note
title: "Lecture 7: Constant coefficient second order equations"
use-math: true
---

# Second order linear equations

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\by}{\boldsymbol y}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bv}{\boldsymbol v}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bf}{\boldsymbol f}
$$

Recall the normal form of a second order equation:

$$
	u'' (t) + p (t) u ' (t) + q (t) u (t) = r (t).
$$

Today, we learn how to solve the case of constant coefficient. That is:

$$
	u'' (t) + p u (t) + q u (t) = 0.
$$

## Differential operators

To solve a second order equation, we want to reduce it back to first order equations which we know how to solve. Recall that a constant-coefficient homogeneous first order equation 

$$
	u' (t) + p u (t) = 0, \qquad t \in \R
$$

is simply solved by $u (t) = C e ^{-p t}$. We should expect similar exponential-type solutions appear for the second order equation as well, for the following reasons. 

One way to understand derivatives is by differential operator. For simplicity, let's focus on the set of smooth functions $C ^\infty (\R)$. The differential operator $D$ is defined by 

$$
	D: C ^\infty (\R) \to C ^\infty (\R) \qquad D (u) = u'
$$

That is, it maps a function to its derivative. Then, the above equation becomes

$$
	D u + p u = 0 \implies (D + p \,\Id) u = 0.
$$

Here $\Id$ is the identity operator that maps a function to itself. The summation of operators is the same as summation of functions: you add operators by defining the transform under addition as the sum of transforms under two operators. Additions of operators are commutative and associative by definition. Operators can be compounded and it is also associative. It is not always commutative. However, for any polynomial $p _1, p _2 \in P ^k$, operator $p _1 (D)$ and $p _2 (D)$ are commutative. Here $p _1 (D)$ is defined as the following: if $p _1 (t) = \sum _{r = 0} ^k c _r t ^r$, then $p _1 = \sum _{r = 0} ^k c _r D ^r$. $D ^r$ is $D \circ D \circ \dots \circ D$, the r-times differentiation operator.

> [!Definition]
> $\sum _{r = 0} ^k c _r (t) D ^r$, $c _k \not \equiv 0$ is a differential operator or order $k$. 

If each $c _r$ is a constant, then this is a constant coefficient differential operators, and they commute, because differentiation commutes with scalar multiplication.

## Solving second order equations

One simple class of equations are 

$$
	(D - \lambda _1 \,\Id) (D - \lambda _2 \,\Id) u = u'' - (\lambda _1 + \lambda _2) u' + \lambda _1 \lambda _2 u = 0.
$$

Here $\lambda _1, \lambda _2 \in \R$. If we denote $v = (D - \lambda _2 \; \Id) u$, then this can be written as a decoupled system

$$
\begin{cases}
	u' - \lambda _2 u = v \\ 
	v' - \lambda _1 v = 0
\end{cases}
$$

We solve the second first, $v (t) = c _1 e ^{\lambda _1 t}$. Then for the first, integrating factor is 

$$
	\mu (t) = \exp \pth{\int -\lambda _2 \dt } = e ^{-\lambda _2 t}.
$$

So 

$$
	e ^{-\lambda _2 t} u (t) = \int c _1 e ^{\lambda _1 t - \lambda _2 t} \d t = \begin{cases}
		\frac1{\lambda _1 - \lambda _2} c _1 e ^{(\lambda _1 - \lambda _2) t} + c _2 & \lambda _1 \neq \lambda _2 \\
		c _1 t + c _2 & \lambda _1 = \lambda _2
	\end{cases}
$$

Thus 

$$
	u (t) = \begin{cases}
		\frac1{\lambda _1 - \lambda _2} c _1 e ^{\lambda _1 t} + c _2 e ^{\lambda _2 t} & \lambda _1 \neq \lambda _2 \\
		(c _1 t + c _2) e ^{\lambda _2 t} & \lambda _1 = \lambda _2
	\end{cases}.
$$

Here $c _1, c _2$ are arbitrary real numbers. We have thus obtained solutions

$$
\begin{align*}
	u _1 (t) = e ^{\lambda _1 t}&, u _2 (t) = e ^{\lambda _2 t} & \lambda _1 &\neq \lambda _2 \\
	u _1 (t) = e ^{\lambda t}&, u _2 (t) = t e ^{\lambda t} & \lambda _1 &= \lambda _2 = \lambda
\end{align*}
$$

We can verify they are independent by computing the Wronskian at $t = 0$. If $\lambda _1 \neq \lambda _2$, the Wronskian is

$$
	W (u _1, u _2) (0) = \left\lvert
		\begin{matrix}
			1 & 1 \\
			\lambda _1 & \lambda _2
		\end{matrix}
	\right\rvert = \lambda _2 - \lambda _1 \neq 0.
$$

If $\lambda _1 = \lambda _2$, the Wronskian is 

$$
	W (u _1, u _2) (0) = \left\lvert
		\begin{matrix}
			1 & 0 \\
			\lambda & 1
		\end{matrix}
	\right\rvert = 1 \neq 0.
$$

Therefore, we conclude that the general solution to the ODE is $u = C _1 u _1 + C _2 u _2$ for constants $C _1, C _2 \in \R$. 

## Complex roots

From the previous discussion, we find that if the ODE can be written as 

$$
	u'' - (\lambda _1 + \lambda _2) u' + \lambda _1 \lambda _2 u = 0
$$

then the solutions can be found as above. That is, when $p = -(\lambda _1 +\lambda _2)$, $q = \lambda _1 \lambda _2$. For any $p, q \in \R$, the two $\lambda$'s can be determined by solving the following quadratic algebraic equation:

$$
	\lambda ^2 + p \lambda + q = 0.
$$

This is called the **characteristic equation** of the constant-coefficient ODE. We know that there are three possibilities for the roots:

* Distinct real roots: $\lambda _1 \neq \lambda _2 \in \R$. In this case $u _1 (t) = e ^{\lambda _1 t}$, $u _2 (t) = e ^{\lambda _2 t}$ are independent solutions.
* Repeated real roots: $\lambda _1 = \lambda _2 = \lambda$. In this case $u _1 (t) = e ^{\lambda t}, u _2 (t) = t e ^{\lambda t}$ are independent solutions. 
* Complex roots: $\lambda _{1, 2} = \alpha \pm i \beta$. What are the solutions for this system?

If we branch out our search, and look for **complex-valued solutions**, then we can easily conclude as the real case that $U _1 = e ^{\lambda _1 t} = e ^{(\alpha + i \beta) t}$, $U _2 = e ^{\lambda _2 t} = e ^{(\alpha - i \beta) t}$ are solutions. Even though we did not discuss the complex-valued ODE or dynamical systems, the uniqueness and existence theories are essentially the same because $\mathbb C ^n$, as a vector space over $\mathbb R$, is linear isomorphic to $\mathbb R ^{2n}$. 

How to look for real-valued solutions from these two complex-valued solutions? Well, we have the following lemma. 

> [!Lemma]
> For a complex-valued solution $U$ to a homogeneous linear equation
> 
> $$
> 	u'' (t) + p (t) u' (t) + q (t) u (t) = 0
> $$
> 
> both the real part and the imaginary part are solutions.

> [!Remark]
> The real part of a complex number $c = \alpha + i \beta$, $\alpha, \beta \in \R$, is $\alpha = \operatorname{Re} c$. The imaginary part is $\beta = \operatorname{Im} c$. In this class, the imaginary part always refers to the imaginary part without the $i$.
> 

Proof. From the equation, if $U$ is a complex-valued solution, then we can directly verify that $\bar U$ is also a complex-valued solution. Therefore, their linear combinations are solutions because the equation is homogeneous. This means 

$$
	\operatorname{Re} U = \frac12 \pth{U + \bar U}, \qquad \operatorname{Im} U = \frac1{2i} \pth{U - \bar U}
$$

are both solutions. 

Back to the constant-coefficient case. $U _1 = e ^{(\alpha + i \beta) t}$ and $U _2 = e ^{(\alpha - i \beta) t}$ are two complex-valued solutions, and they are complex conjugate to each other, so they have the same real part and opposite imaginary part. They are:

$$
	\begin{align*}
		u _1 = \operatorname{Re} U _1 = \operatorname{Re} e ^{(\alpha + i \beta) t} = e ^{\alpha t} \cos \beta t, \\
		u _2 = \operatorname{Im} U _2 = \operatorname{Im} e ^{(\alpha + i \beta) t} = e ^{\alpha t} \sin \beta t.
	\end{align*}
$$

Here we used the Euler formula: $e ^{i \theta} = \cos \theta + i \sin \theta$. 

Are they linearly independent? Let's verify.

$$
	W (u _1, u _2) (t) = \left\lvert
		\begin{matrix}
			1 & 0 \\
			\alpha & \beta
		\end{matrix}
	\right\rvert = \beta \neq 0.
$$

## Summary 

In summary, to solve 

$$
	u'' (t) + p u (t) + q u (t) = 0, 
$$

we need to solve the characteristic equation and find two roots $\lambda _{1, 2}$, and then we can find independent solutions according to the roots:

* Distinct real roots: $\lambda _1 \neq \lambda _2 \in \R$. In this case $u _1 (t) = e ^{\lambda _1 t}$, $u _2 (t) = e ^{\lambda _2 t}$ are independent solutions.
* Repeated real roots: $\lambda _1 = \lambda _2 = \lambda$. In this case $u _1 (t) = e ^{\lambda t}$, $u _2 (t) = t e ^{\lambda t}$ are independent solutions. 
* Complex roots: $\lambda _{1, 2} = \alpha \pm i \beta$. In this case $u _1 (t) = e ^{\alpha t} \cos \beta t$, $u _2 (t) = e ^{\alpha t} \sin \beta t$ are independent solutions.

## Nonhomogoeneous case

Recall that the solution to 

$$
	\begin{cases}
		u'' (t) + p u ' (t) + q u (t) = r (t) \\
		u (t _0) = x _0 \\
		u' (t _0) = x _0'
	\end{cases}	
$$

is $u = x _0 \phi _1 + x _0' \phi _2 + \phi _r$, where $\phi _1, \phi _2$ are fundamental solutions, and $\phi _r$ is a solution to 

$$
	\begin{cases}
		u'' (t) + p u ' (t) + q u (t) = r (t) \\
		u (t _0) = 0 \\
		u' (t _0) = 0
	\end{cases}	.
$$

Now, since $u _1, u _2$ are independent solutions, we know $\phi _1 = c _1 u _1 + c _2 u _2$ and $\phi _2 = c _3 u _1 + c _4 u _2$ for some constants $c _1, c _2, c _3, c _4$. These constants can be determined by solving linear systems. What about $\phi _r$? It has the following convolution expression.

> [!Theorem] For nonhomogeneous constant coefficient equation 
> 
> $$
> u'' (t) + p u' (t) + q u (t) = r (t) 
> $$
> 
> $\phi _r$ can be computed by 
> 
> $$
> 	\phi _r (t) = \int _{t _0} ^t \phi _2 (t _0 + t - s) r (s) \d s.
> $$
>
> Recall $\phi _2$ is the second fundamental solution.

Proof. We verify directly.

$$
\begin{align*}
	\phi _r ' (t) = \int _{t _0} ^t \phi _2 (t _0 + t - s) r (s) \d s + \phi _2 (t _0 + t - t) r (t) = \int _{t _0} ^t \phi _2 (t _0 + t - s) r (s) \d s .
\end{align*}
$$

Here we use $\phi _2 (t _0) = 0$. 


$$
\begin{align*}
	\phi _r '' (t) = \int _{t _0} ^t \phi _2 '' (t _0 + t - s) r (s) \d s + \phi _2 ' (t _0 + t - t) r (t) = \int _{t _0} ^t \phi _2 ''(t _0 + t - s) r (s) \d s + r (t).
\end{align*}
$$

Here we use $\phi _2' (t _0) = 1$. So 

$$
	(\phi _r '' + p \phi _r ' + q \phi _r) (t) = \int _{t _0} ^t (\phi _2 '' + p \phi _2 ' + q \phi _2) (t _0 + t - s) r (s) \d s + r (t) = r (t).
$$ 

Here we used $\phi _2$ is a reduced solution so $\phi _2 ^{\prime\prime} + p \phi _2 ^\prime + q \phi _2 = 0$. Moreover, $\phi _r (t _0) = \phi _r' (t _0) = 0$ since they are integrals from $t _0$ to $t _0$.
