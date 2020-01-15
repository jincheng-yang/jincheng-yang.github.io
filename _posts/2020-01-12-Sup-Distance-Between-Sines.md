---
layout: post
title: "Sup Distance Between Sines"
date: 2020-01-12
comments: true
use-math: true
tag: mini-math
---

### Proposition
Let $\alpha > \beta > 0$ be two distinct real numbers. Then
\begin{align}
    \sup _{x \in \mathbb R} |\sin (\alpha x) - \sin (\beta x)| \ge \sqrt 3.
\end{align}

#### Proof.

\begin{align}
    \notag
    \sin (\alpha x) - \sin (\beta x) &= 2 \cos \left(
        \frac{\alpha + \beta}2 x
    \right) \sin \left(
        \frac{\alpha - \beta}2 x
    \right).
\end{align}

Whenever $x = \dfrac{2 k \pi}{\alpha + \beta}$, $\left|\cos \left(
        \dfrac{\alpha + \beta}2 x
    \right)\right| = 1$, so

\begin{align}
    \notag
    \sin (\alpha x) - \sin (\beta x) &= \pm 2 \sin \left(
        \frac{\alpha - \beta}2 \frac{2 k \pi}{\alpha + \beta}
    \right) \\\
    \notag
    &= \pm 2 \sin \left(
        \frac{\alpha - \beta}{\alpha + \beta} k \pi
    \right)
\end{align}

Let $\gamma = \dfrac{\alpha - \beta}{\alpha + \beta}$. If $\gamma$ is an irrational number, then $\sup _k \sin (\gamma k \pi) = 1$ (see Stein, Fourier Analysis for example). If $\gamma$ is a rational number, then the set $\lbrace\gamma k\rbrace$ mod 1 will be $\lbrace 0, \frac1q, \frac2q, \dots, \frac{q-1}q \rbrace$ for some $q$, which must contain an element in $[\frac13, \frac23]$, so $\lvert\sin (\gamma k \pi)\rvert \ge \frac{\sqrt 3}2$ for some $k$.

#### Comment.

$\sqrt 3$ is not optimal. By a rescaling in $x$, we may assume that $\beta = 1$. $\gamma$ will be exactly $\frac13$ when $\alpha = 2$, and $\gamma$ will be $\frac23$ when $\alpha = 5$. In the case $\alpha = 2$, 
\begin{align}
    \notag
    f (x) := \sin (2 x) - \sin (x)
\end{align}
is smooth and periodic over $\mathbb R$. To find its critical points, set
\begin{align}
    \notag
    f' (x) = 2 \cos (2 x) - \cos (x) &= 0. \\\
    \notag
    4 \cos (x) ^2 - 2 - \cos (x) &= 0. \\\
    \notag
    \cos (x) &= \frac{1 \pm \sqrt{33}}8. 
\end{align}
Because $f$ is odd, it suffices to consider $x \in (0, \pi)$. When
\begin{align}
    \notag
    x &= \cos ^{-1} \left(
        \frac{1 + \sqrt{33}}8
    \right) \\\
    \sin (x) &= \sqrt{1 - \cos ^2 (x)} \\\
    &= \sqrt{1 - \frac{(1 + \sqrt{33})^2}{64}} \\\
    &= \sqrt{1 - \frac{34 + 2 \sqrt{33}}{64}} \\\
    &= \frac18 \sqrt{30 - 2 \sqrt{33}} \\\
    f (x) &= 2 \sin (x) \cos (x) - \sin (x) \\\
    &= \left(\frac{1 + \sqrt{33}}4 - 1\right) \frac18 \sqrt{30 - 2 \sqrt{33}}.
\end{align}