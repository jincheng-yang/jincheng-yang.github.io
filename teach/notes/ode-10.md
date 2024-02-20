---
layout: note
title: "Lecture 10: critical points"
use-math: true
---

# Properties of critical points

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
\newcommand{\bxi}{\boldsymbol \xi}
\newcommand{\bA}{\boldsymbol A}
\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
\newcommand{\bB}{\boldsymbol B}
\newcommand{\bC}{\boldsymbol C}
$$

## Stability

> [!Definition]
> Let $\bx _0 \in \R ^d$ be a critical point of the autonomous system $\bu' (t) = \bf (\bu (t))$, so $\bf (\bx _0) = \boldsymbol 0$. 
> 1. $\bx _0$ is *stable* if for every $\e > 0$, there exists $\delta > 0$, if $\abs{\bu (0) - \bx _0} < \delta$, then $\abs{\bu (t) - \bx _0} < \e$ for all $t > 0$.
> 2. $\bx _0$ is *attractive* if for some $\delta > 0$, if $\abs{\bu (0) - \bx _0} \le \delta$, then $\lim _{t \to +\infty} \abs{\bu (t) - \bx _0} = 0$.
> 3. $\bx _0$ is *globally attractive* if it is attractive for every $\delta > 0$.
> 4. $\bx _0$ is *strictly stable* if it is both stable and attractive. 
> 5. $\bx _0$ is *neutrally stable* if it is stable but not attractive.
> 6. $\bx _0$ is *unstable* if it is not stable.

> [!Remark]
> $\bx _0$ is attractive means $\bx _0$ has a $\delta$-neighborhood which is *eventually* attracted to $\bx _0$. That is, for every $\e > 0$, there exists $T > 0$ (could depend on both $\delta$ and $\e$), such that $\abs{u (t) - \bx _0} < \e$ for all $t > T$. It is possible to be attractive but not stable. 

> [!Theorem]
> The critical point $\boldsymbol 0$ of $\bu' (t) = \bA \bu (t)$ is attractive if and only if every eigenvalue of $\bA$ has a negative real part. In this case, the system is also strictly stable.

Proof. If a nonnegative real eigenvalue $\lambda$ exists and there is a corresponding eigenvector $\bv$ of unit length, then $\bu (t) = \frac\delta2 e ^{\lambda t} \bv$ is a solution with $\abs{\bu (0)} < \delta$, but $\lim _{t \to +\infty} \abs{\bu (t)} = \lim _{t \to +\infty} \frac\delta2 e ^{\lambda t} \neq 0$. If a complex eigenvalue $\lambda = \alpha + i \beta$ has nonnegative real part $\alpha \ge 0$, and there is a corresponding unit complex eigenvector $\bv = \bv _{\Re} + i \bv _{\Im}$ (that is, $\abs{\bv} ^2 = \abs{\bv _\Re} ^2 + \abs{\bv _{\Im}} ^2 = 1$), then $\bu (t) = \frac\delta2 e ^{\alpha t} (\cos (\beta t) \bv _{\Re} - \sin (\beta t) \bv _{\Im})$ does not converge to zero as $t \to +\infty$. If all eigenvalue has negative real parts $\alpha < 0$, then we have independent solutions that are $e ^{\alpha t} O (t ^d)$ as $t \to +\infty$, where the $O (t ^d)$ part is a combination of sine, cosine, and polynomials. So each independent solution converges to zero exponentially, thus their linear combinations also converges to zero exponentially. The stability follow from the fact that $e ^{\alpha t} t ^d$ is a bounded function for $t \in [0, \infty)$ when $\alpha$ has negative real part.

## Lyapunov functional

How to decide if a critical point is stable or attractive? We can use Lyapunov functional. 

Let $R > 0$. A Lyapunov function $E: B _R (\bx _0) \subset \Rd \to \R$ for a critical point $\bx _0$ to the autonomous system $\bu' (t) = \bf (\bu (t))$ is a differentiable function that assumes its global minimum at $\bx _0$ and satisfies 

$$
	\grad E (\bx) \cdot \bf (\bx) < 0, \qquad \forall \bx \in B _R (\bx _0), \bx \neq \bx _0.
$$

For any solution $\bu (t)$, we deduce from the chain rule that

$$
	\ddt E (\bu (t)) = \grad E (\bu (t)) \cdot \bu' (t) = \grad E (\bu (t)) \cdot \bf (\bu (t)) < 0.
$$

So Lyapunov function decreases along any orbit. If we can furthermore deduce that $\lim_{t \to +\infty} E (\bu (t)) = \min _{\bx \in \Rd} E (\bx) = E (\bx _0)$, then it must happen that $\bu (t) \to \bx _0$ as $t \to +\infty$. We prove it below.

> [!Theorem]
> If $\bx _0$ is a critical point and there exists a Lyapunov function $E: B _R (\bx _0) \to \R$, then $\bx _0$ is strictly stable.

Proof. Adding a constant to a Lyapunov function is still a Lyapunov function, so we can assume without loss of generality that $E (\bx _0) = 0$. We note that $\bx _0$ is a unique minimum because $\grad E (\bx) \neq 0$ elsewhere. Therefore $E (\bx) > 0$ unless $\bx = \bx _0$.

Given $\e < R$, since $E$ is continuous, the minimum on boundary is strictly positive:

$$
	E _0 = \min _{\bx \in \partial B _\e (\bx _0)} E (\bx) > 0.
$$

As $E (\bx _0) = 0 < E _0$, there exists a $\delta _\e$-neighborhood of $\bx _0$ such that $E (\bx) < E _0$ for all $\bx \in B _{\delta _\e} (\bx _0)$. We want to show if $\bu (0) \in B _\delta (\bx _0)$, then $\bu (t) \in B _\e (\bx _0)$ for all $t > 0$ and $\lim _{t \to +\infty} \bu (t) = \bx _0$. This implies $\bx _0$ is attractive and stable, thus strictly stable.

Define $V (t) = E (\bu (t))$. Then by chain rule, $V$ is strictly decreasing. This implies  $V (t) < V (0) = E (\bu (0))  < E _0$. From this we know $\bu (t) \notin \partial B _\e (\bx _0)$ for any $t$, and due to continuity $\bu (t) \in B _\e (\bx _0)$ for all $t$. Therefore, $\bx _0$ is stable.

Next, we show that for each $0 < \delta' < \delta$, there exists $t > 0$ such that $\bu (t) \in B _{\delta'}(\bx _0)$. Suppose otherwise, then $\bu (t) \in B _\e (\bx _0) \setminus B _{\delta'} (\bx _0)$ for all $t > 0$, thus 

$$
	V' (t) = \grad E (\bu (t)) \cdot \bf (\bu (t)) \le \min _{\bx \in \overline{B _\delta (\bx _0) \setminus B _\delta (\bx _0)}} \grad E (\bx) \cdot \bf (\bx) =: \gamma < 0.
$$

Therefore $V (t) \le V (0) + \gamma t$ for every $t > 0$, contradicting that $V$ is nonnegative.

Because of this, we can consider a sequence of $\e _n \to 0$, and due to stable-ness we get a sequence of $\delta _n \to 0$. For each $\delta _n > 0$ there exists $t _n > 0$ such that $\bu (t _n) \in B _{\delta _n} (\bx _0)$, implying $\bu (t) \in B _{\e _n} (\bx _0)$ for all $t > t _n$. Since $\e _n \to 0$, this implies $\lim _{t \to +\infty} \bu (t) = \bx _0$. The proof is now completed.

## Linearization of nonlinear dynamical system

Now suppose $\bx _0 \in \Rd$ is a critical point of $\bu' (t) = \bf (\bu (t))$. Let $\bf \in C ^2 (\Rd)$. Then we have Taylor expansion near $\bx _0$: 

$$
	\bf (\bx) = \bf (\bx _0) + \grad \bf (\bx _0) (\bx - \bx _0) + O (\abs{\bx - \bx _0} ^2).
$$

Denote $\bA = \grad \bf (\bx _0) \in \mm _{d \times d} (\R)$ to be the Jacobian of $\bf$ at $\bx _0$. Since $\bx _0$ is a critical point, $\bf (\bx _0) = 0$, so we can write 

$$
	\bf (\bx) = \bA (\bx - \bx _0) + \boldsymbol \xi (\bx - \bx _0).
$$

Here $\bxi: \Rd \to \Rd$ is the remainder that satisfies $\abs{\bxi (\by)} \le C \abs{\by} ^2$. If we define $\bv (t) = \bu (t) - \bx _0$, then $\bv (t)$ satisfies:

$$
	\bv' (t) = \bu' (t) = \bf (\bu (t)) = \bA (\bu (t) - \bx _0) + \bxi (\bu (t) - \bx _0) = \bA \bv (t) + \bxi (\bv (t)).
$$

If we drop the quadratic remainder, then 

$$
	\bv' (t) = \bA \bv (t)
$$

is called the **linearized system** of the original dynamic system near $\bx _0$. 

Does strict stability of the zero solution to the linearized system implies the strict stability of $\bx _0$ to the original equation? The following theorem says yes.

> [!Theorem]
> (Poincaré-Lyapunov) If the critical point $\boldsymbol 0$ is a strictly stable critical point of the linearized system, then $\bx _0$ is a strictly stable critical point of the original dynamical system.

Proof. Without loss of generality, suppose $\bx _0 = \boldsymbol 0$. We want to design a Lyapunov function $E (\bx) = \bx ^\top \bB \bx$ for some positive definite symmetric matrix $\bB$. That is, $\bB = \bB ^\top$ and all eigenvalues are strictly positive. Then $E (\bx) \ge 0$ and equality only holds at $\bx = \boldsymbol 0$. 

To see it satisfies the Lyapunov condition, we compute $\grad E (\bx) = 2 \bx ^\top \bB$, and 

$$
	\grad E (\bx) \cdot \bf (\bx) = 2 \bx ^\top \bB \bA \bx + 2 \bx ^\top \bB \bxi (\bx) = \bx ^\top (\bB \bA + \bA ^\top \bB) \bx + O (\abs{\bx} ^3).
$$

To make this negative near $\bx _0 = \boldsymbol 0$, we need the symmetric matrix $\bC = \bB \bA + \bA ^\top \bB$ to be negative definite. 

The question becomes: if all eigenvalues of $\bA$ are negative, does there exists a positive definite matrix $\bB$ such that $\bC$ is negative definite? The answer is affirmative, and the proof is purely linear algebra. We take $d = 2$ as an example.

First, note that for $\bV \in \mm _{n \times n}(\R)$, if $\bA = \bV \bA ^* \bV \inv$, then $\bC = \bB \bA + \bA ^\top \bB$ is equivalent to 

$$
	\bV ^\top \bC \bV = \bV ^\top \bB \bA \bV + \bV ^\top \bA ^\top \bB \bV = \bV ^\top \bB \bV \bA ^* + \bA ^{*\top} \bV ^\top \bB \bV.
$$

The problem becomes to find positive definite $\bB ^* = \bV ^\top \bB \bV$ and negative definite $\bC ^* = \bV ^\top \bC \bV$ such that $\bC ^* = \bB ^* \bA ^* + \bA ^{*\top} \bB ^*$. 

Then there is only a few possibilities: if $\bA$ has two eigenvalues with two eigenvectors (stable nodal/star), then $\bA = \bV \bJ \bV \inv$ where columns of $\bV$ are eigenvectors and 

$$
	\bA ^* = \bJ = \begin{pmatrix}
		\lambda _1 & 0 \\
		0 & \lambda _2
	\end{pmatrix}, \lambda _1, \lambda _2 < 0
$$

We can take $\bB ^* = \Id$, then $\bC ^* = 2 \bA ^*$ is negative definite. If $\bA$ has one eigenvalue of algebraic multiplicity 2, but there is only one eigenvector(degenerate stable nodal), then $\bA = \bV \bJ \bV \inv$ where columns of $\bV$ are the eigenvector and the generalized eigenvector, and 

$$
	\bA ^* = \bJ = \begin{pmatrix}
		\lambda & 1 \\
		0 & \lambda
	\end{pmatrix}, \lambda < 0.
$$

We can take $\bB ^* = \begin{pmatrix} 1 & 0 \\ 0 & \mu \end{pmatrix}$ for some $\mu > 0$. Then 

$$
	\bC ^* = \begin{pmatrix} 
		1 & 0 \\ 
		0 & \mu 
	\end{pmatrix} \begin{pmatrix}
		\lambda & 1 \\
		0 & \lambda
	\end{pmatrix} + \begin{pmatrix}
		\lambda & 0 \\
		1 & \lambda
	\end{pmatrix} \begin{pmatrix} 
		1 & 0 \\ 
		0 & \mu 
	\end{pmatrix} = \begin{pmatrix} 
		\lambda & 1 \\ 
		0 & \lambda \mu 
	\end{pmatrix} + \begin{pmatrix} 
		\lambda & 0 \\ 
		1 & \lambda \mu 
	\end{pmatrix} = \begin{pmatrix} 
		2 \lambda & 1 \\ 
		1 & 2 \lambda \mu 
	\end{pmatrix}.
$$

It has negative trace. To be negative definite, we only need it to have a positive determinant:

$$
	\det \bC = 4 \lambda ^2 \mu - 1 > 0 \impliedby \mu > \frac1{4 \lambda ^2}.
$$

Therefore, we take $\mu$ sufficiently large, and the proof is completed. If $\bA$ has a pair of complex eigenvalues, then $\bA = \bV \bA ^* \bV \inv$ where columns of $\bV$ are the real and imaginary part of a complex eigenvector, and 

$$
	\bA ^* = \begin{pmatrix}
		\alpha & \beta \\
		-\beta & \alpha
	\end{pmatrix}, \alpha < 0.
$$

We take $\bB ^* = \Id$ again, then $\bC ^* = \bA ^* + \bA ^{*\top} = 2 \alpha\,\Id$ is negative definite.

In fact, not only stability of the nonlinear system is implied by the ones of the linear system, the type of critical points to the planar system is also consistent with the type of critical points to the linearized system.

> [!Theorem]
> (Perron) Let $\bf \in C ^2$, $\bx _0$ be a critical point, and $\bA = \grad \bf (\bx _0)$ is nonsingular. If $\boldsymbol 0$ is a (stable/unstable) nodal/saddle/star/degenerate nodal/focal point of $\bv' (t) = \bA \bv (t)$, then $\bx _0$ is also a (stable/unstable) nodal/saddle/star/degenerate nodal/focal point of $\bu' (t) = \bf (\bu (t))$. 

Note that vortex is not included in the Perron's theorem. We haven't defined what does a "nodal point" of a critical point to a nonlinear system is. It can be roughly understood that it locally looks similar to a "nodal point" of a linear dynamical system. 

> [!Definition]
> Dynamical systems $\bu' (t) = \bf (\bu (t))$ in $R \subset \Rd$ and $\bv ' (t) = \bg (\bv (t))$ in $R' \subset \Rd$ is said to be equivalent, if and only if there exists a $C ^1$ bijection $\psi: R \to R'$ with $C ^1$ inverse, such that if $\bu$ is a solution to $\bu' (t) = \bf (\bu (t))$ then $\bv = \psi \circ \bu$ is a solution to $\bv ' (t) = \bg (\bv (t))$, and vice versa. In particular, if $\bx _0$ is a critical point of the first system, then $\psi (\bx _0)$ is a critical point of the second system. 
> 
> We say a critical point $\bx _0$ of a planar nonlinear system is a (stable/unstable) nodal/saddle/star/degenerate nodal/focal/vortex point if there exists a neighborhood $R$ of $\bx _0$ such that the corresponding ciritical point to an equivalent linear dynamical system is a (stable/unstable) nodal/saddle/star/degenerate nodal/focal/vortex point.







