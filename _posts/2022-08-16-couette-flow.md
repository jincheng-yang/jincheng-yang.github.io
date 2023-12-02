---
layout: post
title: "Couette flow"
date: 2022-08-16
use-math: true
comment: true
use-d3: true
---

<div style="display:none">
$
\newcommand{\cN}{\mathcal N}
\newcommand{\cA}{\mathcal A}
$
</div>

### Couette Frame

Let $(x, y) \in \T \times \R$. Couette flow refers to the shear flow $u _c (t, x, y) = y e _1$. If $u$ solves a transport-diffusion equation 

$$
    \pt u + b \cdot \grad u = \nu \La u + f,
$$

that is, $u$ is transported by some flow $b$ and diffuse at viscosity $\nu$, then we can make a change of variable $z = x - t y$, and

$$
    \tilde u (t, z, y) = u (t, x, y), \tilde b (t, z, y) = b (t, x, y) - u _c (t, x, y), \tilde f (t, z, y) = f (t, x, y).
$$

Then 

$$
\begin{align*}
    \pt u (t, x, y) &= \pfr{}t \tilde u (t, x - t y, y) = \pt \tilde u - y \ptil _z \tilde u, 
    \\
    \ptil _x u (t, x, y) &= \pfr{}x \tilde u (t, x - t y, y) = \ptil _z \tilde u,
    \\
    \ptil _y u (t, x, y) &= \pfr{}y \tilde u (t, x - t y, y) = -t \ptil _z \tilde u + \ptil _y \tilde u,
\end{align*}
$$

therefore 

$$
\begin{align*}
    (\pt + u _c \cdot \grad) u (t, x, y) &= \pt \tilde u (t, z, y),
    \\
    (\ptil _y + t \ptil _x) u (t, x, y) &= \ptil _y \tilde u (t, z, y).
\end{align*}
$$

Moreover, denote $\grad _L = (\ptil _z, \ptil _y - t \ptil _z)$ and $\La _L = \grad _L \cdot \grad _L = \ptil ^2 _z + (\ptil _y - t \ptil _z) ^2$, then $\grad u = \grad _L \tilde u$, $\La u = \La _L \tilde u$. Hence, $\tilde u$ solves the system 

$$
\begin{align*}
    \pt \tilde u + \tilde b \cdot \grad _L \tilde u = \nu \La _L \tilde u + \tilde f.
\end{align*}
$$

### Fourier transform

From now on, we drop the tildes. Suppose we adopt the Fourier transform $(z, y) \to (k, \eta)$, then 

$$
    \hat \grad _L = \begin{pmatrix}
        i k \\ i \eta - i t k
    \end{pmatrix} = i k \begin{pmatrix}
        1 \\ \hat \eta - t
    \end{pmatrix}, \qquad \hat \La _L = - k ^2 (1 + (\hat \eta - t) ^2) = - k ^2 \ang{t - \hat \eta} ^2.
$$

where $\hat \eta := \eta / k$ (we are interested in the non-zero mode $k \neq 0$).

### Inviscid Damping

Inviscid damping refers to the phenomenon that some sort of decay exists in the Couette frame albeit without viscosity. Consider the following inviscid equation 

$$
    \pt u = -\ptil _z ^2 (- \La _L) \inv u + f.
$$

At the first sight, one may think the right hand side seems to be a positive zeroth order Riesz transform of $u$, hence there should be some exponential growth. However, let $\cN$ be a Fourier multiplier with symbol $\hat \cN = \ang{t - \hat \eta}$, then 

$$
    \pt u = -\ptil _z ^2 (- \La _L) \inv u + f = \cN ^{-2} u + f.
$$

Let $\cA$ be a time-dependent Fourier multiplier defined as $\cA \at{t = 0} = \Id$, $\dot \cA = [\pt, \cA] = - 2 \cA \cN ^{-2}$, then

$$
    \pt \cA u = \dot \cA u + \cA \pt u = - 2 \cA \cN ^{-2} u + \cA \cN ^{-2} u + \cA f = - \cA \cN ^{-2} u + \cA f.
$$

This means 

$$
    \ddt \frac{\nor{\cA u} _{H ^s} ^2}2 + \nor{\cN ^{-1} \cA u} _{H ^s} ^2 \le (\cA f, \cA u) _{H ^s} \le \half \nor{\cN ^{-1} \cA u} _{H ^s} ^2 + \half \nor{\cN \cA f} _{H ^s} ^2.
$$

Moreover, note that 

$$
\begin{cases}
    \pt \hat \cA = - 2 \ang{t - \hat \eta} ^{-2} \hat \cA \\
    \hat \cA (0) = 1
\end{cases}
$$

which has a solution that is uniformly bounded in $\hat \eta$, so $\cA$ is a bounded multiplier from both above and below, hence 

$$
    \ddt {\nor{\cA u} _{H ^s} ^2} + \nor{\cN ^{-1} u} _{H ^s} ^2 \le C \nor{\cN f} _{H ^s} ^2.
$$

Hence 

$$
    \nor{u} _{H ^s} ^2 (t) + \int _0 ^t \nor{\cN \inv u} _{H ^s} ^2 (\tau) \d \tau \le C \nor{u _{in}} _{H ^s} ^2 + C \int _0 ^t \nor{\cN f} _{H ^s} ^2 (\tau) \d \tau.
$$

Note that $\hat \cN = \ang{t - \hat \eta} \le \ang{\hat \eta} \ang{t}$, so 

$$
    \nor{u} _{H ^s} ^2 (t) + \int _0 ^t \ang \tau ^{-2} \nor{u} _{H ^{s - 1}} ^2 (\tau) \d \tau \le C \nor{u _{in}} _{H ^s} ^2 + C \int _0 ^t \ang{\tau} ^2 \nor{f} _{H ^{s + 1}} ^2 (\tau) \d \tau.
$$

Here we used that for $\alpha \in \mathbb R$,

$$
    \ang t ^\alpha \nor{u} _{H ^{s - |\alpha|}} \le \nor{\cN ^\alpha u} _{H ^s} \le \ang t ^\alpha \nor{u} _{H ^{s + |\alpha|}}.
$$


<!-- $$
    \ddt {\nor{\cA u} _{H ^s} ^2} + \ang{t} ^{-2} \nor{u} _{H ^{s - 1}} ^2 \le C \nor{\cN f} _{H ^s} ^2 \le C \ang t ^2 \nor f _{H ^{s + 1}}.
$$

###### Algebraic Decay

Now, $\cN ^\half u$ solves the following system, 

$$
    \pt \cN ^\half u = -\ptil _z ^2 (- \La _L) \inv \cN ^\half u + \frac12 \cN ^{-\half} \dot \cN u + \cN ^\half f.
$$

Hence, 

$$
    \ddt {\nor{\cA \cN ^\half u} _{H ^s} ^2} + \nor{\cN ^{-\half} u} _{H ^s} ^2 \le C \nor{\cN ^\frac32 f} _{H ^s} ^2.
$$ -->


### Enhanced Dissipation

Consider the following equation 

$$
    \pt u = \nu \La _L u + f.
$$

The naive energy estimates shows the following estimate on the energy dissipation, 

$$
    \ddt \frac{\nor u _{H ^s} ^2}2 + \nu \nor{\grad _L u} _{H ^s} ^2 = (u, f) _{H ^s}.
$$

Now, denote $\hat \nu = k ^2 \nu$, then $-\nu \La _L = \hat \nu \cN ^2$, thus (with abuse of notation we regard $\hat \nu$ as a multiplier as well)

$$
    \pt u + \hat \nu \cN ^2 u = f.
$$

To control the enhanced dissipation, we separate the dissipation by

$$
    \pt u + \max \{\hat \nu \cN ^2, \hat \nu ^\frac13\} u = (\hat \nu ^\frac13 - \hat \nu \cN ^2) _+ u + f.
$$

Let $\cA$ be a time-dependent Fourier multiplier defined as $\cA \at{t = 0} = \Id$, and similar as before let $\dot \cA = [\pt, \cA] = - \cA (\hat \nu ^\frac13 - \hat \nu \cN ^2) _+$, then

$$
    \pt \cA u + \max \{\hat \nu \cN ^2, \hat \nu ^\frac13\} \cA u = \cA f.
$$

So 

$$
    \ddt \frac{\nor{\cA u} _{H ^s} ^2}2 + \nor{\hat \nu ^{\frac16} \cA u} _{H ^s} ^2 \le (\cA f, \cA u) _{H ^s} \le \half \nor{\hat \nu ^{\frac16} \cA u} _{H ^s} ^2 + \half \nor{\hat \nu ^{-\frac16} \cA f} _{H ^s} ^2
$$

Again, note that $(\hat \nu ^\frac13 - \hat \nu \cN ^2) _+$ is supported near $\abs{t - \hat \eta} < \hat \nu ^{-\frac13}$, which again makes $\cA$ uniformly bounded from both sides. Therefore, 

$$
    \ddt {\nor{\cA u} _{H ^s} ^2} + \nu ^\frac13 \nor{|\ptil _z| ^\frac13 u} _{H ^s} ^2 \le (\cA f, \cA u) _{H ^s} \le \nu ^{-\frac13} \nor{|\ptil _z| ^{-\frac13} f} _{H ^s} ^2
$$

Now $\nor{\abs{\ptil _z} ^\frac13 u} _{H ^s} ^2 \ge c \nor{\cA u} _{H ^s}$, so 

$$
    \nor{u} _{H ^s} ^2 (t) \le C \nor{u _{in}} _{H ^s} ^2 e ^{-c \nu ^\frac13 t} \int _0 ^t e ^{c \nu ^\frac13 \tau} \nu ^{-\frac13} \nor{f} _{H ^s} ^2 (\tau) \d \tau.
$$

Reference: C. Zhai and W. Zhao, “Stability Threshold of the Couette Flow for Navier–Stokes Boussinesq System with Large Richardson Number $\boldsymbol{\gamma}^{\boldsymbol{2}} \boldsymbol{\gt} \frac{\boldsymbol 1}{\boldsymbol 4}$,” SIAM J. Math. Anal., vol. 55, no. 2, pp. 1284–1318, Apr. 2023, doi: 10.1137/22M1495160.
[arXiv:2204.09662](https://arxiv.org/pdf/2204.09662.pdf)