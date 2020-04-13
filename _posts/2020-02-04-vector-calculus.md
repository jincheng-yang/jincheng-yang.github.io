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
We use $\u$, $\v$ to indicate vector fields in $\R ^3$; $f$, $g$ indicate scalar fields in $\R ^3$; $\A$, $\B$ indicate 2-tensor fields (matrices) in $\R ^3$.

* **Tensor product**: $\A = \u \tensor \v$ is defined as $\A _{ij} = \u _i \v _j$.
* **Colon product** between two matrices are $\A : \B = \sum _{i, j} \A _{ij} \B _{ji} = \Tr (\A\B)$.
* **Divergence** of a matrix: $\div \A = (\div \a _1 \, \div \a _2 \, \div \a _3)$ where $\a _1, \a _2, \a _3$ are column vectors of $\A$.

### Formulae

#### Leibniz Rules

$$
    \div (\u \tensor \v) = (\div \u) \v + \u \cdot \grad \v
$$

$$
    \div (f \A) = f \div \A + \A \grad f
$$

$$
    \curl (f \u) = f \curl \u + \grad f \times \u
$$


