---
layout: post
title: "Vector Calculus"
date: 2020-02-04
comments: true
use-math: true
hide: true
---

### Notation

$\newcommand{\tensor}{\otimes}$
$\newcommand{\grad}{\nabla}$
$\newcommand{\u}{\boldsymbol u}$
$\newcommand{\v}{\boldsymbol v}$
$\newcommand{\A}{\boldsymbol A}$
$\newcommand{\a}{\boldsymbol a}$
$\newcommand{\B}{\boldsymbol B}$
$\newcommand{\R}{\mathbb R}$
$\newcommand{\Tr}{\operatorname{Tr}}$
$\newcommand{\curl}{\operatorname{curl}}$
$\renewcommand{\div}{\operatorname{div}}$
$\newcommand{\ptil}[1]{\partial _{x _#1}}$
We use $\u$, $\v$ to indicate vector fields in $\R ^3$; $f$, $g$ indicate scalar fields in $\R ^3$; $\A$, $\B$ indicate 2-tensor fields (matrices) in $\R ^3$.

* **Gradient**: $\grad f = (\ptil1 f, \ptil2 f, \ptil3 f) ^\top$.
* **Jacobian**: $\grad \u = (\ptil1 \u, \ptil2 \u, \ptil3 \u) = (\grad u _1, \grad u _2, \grad u _3) ^\top$.
* **Directional Derivative**: $\v \cdot \grad \u = v _1 \ptil1 \u + v _2 \ptil2 \u + v _3 \ptil3 \u = (\grad \u) \v$.
* **Tensor product**: $\A = \u \tensor \v = \u \v ^\top = (v _1 \u, v _2 \u, v _3 \u)$ is defined as $\A _{ij} = \u _i \v _j$.
* **Colon product** between two matrices are $\A : \B = \sum _{i, j} \A _{ij} \B _{ji} = \Tr (\A\B)$.
* **Divergence** of a matrix: $\div \A = (\div \a _1, \div \a _2, \div \a _3) ^\top$ where $\a _1, \a _2, \a _3$ are column vectors of $\A$.

### Formulae

#### Algebra 

$$
    (\u \tensor \v) \A = \u _i \v _j \A _{jk} = \u \v ^\top \A.
$$

$$
    (\u \tensor \v) : \A = \u _j \v _i \A _{ij} = \v ^\top \A \u.
$$

#### Leibniz Rules

$$
    \grad (f \u) = f \grad \u + \u \tensor \grad f
$$

$$
    \div (f \u) = f \div \u + \u \cdot \grad f
$$

$$
    \curl (f \u) = f \curl \u + \grad f \times \u
$$

$$
    \div (\u \tensor \v) = (\div \u) \v + \u \cdot \grad \v
$$

$$
    \div (f \A) = f \div \A + \A \grad f
$$

$$
    \div (\A \u) = \u \cdot \div \A + (\A \cdot \grad) \cdot \u
$$

(here $\A \cdot \grad = (\a _1 \cdot \grad, \a _2 \cdot \grad, \a _3 \cdot \grad)$)