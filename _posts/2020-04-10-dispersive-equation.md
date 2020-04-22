---
layout: post
title: "Dispersive Equation"
date: 2020-04-10
comments: true
use-math: true
---

### Introduction

Consider the following evolution equation for $u (t, x)$,

\begin{align}
    \label{disp-eqn}
    \pt u = M [u], \qquad u \at{t=0} = u _0.
\end{align}

Here $M$ is a multiplier operator with symbol $i\lambda$, that is

\begin{align\*}
    \widehat{M [f]} (\xi) = i \lambda (\xi) \hat f (\xi).
\end{align\*}

We can solve \eqref{disp-eqn} by the means of Fourier transform in the $x$ variable.

\begin{align\*}
    \hat u _t (t, \xi) &= i \lambda (\xi) \hat u (t, \xi), \\\
    \hat u (t, \xi) &= e ^{i \lambda (\xi) t} \hat u _0 (\xi), \\\
    u (t, x) &= \mathcal F ^{-1} \set{e ^{i \lambda t} \hat u _0} (x).
\end{align\*}

What does this mean? 
Take a Fourier mode $u _0 (x) = e ^{i \xi _0 x}$, 
then $\hat u _0 (\xi) = \delta _0 (\xi - \xi _0)$. 

\begin{align\*}
    \hat u (t, \xi) &= e ^{i \lambda (\xi _0) t} \delta _0 (\xi - \xi _0), \\\
    u (t, x) &= e ^{i \lambda (\xi _0) t} e ^{i \xi _0 x} \\\
    &= e ^{i \xi _0 (x - c (\xi _0) t)} \\\
    &= u _0 (x - c (\xi _0) t).
\end{align\*}

where $c (\xi _0) = \lambda (\xi _0) / \xi _0$ is called the phase velocity for the angular wavenumber $\xi _0$. 
This means each Fourier mode is a travelling wave solutions with different travelling speed.
This explains the word **dispersive**.

We will not expect a decay in $L ^2$, because

> **Lemma** *(Energy Conservation)*.
\begin{align\*}
    \dfr{}{t} \nor{u (t)} _{L ^2} = 0.
\end{align\*}

#### Proof.

\begin{align\*}
    \dfr{}{t}  \nor{u (t)} _{L ^2} ^2 
    &= \dfr{}{t}  \nor{\hat u (t)\} _{L ^2} ^2 \\\
    &= 2 \ang{\pt \hat u, \hat u} \\\
    &= 2 \ang{i \lambda \hat u, \hat u} \\\
    &= 2 i \int _{\R} \lambda (\xi) |\hat u (t, \xi)| ^2 \dx
\end{align\*}

is purely imaginary, hence zero. 

However, we expect a decay in $L ^\infty$ if the initial value has enouh regularity, because different frequencies are spreading out.

### Van der Corput Lemma

We review the following lemma in oscillatory integrals. $\newcommand{\ilp}{\{i \lambda \phi\}}$

> **Lemma** *(Van der Corput)*. *Let*
>
\begin{align\*}
    I (\lambda) = \int _a ^b e ^{i \lambda \phi (\xi)} \d \xi,
\end{align\*}
> *then*
>
> 1. $\abs{\phi'} > 1$ and $\phi'$ is monotonic $\Rightarrow I (\lambda) = O(\lambda ^{-1})$.
> 2. $\abs{\phi ^{(k)}} > 1 \Rightarrow I (\lambda) = O _k(\lambda ^{-\frac1k})$ for $k \ge 2$.
> 
> *with constant independent on $a$ and $b$.*

#### Proof.

1. **When $k = 1$**,

    \begin{align\*}
        I (\lambda) &= \int _a ^b \frac1{i \lambda \phi \'(\xi)} (i \lambda \phi \'(\xi)) e ^{i \lambda \phi (\xi)} \d \xi \\\
        &= \frac1\lambda \int _a ^b \bkt{e ^{i \lambda \phi (\xi)}}\' \frac1{i\phi\'} \d \xi \\\
        &= -\frac1\lambda \int _a ^b e ^\ilp \pthf1{i\phi\'}\' \dx + \frac1\lambda \bkt{e ^\ilp \frac{1}{i\phi'}} _a ^b.
    \end{align\*}

    The second is bounded by $\frac2\lambda$, and the first integral is

    \begin{align\*}
        -\int _a ^b e ^\ilp \dfr{}{x} \pthf{1}{i\phi'} \dx \le \int _a ^b \abs{\dfr{}{x} \pthf{1}{\phi'}} \d x = \abs{\frac1{\phi'(b)} - \frac1{\phi'(a)}} \le 1.
    \end{align\*}

    Therefore $I (\lambda) \le \frac3\lambda$. 

2. **When $k = 2$**,

    Since $|\phi''| > 1$, 
    either $|\phi'|$ has fixed sign and obtain absolute minimum at $c = a$ or $b$, 
    or $\phi$ has a unique critical point $c \in [a, b]$. 
    In both case $\phi'$ is monotonic. 

    Integrate $I (\lambda)$ as 

    \begin{align\*}
        I (\lambda) = \int _a ^{c - \delta} e ^\ilp \dx
            + \int _{c - \delta} ^{c + \delta} e ^\ilp \dx
            + \int _{c + \delta} ^b e ^\ilp \dx
    \end{align\*}

    with $\delta$ to be chosen.

    Since $\abs{\phi''} > 1$, $\abs{\phi'} > \delta$ in $[a, c - \delta]$. So

    \begin{align\*}
        \int _a ^{c - \delta} e ^\ilp \dx = \int _a ^{c - \delta} e ^{i (\lambda \delta) \frac\phi\delta} \dx \le c _k (\lambda \delta) ^{-1}.
    \end{align\*}

    Similarly $\int _{c + \delta} ^b \le c _k (\lambda \delta) ^{-1}$. For the middle one, integrant has modulus 1, so integral is bounded by $2\delta$. So

    \begin{align\*}
        I (\lambda) \le c _k 2 (\lambda \delta) ^{-1} + 2 \delta \lesssim \lambda ^{-\frac12}
    \end{align\*}

    by choosing $\delta = \lambda ^{-\frac12}$. 

3. **When $k = 3$**,

    Similarly, $I (\lambda) \lesssim (\lambda \delta)^{-\frac12} + \delta \lesssim \lambda ^{-\frac13}$ by choosing $\delta = \lambda ^{-\frac13}$, etc.

### Dispersive Decay Estimate

The solution $u (t, x)$ equals to the following oscillatory integral by Fourier inverse transform,
\begin{align\*}
    u (t, x) &= \mathcal F ^{-1} \set{e ^{i \lambda t} \hat u _0} (x) \\\
    &= \int _\R e ^{i x \xi} e ^{i \lambda (\xi) t} \hat u _0 (\xi) \d \xi \\\
    &= \int _\R e ^{i(x\xi + \lambda (\xi) t)} \hat u _0 (\xi) \d \xi.
\end{align\*}
For each fixed $x$, we can get a decay estimate by oscillatory integral. 

Very likely a $t ^{-\frac12}$ decay will happen by method of stationary phase, if $\lambda$ has a nondegenerate inflection point. 
However, we want a decay in $L ^\infty$, that is independent of the choice of $x$.

Let's Propose the following assumption.

> **Assumption**. *Suppose $\lambda (\xi)$ only has finitely many inflection points that are all nondegenerate. 
And assume second derivative has at most algebraic decay at infinity.
That is,*
>
\begin{align}
    \lambda'' (\xi _1) &= \dots = \lambda'' (\xi _n) = 0, \qquad \lambda''' (\xi _i) \neq 0. \notag \\\
    \label{assumption}
    \lambda'' (\xi) &\neq 0, \qquad \forall \xi \neq \xi _1, \dots, \xi _n. \\\
    |\lambda'' (\xi)| &\geq |\xi| ^{-m} \qquad \forall |\xi| > > 1. \notag
\end{align}

This assumption ensures that $\lambda$ is not "too linear", so that the phase velocity are not too close.

Recall the Van der Corput lemma (when $k = 2$), if $\abs{\phi''} > 1$ then

\begin{align\*}
    I (t) = \int _a ^b e ^{i t \phi (\xi)} \d \xi \lesssim t ^{-\frac12}.
\end{align\*}

Therefore for a general $\phi$,

\begin{align\*}
    \int _a ^b e ^{i \phi (\xi)} \d \xi = \int _a ^b e ^{i \min |\phi''| \frac{\phi(\xi)}{\min |\phi''|}} \d\xi 
    \lesssim \pth{\min _{\xi \in [a , b]} |\phi'' (\xi)|}^{-\frac12}.
\end{align\*}

Here $\phi (\xi) = x \xi + t \lambda (\xi)$. $\phi''(\xi) = t \lambda''(\xi)$.

Take a simple case when $\lambda$ has only one inflection point $\xi _1$ and $\abs{\lambda'''(\xi _1)} > 1$ in a small neighborhood.

Split 

\begin{align\*}
    u (t, x) &= \int _\R e ^{i(x\xi + \lambda (\xi) t)} \hat u _0 (\xi) \d \xi \\\
    &= \int _{\set{|\xi| > M}} + \int _{\set{|\xi - \xi _1| < \delta}} + \int _{\text{elsewhere}}
\end{align\*}

Then

1. For high frequencies, assume some regularity on $u _0$,

    \begin{align\*}
        \abs{\int _{|\xi| > M} e ^{i(x\xi + \lambda (\xi) t)} \hat u _0 (\xi) \d \xi} 
        &\le \int _{|\xi| > M} |\hat u _0 (\xi)| \d \xi \\\
        &= \int _{|\xi| > M} \abs{\xi} ^{-s} \abs{\xi} ^s |\hat u _0 (\xi)| \d \xi \\\
        &\lesssim \nor{\abs{\xi} ^{-s} \mathbf1 _{\abs{\xi}>M}} _{L ^1} \nor{\abs{\xi} ^s |\hat u _0 (\xi)|} _{L ^\infty} \\\
        &\lesssim M ^{-s+1} \nor{u _0} _{W ^{s, 1}}.
    \end{align\*}

2. For frequencies near the inflection point,

    \begin{align\*}
        \abs{\int _{|\xi - \xi _1| < \delta} e ^{i(x\xi + \lambda (\xi) t)} \hat u _0 (\xi) \d \xi} \le 2 \delta \nor{ \hat u _0 } _{L ^\infty} \le 2 \delta \nor{u _0} _{L ^1}.
    \end{align\*}

3. For elsewhere, 

    $|\phi''(\xi)| > t M ^{-m}$ (at most algebraic decay assumption) 
    or $\phi''(\xi) > \delta$. 
    Since

    \begin{align\*}
        \abs{\int e ^{ix\xi} \hat f (\xi) \hat g (\xi) \d \xi} 
        &\le \nor{f * g} _{L ^\infty} \le \nor f _{L ^\infty} \nor g _{L ^1} \\\
        &\le \sup \abs{\int e ^{ix\xi} \hat f (\xi) \d \xi} \nor g _{L ^1},
    \end{align\*}

    use this trick we can pull out $\newcommand{\ew}{\text\{elsewhere\}}$

    \begin{align\*}
        \abs{\int _\ew e ^{i x \xi} e^{i \lambda (\xi) t} \hat u _0 (\xi) \d \xi}
        \le \nor{u _0} _{L ^1} \nor{\int _\ew e ^{i x \xi} e ^{i \lambda (\xi) t} \d \xi} _{L ^\infty}.
    \end{align\*}

    By Van der Corput lemma, this is bounded by 

    \begin{align\*}
        \int _\ew e ^{i (x \xi + \lambda (\xi) t)} \d \xi \lesssim \pth{\min _{\xi \in \ew} |t \lambda'' (\xi)|} ^{-\frac12} \le \min \set{M ^{-m}, \delta} ^{-\frac12} t ^{-\frac12}.
    \end{align\*}

In conclusion,

\begin{align\*}
    |u (t, x)| \lesssim M ^{-s + 1} \nor{u _0} _{W ^{s, 1}} + 2 \delta \nor{ u _0 } _{L ^1} + \min \set{M ^{-m}, \delta} ^{-\frac12} t ^{-\frac12} \nor{ u _0 } _{L ^1}.
\end{align\*}

Similar as Van der Corput lemma, choose $t ^{-\frac13} = \delta = M ^{-m} = M ^{-s + \frac12}$, we obtain

> **Theorem** *($L ^\infty$ Decay of Dispersive Equation)*. *If $u$ is a solution to \eqref{disp-eqn}, where $\lambda$ satisfy the above assumption \eqref{assumption}, we have*
>
\begin{align\*}
    \nor{ u (t) } _{L ^\infty} \lesssim _\lambda t ^{-\frac13} \nor{u _0} _{W ^{s, 1}}
\end{align\*}
>
> *where $s = m - 1$.*

### Final Remarks

1. This decay rate is sharp and the regularity requirement is optimal, by selecting an initial value compactly supported near inflection frequency in Fourier space and chase the wave with critical velocity.
2. $L ^\infty$ decay plus $L ^2$ conservation impliy $L ^p$ decay for $p > 2$ and $L ^q$ growth for $q < 2$.
3. Decay rate is different in higher dimensions.

