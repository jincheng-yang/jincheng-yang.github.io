---
layout: general
title: M427J Differential Equations with Linear Algebra
outer-class: Teaching Assistant
use-math: true
---

Syllabus: See [Homepage](https://web.ma.utexas.edu/users/jmeth/DEFall19/DEFall19Syll52800.html) and [Calendar](https://web.ma.utexas.edu/users/jmeth/DEFall19/DELessons.html).

- Regular Class: MWF 10:00-11:00 am @ JGB 2.216
- Discussion Session: TTh 1:00-2:00 pm @ JGB 2.216
- Dr. Meth's Office Hour: MWF 11:05-11:55 @ RLM 9.144
- My Office Hour: W 12:00-2:00 pm @ RLM 11.130

Download sample solution to Braun Section 3.1, Question 4, 6 [here](sample-solution.pdf).

### Some Notations

#### Logic and Set Theory

* $\Rightarrow$ means **implies**. (Statement P) $\Rightarrow$ (Statement Q) means from statement P we can deduce Q, or we can say if P then Q.

* $\in$ means **belongs to** or inside. For an object $x$ and a set $A$, $x \in A$ means $x$ is an element of set $A$.

* $\subset$ and $\subseteq$ means **subset**. For two sets $A$ and $B$, $B \subset A$ or $B \subseteq A$ means $B$ is a subset of $A$, that is, every element of $B$ is an element of $A$, or we can write $x \in B \Rightarrow x \in A$.

* $\subsetneqq$ means **proper subset**. For two sets $A$ and $B$, $B \subsetneqq A$ means $B$ is a subset of $A$, but $B \neq A$.

* $\forall$ means **for all**. $\forall x \in A \dots$ means for all elements $x$ in the set $A$ we have $\dots$.

* $\exists$ means **there exists**. $\exists x \in A \dots$ means there exists an element $x$ in the set $A$ such that $\dots$.

* $f: A \to B$ means $f$ is a **function** with domain $A$ and target $B$.

#### Number Sets

* $\mathbb Z$ is the set of all **integers**.

* $\mathbb N$ is the set of all **natural numbers** (including 0).

* $\mathbb Q$ is the set of all **rational numbers**.

* $\mathbb R$ is the set of all **real numbers**.

* $\mathbb C$ is the set of all **complex numbers** (including real numbers).

#### Linear Algebra

* $\mathbb R ^n$ is the set of all $n$ dimensional **real vectors**.

* $\mathbb C ^n$ is the set of all $n$ dimensional **complex vectors**.

* $\mathcal{M} _{r \times c}$ is the set of all $r$ by $c$ **matrices**.

* $\mathcal{M} _{n}$ is the set of all $n$ by $n$ **matrices**.

* For a matrix $A$, $\mathrm{Ker} (A)$ or $\mathrm{Nul} (A)$ is the **Kernel** of $A$, that is the solutions to $A\boldsymbol{x}=\boldsymbol{0}$.

#### Function spaces

* $C ^0$, $C (\mathbb R)$, $C ^0 (\mathbb R)$, $C (\mathbb R, \mathbb R)$, $C ^0 (\mathbb R, \mathbb R)$ is the set of continuous functions from $\mathbb R$ to $\mathbb R$, that is, continuous real-valued functions.

* $C ^k$, $C ^k (\mathbb R)$, $C ^k (\mathbb R, \mathbb R)$ is the set of $k$ time continuously differentiable functions, that is, continuous functions whose first through $n$th derivatives are continuous.

* $C ^\infty$, $C ^\infty (\mathbb R)$, $C ^\infty (\mathbb R, \mathbb R)$ is the set of smooth functions, that is, any order of derivative is continuous.

* $C (\mathbb R, \mathbb R ^n)$, $C ^0 (\mathbb R, \mathbb R ^n)$ is the set of continuous functions from $\mathbb R$ to $\mathbb R ^n$, that is, continuous vector-valued functions.

* $C ^k (\mathbb R, \mathbb R ^n)$ is the set of $k$ time continuously differentiable vector-valued functions.

* $C ^\infty (\mathbb R, \mathbb R ^n)$ is the set of smooth vector-valued functions, that is, any order of derivative is continuous.

* $\mathcal{P} _m$, $\mathcal{P} _m[t]$ is the set of all polynomials of $t$ with real coefficients and degree less or equal than $m$.

* $\mathcal{P}$, $\mathcal{P}[t]$ is the set of all polynomials of $t$.

#### Differential Calculus

If $y(t)$ is a differentiable function of $t$, we write

$$\dot y = y' = \frac{\mathrm{d}y}{\mathrm{d}t}$$

to represent derivative of $y$ with respect to $t$.

* If $L$ is a linear differential operator, $V _L$ is the set of solutions to $L[y] = 0$.

* If $L=\frac{\mathrm d}{\mathrm dt}-A$, so the equation is $\dot{\boldsymbol{x}} = A \boldsymbol{x}$, $V _A$ is the set of solutions to $\dot{\boldsymbol{x}} = A \boldsymbol{x}$.
