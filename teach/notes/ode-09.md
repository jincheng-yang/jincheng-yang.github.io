---
layout: note
title: "Lecture 9: Plane autonomous system"
use-math: true
---

# Solving linear planar dynamical system

$$
\newcommand{\bx}{\boldsymbol x}
\newcommand{\bX}{\boldsymbol X}
\newcommand{\by}{\boldsymbol y}
\newcommand{\bu}{\boldsymbol u}
\newcommand{\bv}{\boldsymbol v}
\newcommand{\bw}{\boldsymbol w}
\newcommand{\bF}{\boldsymbol F}
\newcommand{\bP}{\boldsymbol P}
\newcommand{\bV}{\boldsymbol V}
\newcommand{\bJ}{\boldsymbol J}
\newcommand{\bf}{\boldsymbol f}
\newcommand{\bg}{\boldsymbol g}
\newcommand{\be}{\boldsymbol e}
\newcommand{\bphi}{\boldsymbol \phi}
\newcommand{\bA}{\boldsymbol A}
\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
$$

In the last lecture we discussed how to solve $\bu' (t) = \bA \bu (t)$. Let's discuss the case $d = 2$, so $\bA$ is a 2-by-2 matrix.

By solving $\det (\lambda \Id - \bA) = 0$, we find two eigenvalues $\lambda _1, \lambda _2$.

1. Distinct real roots: it has independent eigenvectors $\bv _1 = \bv _{111}, \bv _2 = \bv _{211}$. Find them by solving $(\lambda _i \Id - \bA) \bv _i = \boldsymbol 0$. A pair of independent solutions are $\bu _1 (t) = e ^{\lambda _1 t} \bv _1$, $\bu _2 (t) = e ^{\lambda _2 t} \bv _2$.
2. Repeated roots $\lambda _1 = \lambda _2 = \lambda$: then there are two possibilities:
	1. You can find two independent eigenvectors $\bv _1 = \bv _{111}, \bv _2 = \bv _{121}$. A pair of independent solutions are $\bu _1 (t) = e ^{\lambda t} \bv _{1}$, $\bu _2 (t) = e ^{\lambda t} \bv _2$.
	2. There is only one independent eigenvector $\bv = \bv _{111}$ and one generalized eigenvector $\bw = \bv _{112}$ with $(\lambda \Id - \bA) \bw = \bv$, $(\lambda \Id - \bA) \bv = \boldsymbol 0$. A pair of independent solutions are $\bu _1 (t) = e ^{\lambda t} \bv$, $\bu _2 (t) = e ^{\lambda t} (\bw + t \bv)$.
3. Complex roots $\lambda _{1, 2} = \alpha \pm i \beta$. Eigenvector $\bv _{1, 2} = \bv _{111,211} = \bv _{\Re} \pm i \bv _{\Im}$. A complex-valued solution is $\bu (t) = e ^{\lambda _1 t} \bv _1 = e ^{\alpha t} (\cos \beta + i \sin \beta t) (\bv _{\Re} + i \bv _{\Im})$. We find two independent real solutions by taking its real and imaginary part: $\bu _1 (t) = e ^{\alpha t} \pth{\cos (\beta t) \bv _{\Re} - \sin (\beta t) \bv _{\Im}}$, $\bu _2 (t) = e ^{\alpha t} (\cos (\beta t) \bv _{\Im} + \sin (\beta t) \bv _\Re)$.

Except 2.2 whose Jordan form has only one $2 \times 2$ Jordan block, all the others have two $1 \times 1$ Jordan blocks.

## Real Jordan form

Since we need to find real solutions, it is more useful to find the real Jordan form. Of course, if a Jordan matrix is already real, then it is in real Jordan form. We now discuss the case of complex eigenvalues, complex eigenvectors, and generalized complex eigenvectors.

Suppose $\bJ = \bV \inv \bA \bV$. Take a Jordan block $\bJ _{i j}$ whose eigenvalue is complex: $\lambda _i \in \mathbb C$.

$$
	\bJ _{i j} = \begin{pmatrix}
		\lambda _i & 1 & 0 & \dots & 0 & 0 \\
		0 & \lambda _i & 1 & \dots & 0 & 0 \\
		0 & 0 & \lambda _i & \dots & 0 & 0 \\
		\vdots & \vdots & \vdots & & \vdots & \vdots \\
		0 & 0 & 0 & \dots & \lambda _i & 1 \\
		0 & 0 & 0 & \dots & 0 & \lambda _i
	\end{pmatrix} _{d _{ij} \times d _{ij}}
$$

There must also be a conjugate block somewhere with eigenvalue $\lambda _{i' j} = \bar \lambda _{i}$:

$$
	\bJ _{i' j} = \begin{pmatrix}
		\bar \lambda _i & 1 & 0 & \dots & 0 & 0 \\
		0 & \bar \lambda _i & 1 & \dots & 0 & 0 \\
		0 & 0 & \bar \lambda _i & \dots & 0 & 0 \\
		\vdots & \vdots & \vdots & & \vdots & \vdots \\
		0 & 0 & 0 & \dots & \bar \lambda _i & 1 \\
		0 & 0 & 0 & \dots & 0 & \bar \lambda _i
	\end{pmatrix} _{d _{ij} \times d _{ij}}
$$

Moreover, since the eigenvector and generalized eigenvectors satisfy 

$$
	\bA \bv _{i j k} = \begin{cases} 
		\lambda _i \bv _{i j k} & k = 1 \\
		\lambda _i \bv _{i j k} + \bv _{i j (k - 1)} & k > 1
	\end{cases}
$$

Take its conjugate we have 

$$
	\bA \bar \bv _{i j k} = \begin{cases} 
		\bar \lambda _i \bar \bv _{i j k} & k = 1 \\
		\bar \lambda _i \bar \bv _{i j k} + \bar \bv _{i j (k - 1)} & k > 1
	\end{cases}
$$

Denote $\bv _{i j 0} = \boldsymbol 0$ for notational simplicity. Then, by writing $\lambda _i = \alpha _i \pm i \beta _i$, $\bv _{i j k} = \bv _{i j k, \Re} \pm i \bv _{i j k, \Im}$, we have

$$
\begin{align*}
	\bA \bv _{ijk, \Re} &= \frac12 \pth{\bA \bv _{ijk} + \bA \bar \bv _{i j k}} \\
	&= \frac12\pth{\lambda _i \bv _{i j k} + \bar \lambda _i \bar \bv _{ijk}} + \bv _{i j (k - 1), \Re} \\
	&= \alpha _i \bv _{i j k, \Re} - \beta _i \bv _{i j k, \Im} + \bv _{ij(k-1),\Re}. 
\end{align*}
$$


$$
\begin{align*}
	\bA \bv _{ijk, \Im} &= \frac1{2i} \pth{\bA \bv _{ijk} - \bA \bar \bv _{i j k}} \\
	&= \frac1{2i}\pth{\lambda _i \bv _{i j k} - \bar \lambda _i \bar \bv _{ijk}} + \bv _{i j (k - 1), \Im} \\
	&= \beta _i \bv _{i j k, \Re} + \alpha _i \bv _{i j k, \Im} + \bv _{ij(k-1),\Im}. 
\end{align*}
$$

Thus 

$$
\begin{align*}
	&\bA \begin{pmatrix}
		\bv _{i j 1, \Re} & \bv _{i j 1, \Im} &
		\bv _{i j 2, \Re} & \bv _{i j 2, \Im} &
		\dots &
		\bv _{i j d _{ij}, \Re} & \bv _{i j d _{ij}, \Im} 
	\end{pmatrix} \\
	&= \begin{pmatrix}
		\bv _{i j 1, \Re} & \bv _{i j 1, \Im} &
		\bv _{i j 2, \Re} & \bv _{i j 2, \Im} &
		\dots &
		\bv _{i j d _{ij}, \Re} & \bv _{i j d _{ij}, \Im} 
	\end{pmatrix} \begin{pmatrix}
		\alpha _i & \beta _i & 1 & 0 & 0 & 0 & \dots & 0 & 0 & 0 & 0 \\
		-\beta _i & \alpha _i & 0 & 1 & 0 & 0 & \dots & 0 & 0 & 0 & 0 \\
		0 & 0 & \alpha _i & \beta _i & 1 & 0 & \dots & 0 & 0 & 0 & 0 \\
		0 & 0 & -\beta _i & \alpha _i & 0 & 1 & \dots & 0 & 0 & 0 & 0 & \\
		\vdots & \vdots & \vdots & \vdots & \vdots & \vdots & \ddots & \vdots & \vdots & \vdots & \vdots \\
		0 & 0 & 0 & 0 & 0 & 0 & \dots & \alpha _i & \beta _i & 1 & 0 \\
		0 & 0 & 0 & 0 & 0 & 0 & \dots & -\beta _i & \alpha _i & 0 & 1 \\
		0 & 0 & 0 & 0 & 0 & 0 & \dots & 0 & 0 & \alpha _i & \beta _i \\
		0 & 0 & 0 & 0 & 0 & 0 & \dots & 0 & 0 & -\beta _i & \alpha _i
	\end{pmatrix} 
\end{align*}
$$

This matrix is a real Jordan block. It is a $2 d _{ij} \times 2 d _{ij}$ matrix, which is obtained by replacing every $\lambda _{i}$ in $J _{i j}$ by $\begin{pmatrix} \alpha _i & \beta _i \\ -\beta _i & \alpha _i \end{pmatrix}$, every $1$ by $\Id _{2 \times 2}$, and every $0$ by $\boldsymbol O _{2 \times 2}$.

What about solutions? Recall the $ijk$'th complex-valued solution is 

$$
	\bu _{i j k} = \bV \bphi _{i j k} = e ^{\lambda _i t} \left(
		\bv _{i j k} + t \bv _{i j (k - 1)} + \frac{t ^2}2 \bv _{i j (k - 2)} + \dots + \frac{t ^{k - 1}}{(k - 1)!} \bv_{i j 1}
	\right).
$$

We can extract its real parts and imaginary parts:

$$
\begin{align*}
	\Re (\bu _{i j k}) &= e ^{\alpha _i t} \cos \beta _i t \left(
		\bv _{i j k, \Re} + t \bv _{i j (k - 1), \Re} + \frac{t ^2}2 \bv _{i j (k - 2), \Re} + \dots + \frac{t ^{k - 1}}{(k - 1)!} \bv_{i j 1, \Re}
	\right) \\
	& \qquad - e ^{\alpha _i t} \sin \beta _i t \left(
		\bv _{i j k, \Im} + t \bv _{i j (k - 1), \Im} + \frac{t ^2}2 \bv _{i j (k - 2), \Re} + \dots + \frac{t ^{k - 1}}{(k - 1)!} \bv_{i j 1, \Im}
	\right),\\
	\Im (\bu _{i j k}) &= e ^{\alpha _i t} \sin \beta _i t \left(
		\bv _{i j k, \Re} + t \bv _{i j (k - 1), \Re} + \frac{t ^2}2 \bv _{i j (k - 2), \Re} + \dots + \frac{t ^{k - 1}}{(k - 1)!} \bv_{i j 1, \Re}
	\right) \\
	& \qquad + e ^{\alpha _i t} \cos \beta _i t \left(
		\bv _{i j k, \Im} + t \bv _{i j (k - 1), \Im} + \frac{t ^2}2 \bv _{i j (k - 2), \Re} + \dots + \frac{t ^{k - 1}}{(k - 1)!} \bv_{i j 1, \Im}
	\right).
\end{align*}
$$

# Autonomous dynamical system

An autonomous (time-independent/stationary) dynamical system is of the following form: $\bu: \R \to \R ^d$ is an unknown vector-valued function, and $\bf: \Rd \to \Rd$ is a continuous vector field.

$$
	\bu' (t) = \bf (\bu (t)).
$$

Note that $\bf$ is a function of $\bx$ only.

Because $\bf$ does not depend on $t$ directly but only through $\bu$, if we have one solution $\bu (t)$, then for any $s \in \R$, $\bu (t + s)$ is also a solution. That is, the equation has time translation invariance. As a consequence, if $\bf$ is Lipschitz, the flow map satisfies

$$
	\Phi (t _1; t _0, \bx _0) = \Phi (t _1 + s; t _0 + s, \bx _0) = \Phi (t _1 - t _0; 0, \bx _0).
$$

Sometimes we omit the $t _0$ argument if it is zero. Then $\Phi (t; \bx _0) = \bx _1$ means if $\bu (t _0) = \bx _0$ then $\bu (t _0 + t) = \bx _1$. It gives the position of $\bx$ **after** flowing along the trajectory for a time $t$. Specifying the exact value of $t _0$ is not so important now. The only thing that matters is the **duration** $t$ between $t _0$ and $t _1$.

> [!Definition]
> $\bx _0$ is called a **critical point/equilibrium** of the dynamical system if $\bf (\bx _0) = \boldsymbol 0$. The constant function $\bu (t) \equiv \bx _0$ is a solution.

By uniqueness, we immediately deduce the following.

> [!Lemma]
> If $\bu$ is a solution to an autonomous dynamic system and $\bf$ is locally Lipschitz continuous, then either $\bu' (t) \equiv 0$ for all $t$ or $\bu' (t) \neq \boldsymbol 0$ at any $t$.

We can further weaken the notion of "time" by looking at the "phase space" $\Rd$. Note that the image of a solution is the projection of its graph from $\R \times \Rd$ to $\Rd$. For a solution $\bu$, its graph (which lives in $\R \times \Rd$) is called the trajectory/solution curve, while its image (which lives in $\Rd$) is called the streamline/orbit. If some textbook mixes these two notions, you need to determine what they mean by context. 

The phase portrait is a picture that draws all critical points and orbits, with arrow indicating the direction of orbits.

If we accelerate/decelerate the vector field $\bf$, we do not change the streamline. For instance, suppose $\bg (\bx) = \mu (\bx) \bf (\bx)$, where $\mu (\bx) > 0$ is a continuous scalar field. If $\bu (t)$ is a solution to $\bu' (t) = \bf (\bu (t))$, then $\bv (t) = \bu (s (t))$ satisfies 

$$
	\bv' (t) = \bu ' (s (t)) s' (t) = s' (t) \bf (\bu (s (t))) = s' (t) \bf (\bv (t)).
$$

By solving $s' (t) = \mu (\bu (s (t)))$, we find a re-parametrization $s$ and a time-elapsed solution $\bv$ to $\bv' (t) = \bg (\bv (t))$. $\bv$ and $\bu$ have the same image: $s$ is strictly increasing, so it is a bijection between their maximal interval of existence. The phase portrait is thus unchanged. If $\mu (\bx) < 0$ we can reverse the direction of a phase portrait.

By setting, for instance $\mu (\bx) = \frac1{1 + \abs{\bf (\bx)}}$, we can decelerate the vector field $\bf$ to finite speed, and we will have global solutions for any given initial data.

If $\bx _0$ is not a critical point, $\bf (\bx _0) \neq \boldsymbol 0$, then in a small neighborhood $\bx \in B _\e (\bx _0)$, continuity of $\bf$ implies $\bf (\bx) \neq \boldsymbol 0$. In fact, we have the following.

> [!Proposition]
> If $\bf$ is a continuous vector field in $\Rd$ and $\bx _0$ is not a critical point, then in a neighborhood of $\bx _0$, the streamlines are $C ^1$ curves.

Proof. Let $\e$ be sufficiently small such $\bf (\bx) \neq 0$ in $B _\e (\bx _0)$. Any solution $\bu (t)$ with $\bu (0) \in B _\e (\bx _0)$ is a $C ^1$ function, so its image is a $C ^1$ parametric curve with non-vanishing velocity. The curve itself is thus $C ^1$ due to implicit function theorem.

## Phase portrait of linear planar dynamical system

Let's consider the linear planar DS: $\bu' (t) = \bA \bu (t)$ in 2D. 

### Singular case

If $\bA$ is singular, then it could be rank 0 or rank 1. 

The case of rank 0 is $\bA = \boldsymbol O$ and every point is a critical point. 

The case of rank 1 is $\bA = \bv _1 \bv _2 ^\top$. It has a zero eigenvalue with eigenvector $\bv _2 ^\perp = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix} \bv _2$. So every $C _1 \bv _2 ^\perp$ is a critical point.

If $\bv _1 \cdot \bv _2 \neq 0$, then it has a nonzero eigenvalue $\bv _2 ^\top \bv _1$ with eigenvector $\bv _1$. So the solution is 

$$
	\bu (t) = C _1 \bv _2 ^\perp + C _2 e ^{\bv _1 \cdot \bv _2 t} \bv _1.
$$

If $\bv _1 \cdot \bv _2 = 0$, then $\bA \bv _1 = 0$ and $\bA \bv _2 = \abs{\bv _2} ^2 \bv _1$. So $\bv _1$ is an eigenvector and $\bv _2 / \abs{\bv _2} ^2$ is a generalized eigenvector. The solution is 

$$
	\bu (t) = C _1 \bv _1 + C _2 \pth{\frac{\bv _2}{\abs{\bv _2} ^2} + t \bv _1 }.
$$

### Nonsingular case

If $\bA$ is nonsingular, then the only critical point is zero. To find the eigenvalues, we solve the following quadratic equation:

$$
	\det (\lambda \Id - \bA) = \lambda ^2 - \tr (\bA) \lambda + \det \bA = 0.
$$

1. $(\tr \bA) ^2 > 4 \det \bA$. We have two distinct real roots $\lambda _1, \lambda _2$, and two eigenvectors $\bv _1, \bv _2$. Recall the solutions are $\bu _1 (t) = e ^{\lambda _1 t} \bv _1$, $\bu _2 (t) = e ^{\lambda _2 t} \bv _2$. 
	1. If $\det \bA > 0$ and $\tr \bA > 0$, then $\lambda _1, \lambda _2 > 0$. The origin is called an unstable nodal point.
	2. If $\det \bA > 0$ and $\tr \bA < 0$, then $\lambda _1, \lambda _2 < 0$. The origin is called a stable nodal point.
	3. If $\det \bA < 0$, then $\lambda _1 < 0$, $\lambda _2 > 0$. The origin is called a saddle point. It is always unstable.
2. $(\tr \bA) ^2 = 4 \det \bA$. We have repeated roots $\lambda _1 = \lambda _2 = \lambda$. 
	1. If there are two independent eigenvectors $\bv _1, \bv _2$, then the origin is a star point.
		1. If $\tr \bA > 0$, $\lambda > 0$, the origin is an unstable star point.
		2. If $\tr \bA < 0$, $\lambda < 0$, the origin is a stable star point.
	2. If there is an eigenvector $\bv$ and a generalized eigenvector $\bw$, then the origin is a degenerate nodal point. Recall the solutions are $\bu _1 (t) = e ^{\lambda t} \bv$, $\bu _2 (t) = e ^{\lambda t} (\bw + t \bv)$.
		1. If $\tr \bA > 0$, $\lambda > 0$, the origin is an unstable degenerate nodal point.
		2. If $\tr \bA < 0$, $\lambda < 0$, the origin is a stable degenerate nodal point.
3. $(\tr \bA) ^2 < 4 \det \bA$. We have two complex roots $\alpha \pm i \beta$, with eigenvectors $\bv _{\Re} \pm i \bv _{\Im}$.  Recall the solutions are $\bu _1 (t) = e ^{\alpha t} \pth{\cos (\beta t) \bv _{\Re} - \sin (\beta t) \bv _{\Im}}$, $\bu _2 (t) = e ^{\alpha t} (\sin (\beta t) \bv _\Re + \cos (\beta t) \bv _{\Im})$. By making a linear combination, we get $\bu (t) = e ^{\alpha t} \pth{\sin (\beta t + \varphi) \bv _{\Re} + \cos (\beta t + \varphi) \bv _{\Im}}$.
	1. If $\tr \bA > 0$, $\alpha > 0$, the origin is called an unstable focal point.
	2. If $\tr \bA < 0$, $\alpha < 0$, the origin is called a stable focal point.
	3. If $\tr \bA = 0$, $\alpha = 0$, the origin is called a vortex point.
	4. If $\beta \det \begin{pmatrix} \bv _{\Re} & \bv _{\Im} \end{pmatrix} > 0$, then it spirals counter-clockwise, otherwise it spirals clockwise.
