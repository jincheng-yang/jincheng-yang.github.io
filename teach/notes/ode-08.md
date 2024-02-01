---
layout: note
title: "Lecture 8: linear autonomous dynamic system"
use-math: true
---

# Linear differential system: IVP and fundamental matrix

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
\newcommand{\be}{\boldsymbol e}
\newcommand{\bphi}{\boldsymbol \phi}
\newcommand{\bA}{\boldsymbol A}
$$

A homogeneous linear differential system is of the following form: $\bu: \R \to \R ^d$ is an unknown vector-valued function, and $\bA: \R \to \mm _n (\R)$ is an $(n \times n)$-square matrix-valued function. 

$$
	\bu' (t) = \bA (t) \bu (t)
$$

If $\bA$ is globally bounded and continuous, then by continuity theorem and Grönwall lemma, global solution exists for any given initial value $\bu (t _0) = \bx _0$. In particular, if $\bA (t) \equiv \bA$ is time-independent, we say the linear system is autonomous. We assume initial time $t _0 = 0$ for simplicity. We study this case in this lecture. Note that zero solution $\bu \equiv \boldsymbol{0}$ is, in particular, a solution. 

Same as before, we can define **fundamental solutions** $\boldsymbol \phi _1, \dots \boldsymbol \phi _n$ to be the unique solution to the following IVP:

$$
	\boldsymbol \phi _i' (t) = \bA \boldsymbol \phi _i (t), \qquad \boldsymbol \phi _i (0) = \be _i
$$

Here $\be _i$ is the $i$-th basis vector of $\Rd$.

It is a homogeneous linear system, so the linear combination of fundamental solutions are solutions. Indeed, we can check the solution to the IVP


$$
	\bu' (t) = \bA \bu (t), \qquad \bu (t _0) = \bx _0
$$

is $\bu (t) = \sum _i x ^0 _i \bphi _i (t)$, where $\bx _0 = (x _1 ^0, \dots, x _d ^0) ^\top$. The following square matrix is called the **fundamental matrix**:

$$
	\Phi (t) = \begin{pmatrix}
		\bphi _1 (t) & \dots & \bphi _d (t)
	\end{pmatrix}
$$

Then it is easy to write $\bu (t) = \Phi (t) \bu (0)$.

> [!Theorem]
> If $\bu _1, \dots, \bu _d$ are $d$ independent solutions to the dynamic system, then the general solution of this dynamic system is 
> 
> $$
> 	\bu (t) = c _1 \bu _1 (t) + \dots + c _d \bu _d (t).
> $$

Proof. First, we claim that $\bu _1 (0), \dots, \bu _d (0)$ are linearly independent. Indeed, if there exists $c _1, \dots, c _d$ such that $\sum _i c _i \bu _i (0) = 0$, then $\sum _i c _i \bu _i (t)$ is a solution with zero initial value. By uniqueness, it has to be the zero solution, so $\sum _i c _i \bu _i (t) = 0$ for all $t \in \R$. Linearly independency of $\bu _i$'s implies $c _i = 0$ for all $i$.

Denote the solution matrix 

$$
	\bX (t) = \begin{pmatrix}
		\bu _1 (t) & \dots & \bu _d (t)
	\end{pmatrix}
$$

Since each $\bu _i$ is a solution, $\bu _i (t) = \Phi (t) \bu _i (0)$. Therefore $\bX (t) = \Phi (t) \bX (0)$. Since $\bX (0)$ is nonsingular (we verified its columns are linearly independent), we know $\Phi (t) = \bX (t) \bX (0) \inv$. Therefore 

$$
	\bu (t) = \Phi (t) \bu (0) = \bX (t) \bX (0) \inv \bu (0) = \bX (t) \boldsymbol c
$$

by defining $\boldsymbol c = \bX (0) \inv \bu (0)$. Thus $\bu (t) = \sum _i c _i \bu _i (t)$.

## How to solve

To solve the linear system, it is easier to start with something simpler. We first study the following simple situation.

> [!Example]
> If $\bA = \diag (\lambda _1, \dots, \lambda _n)$ is a diagonal matrix, then the fundamental solutions are
> 
> $$
> 	\bphi _i (t) = e ^{\lambda _i t} \be _i
> $$

From the equation, we can see that indeed, when the coefficient matrix $\bA$ is diagonal, the system is decoupled: each component of the unknown vector-valued function solves its own linear differential equation. 

Similarly, we also notice that if $(\lambda _i, \bv _i)$ is an eigenvalue-eigenvector pair of $\bA$, then 

$$
	\bu _i (t) = e ^{\lambda _i t} \bv _i
$$

is a solution. Therefore 

> [!Proposition]
> If $\bA$ has $n$ real eigenvalue $\lambda _i$ (repetition is allowed) and $n$ independent eigenvectors, then the general solution is 
> 
> $$
> 	\bu (t) = c _1 e ^{\lambda _1 t} \bv _1 + \dots + c _d e ^{\lambda _d t} \bv _d.
> $$

But a matrix does not always have independent eigenvectors. Indeed, using a nonsingular matrix, we can change $\bA$ into its Jordan normal form. 

The Jordan form refers to the following type of matrix $\bJ$: 

$$
	\bJ = \diag (\bJ _1, \dots, \bJ _I), \qquad \bJ _i = \diag (\bJ _{i1}, \dots, \bJ _{iJ _i}) \quad 1 \le i \le I,
$$

and 

$$
	\bJ _{ij} = \begin{pmatrix}
		\lambda _i & 1 & 0 & 0 & \dots & 0 & 0 \\
		0 & \lambda _i & 1 & 0 & \dots & 0 & 0 \\
		0 & 0 & \lambda _i & 1 & \dots & 0 & 0 \\
		0 & 0 & 0 & \lambda _i & \dots & 0 & 0 \\
		\vdots & \vdots & \vdots & \vdots & & \vdots & \vdots \\
		0 & 0 & 0 & 0 & \dots & \lambda _i & 1 \\
		0 & 0 & 0 & 0 & \dots & 0 & \lambda _i
	\end{pmatrix} _{d _{ij} \times d _{ij}}
$$

One such $\bJ _{i j}$ is called a **Jordan block**, and $\bJ _i$ is a block diagonal matrix formed by Jordan block whose diagonal is occupied by $\lambda _i$. Finally, $\bJ$ is yet another block diagonal matrix, whose $i$-th block is $\bJ _i$. Also note that if $d _{i j} = 1$ then $\bJ _{ij} = (\lambda _i)$ is just a 1 by 1 matrix.

We know that every matrix is similar to its Jordan form (which is possibly complex). That is, we can find a nonsingular matrix $\bV$ such that  

$$
	\bJ = \bV \inv \bA \bV.
$$

The columns of $\bV$ are eigenvectors and generalized eigenvectors. If we label the columns by $i j k$ according to Jordan blocks, where $1 \le i \le I, 1 \le j \le J _i, 1 \le k \le d _{ij}$, then the $ijk$-th column $\bv _{i j k}$ satisfies

$$
	\bA \bv _{i j k} = \begin{cases} 
		\lambda _i \bv _{i j k} & k = 1 \\
		\lambda _i \bv _{i j k} + \bv _{i j (k - 1)} & k > 1
	\end{cases}
$$

Therefore $\bv _{i j 1}$ is an eigenvector and $\bv _{i j k}$ for $k > 1$ is a generalized eigenvector.

If $\bw$ satisfy $\bw' (t) = \bJ \bw (t)$, then $\bu (t) = \bV \bw (t)$ satisfy 

$$
	\bu' (t) = \bV \bw ' (t) = \bV \bJ \bw (t) = \bV \bJ \bV \inv \bu (t) = \bA \bu (t).
$$

Therefore, it suffices to solve the easier equation $\bw' (t) = \bJ \bw (t)$ for a Jordan matrix $\bJ$. 

$\bJ$ is a block matrix. If we can solve $\bw _{ij} ' (t) = \bJ _{i j} \bw _{i j} (t)$ then 

$$
	\tilde \bw _{i j} (t) = \begin{pmatrix} 0 \\ \vdots \\ 0 \\ \bw _{i j} \\ \vdots \\ 0 \end{pmatrix}
$$

solves $\tilde \bw _{i j} ' (t) = \bJ \tilde \bw _{i j}' (t)$. 

We have now reduced the problem to solving the following equation in a Jordan block:

$$
	\bw _{ij} ' (t) = \bJ _{i j} \bw _{i j} (t)
$$

> [!Lemma]
> Denote $\lambda = \lambda _i$, $d = d _{i j}$. The fundamental matrix to the above ODE is 
> 
> $$
> 	\Phi (t) = e ^{\lambda t} \begin{pmatrix} 
> 	1 & t & t ^2/2! & t ^3 / 3! & \dots & t ^{d-2}/(d-2)! & t ^{d-1}/(d-1)! \\
> 	0 & 1 & t & t ^2/2!  & \dots & t ^{d-3}/(d-3)! & t ^{d-2}/(d-2)! \\
> 	0 & 0 & 1 & t & \dots & t ^{d-4}/(d-4)! & t ^{d-3}/(d-3)! \\
> 	\vdots & \vdots & \vdots & \vdots & & \vdots & \vdots \\
> 	0 & 0 & 0 & 0 & \dots & 1 & t \\
> 	0 & 0 & 0 & 0 & \dots & 0 & 1
> 	\end{pmatrix}
> $$

Proof. For simplicity denote $\bw = \bw _{i j}$. Then the above system is written as 

$$
\begin{align*}
	w _1' (t) &= \lambda w _1 (t) + w _2 (t) \\
	w _2' (t) &= \lambda w _2 (t) + w _3 (t) \\
	w _3' (t) &= \lambda w _3 (t) + w _4 (t) \\
	&\dots \\
	w _{d - 1}' (t) &= \lambda w _{d - 1} (t) + w _d (t) \\
	w _d' (t) &= \lambda w _d (t) \\
\end{align*}
$$

They are all first order linear equations. Integrating factor for them is all $\mu (t) = \exp (-\lambda t)$. So 

$$
	(\mu (t) w _{i} (t))' = (\mu (t) w _{i + 1} (t)),
$$

with $\mu (t) w _{d + 1} (t) := 0$. For the $j$-th fundamental solution, $w (0) = \be _j$ , so $w _{i} (0) = 0$ for $i \neq j$ and $w _j (0) = 1$.  By the above induction: 

$$
\begin{align*}
	\mu (t) w _d (t) &= 0 \\ 
	\mu (t) w _{d - 1} (t) &= 0 \\
	 \vdots\\
	 \mu (t) w _j (t) &= 1 \\
	 \mu (t) w _{j - 1} &= t \\
	 \mu (t) w _{j - 2} (t) &= \frac{t ^2}2 \\
	 \vdots \\
	 \mu (t) w _1 (t) &= \frac{t ^{j-1}}{(j-1)!}.
\end{align*}
$$

This is the $j$-th column of the fundamental matrix without $e ^{\lambda t}$.

To summarize, adding back the subscripts, we get the fundamental solutions to $\bw' (t) = \bJ \bw (t)$:

$$
	\bphi _{i j k} (t) = e ^{\lambda _i t} \left(
		\be _{i j k} + t \be _{i j (k - 1)} + \frac{t ^2}2 \be _{i j (k - 2)} + \dots + \frac{t ^{j - 1}}{(j - 1)!} \be_{i j (k - 1)}
	\right).
$$

Correspondingly, we get a solution $\bu _{i j k}$ by multiplying $\bV$: 

$$
	\bu _{i j k} = \bV \bphi _{i j k} = e ^{\lambda _i t} \left(
		\bv _{i j k} + t \bv _{i j (k - 1)} + \frac{t ^2}2 \bv _{i j (k - 2)} + \dots + \frac{t ^{j - 1}}{(j - 1)!} \bv_{i j (k - 1)}
	\right).
$$

It is however, possibly complex-valued. In this case, we may take its real part and imaginary parts.

> [!Proposition]
> Given a matrix $\bA$, we follow the procedure beneath to find the solutions:
> **Step 1**. Find distinct eigenvalues $\lambda _i$ by solving $\det (\lambda \Id - \bA) = 0$. Its multiplicity is $l _i$ (this is called algebraic multiplicity).
> **Step 2**. For each eigenvalue $\lambda _i$, find independent eigenvectors $\bv _{ij1}$ by solving $(\bA - \lambda \Id) \bv _{i j 1} = 0$, $j = 1, \dots, J _i$. ($J _i$ is called geometric multiplicity)
> **Step 3**. For each eigenvector $\bv _{i j 1}$, find independent generalized eigenvectors $\bv _{ijk}$ by solving $(\bA - \lambda \Id) \bv _{i j k} = \bv _{i j (k - 1)}$, $k = 2, 3, \dots, d _{i j}$, iteratively, until no more can be found.
> **Step 4**. The general complex-valued solution of is
> 
> $$
> 	\bu (t) = \sum _{i = 1} ^I \sum _{j = 1} ^{J _i} \sum _{k = 1} ^{d _{i j}} c _{i j k} \bu _{i j k}, \qquad c _{i j k} \in \mathbb C.
> $$ 
> 
> where 
> 
> $$
> 	\bu _{i j k} = e ^{\lambda _i t} \left(
> 	\bv _{i j k} + t \bv _{i j (k - 1)} + \frac{t ^2}2 \bv _{i j (k - 2)} + 
> 	\dots + \frac{t ^{j - 1}}{(j - 1)!} \bv_{i j (k - 1)}
> 	\right).
> $$
> 
> **Step 5**. Take real and imaginary parts if necessary.

