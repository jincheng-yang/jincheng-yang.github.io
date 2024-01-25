---
layout: note
title: "Lecture 6: Second order linear equations"
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

We consider a second order linear equation is of the following form: 

$$
	p _0 (t) u'' (t) + p _1 (t) u' (t) + p _2 (t) u (t) = p _3 (t),
$$

where $p _0, p _1, p _2, p _3$ are given. If $p _0 (t) \neq 0$ in some interval, we can divide by $p _0$ and write it in *normal form*

$$
	u'' (t) + p (t) u ' (t) + q (t) u (t) = r (t).
$$

If $p _3 = 0$ or $r \equiv 0$, ODE is called homogeneous, otherwise it is called inhomogeneous. When $p _0 (t _0) = 0$ at some $t _0$, we say that the equation is *singular* at $t _0$, otherwise the equation is *regular* at $t _0$. 

## Initial value problem

Let $I \subset \R$ be a closed interval, and suppose $p _i: I \to \R$ are continuous for $i = 0, 1, 2, 3$, with $p _0 (t) \neq 0$ for any $t _0 \in I$. In other words, suppose the equation is regular in $I$. Then we can transform the equation into the normal form. An initial value problem (IVP) for second order linear equation is of the following form: 

$$
\begin{cases}
	u'' (t) + p (t) u ' (t) + q (t) u (t) = r (t) \\
	u (t _0) = x _0 \\
	u' (t _0) = x _0' 
\end{cases}
$$

Here $x _0, x' _0 \in \R$ are two real numbers. ($x _0'$ is just a notation for a number, not the derivative of anything.)

> [!Theorem]
> If $p, q, r \in C (I)$ then there exists a unique $C ^2$ solution to (IVP).

Proof. We transform it into a two dimensional dynamic system: let 

$$
	\bu (t) = \begin{pmatrix}
		u (t) \\
		u' (t)
	\end{pmatrix}, \bx _0 = \begin{pmatrix}
		x _0 \\
		x' _0 
	\end{pmatrix} 
$$

then 

$$
	\bu' (t) = \begin{pmatrix}
		u' (t) \\
		u'' (t)
	\end{pmatrix} = \begin{pmatrix}
		u' (t) \\
		r (t) - p (t) u ' (t) - q (t) u (t)
	\end{pmatrix} = \bf (t, \bu (t)),
$$

where $\bf (t, \bx) = (x _2, r (t) - p (t) x _2 - q (t) x _1) ^\top$ and $\bx = (x _1, x _2)$. Moreover, 

$$
\bu (t _0) = \begin{pmatrix}
	u (t _0) \\
	u (t _0)
\end{pmatrix} = \begin{pmatrix}
	x _0\\
	x' _0
\end{pmatrix} = \bx _0 \in \R ^2.
$$

We can verify that $\bf$ is globally Lipschitz in $\bx$. The initial value problem for $\bu$ admits a unique $C ^1$ solution. Therefore IVP for $u$ admits a unique $C ^2$ solution. 

> [!Corollary]
> Suppose $r (t) = 0$. We say two functions are linearly dependent if one is a scalar multiple of the other. Two solutions $u _1, u _2$ to the ODE
> 
> $$
> u'' (t) + p (t) u ' (t) + q (t) u (t) = 0
> $$
> 
> are linearly dependent if and only if 
> 
> $$\begin{pmatrix}u _1 (t _0) \\ u' _1 (t _0)\end{pmatrix} \text{  and  } \begin{pmatrix}u _2 (t _0) \\ u' _2 (t _0)\end{pmatrix}$$ 
> 
> are linearly dependent.

Proof. If $u _1 (t _0) = c u _2 (t _0)$, $u _1' (t _0) = c u _2' (t _0)$, then $u _1$ and $c u _2$ are solutions to the same IVP, hence they are identical, and $u _1 = c u _2$ implies they are dependent solutions. The other direction is trivial.
## Linear structure of solution set

By the linearity of the equation, the IVP can be decomposed as follows. Consider the following three IVPs: 

$$
\begin{cases}
	\phi _1'' (t) + p (t) \phi _1' (t) + q (t) \phi _1 (t) = 0 \\
	\phi _1 (t _0) = 1 \\
	\phi _1' (t _0) = 0 
\end{cases}
$$


$$
\begin{cases}
	\phi _2'' (t) + p (t) \phi _2' (t) + q (t) \phi _2 (t) = 0 \\
	\phi _2 (t _0) = 0 \\
	\phi _2' (t _0) = 1 
\end{cases}
$$

$$
\begin{cases}
	\phi _r'' (t) + p (t) \phi _r' (t) + q (t) \phi _r (t) = r (t) \\
	\phi _r (t _0) = 0 \\
	\phi _r' (t _0) = 0 
\end{cases}
$$

We can verify that $u (t) = x _0 \phi _1 (t) + x _0' \phi _2 (t) + \phi _r (t)$ is a solution to the original IVP. $\phi _1$ and $\phi _2$ are called **fundamental solutions**.

We usually studies ODE first then IVP, but this time let's return to the IVP. 

> [!Theorem] 
> Let $u _p$ be a solution to the ODE
> 
> $$
> u'' (t) + p (t) u ' (t) + q (t) u (t) = r (t)
> $$
> 
> $u _1, u _2$ be two solutions to the *reduced* ODE
> 
> $$
> u'' (t) + p (t) u ' (t) + q (t) u (t) = r (t)
> $$
> 
> Then for any $c _1, c _2 \in \R$, 
> 
> $$u (t) = c _1 u _1 (t) + c _2 u _2 (t) + u _p (t)$$ 
> 
> is a solution to the ODE. Moreover, if $u _1$ and $u _2$ are independent solutions: neither is a multiple of the other, then any solution is of this form with some unique pair $c _1, c _2 \in \R$.

Proof. $u$ is a solution can be verified directly. We pick any $t _0 \in I$, then by existence and uniqueness theorem, 

$$
\begin{align*}
	u &= u (t _0) \phi _1 + u' (t _0) \phi _2 + \phi _r \\
	u _1 &= u _1 (t _0) \phi _1 + u _1' (t _0) \phi _2 \\
	u _2 &= u _2 (t _0) \phi _1 + u _2' (t _0) \phi _2 \\
	u _p &= u _p (t _0) \phi _1 + u _p' (t _0) \phi _2 + \phi _r \\
\end{align*}
$$

Then, $u = c _1 u _1 + c _2 u _2 + u _p$ for some $c _1, c _2$ if and only if 

$$
\begin{align*}
	u (t _0) - u _p (t _0) = c _1 u _1 (t _0) + c _2 u _2 (t _0) \\
	u' (t _0) - u _p' (t _0) = c _1 u _1' (t _0) + c _2 u _2' (t _0)
\end{align*}
$$

as a linear system of $c _1, c _2$ has a unique solution. This holds if and only if the solution matrix (called **Wronskian** matrix)

$$
	\boldsymbol W (u _1, u _2; t _0) := \begin{pmatrix}
		u _1 (t _0) & u _2 (t _0) \\
		u _1' (t _0) & u _2' (t _0)
	\end{pmatrix}
$$

is nonsingular. It is singular if and only if one column is the multiple of the other column, which would imply $u _1$ and $u _2$ are dependent solutions.  Contrariwise, If $u _1, u _2$ are independent solutions, then the Wronskian matrix is never singular, and thus a pair of constants $c _1, c _2$ can be uniquely determined. 