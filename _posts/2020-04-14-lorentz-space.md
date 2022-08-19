---
layout: post
title: "Lorentz Space"
date: 2020-04-14
comments: true
use-math: true
image: true
thumb: lorentz.svg
---

The purpose of this note is to give a few equivalent definitions, \eqref{def1}, \eqref{def2}, \eqref{def3} and \eqref{def4} for Lorentz norm $L ^{p, q}$. 

### Distribution function and Decreasing Rearrangement

Similar as Lebesgue space, Lorentz space only cares about the height of a function and the space it occupies at each height. Let $f \in \mathcal L ^0 \pth{X, \d \mu}$ be any complex-valued measurable function. Any definition below that works for $f \ge 0$ can be generalized for complex-valued (and in general Banach space-valued) $f$ by replacing $f$ by $\abs{f}$.

> **Definition.** *The* ***distribution function*** *of $f$ is defined as the measure of the superlevel set, that is*
> 
>\begin{align}
    d _f (\alpha) := \mu \pth{\set{x \in X: |f (x)| > \alpha}}, \qquad \alpha \ge 0.
\end{align}

This definition is the opposite to the definition of cdf (cumulative distribution function) for a random variable that we are used to in probability. So in contrast to cdf, $d _f$ is left/lower semicontinuous, and is a decreasing function.

> **Definition.** *The* ***decreasing rearrangement*** *of $f$ is defined on $[0, \infty)$ by*
>
>\begin{align}
    f ^* (\lambda) := \inf \set{t > 0: d _f (t) \le \lambda}
\end{align}

This is almost like the "inverse function" of the distribution function. It is also left/lower semicontinuous and decreasing. Notice that the superlevel set of $f ^*$ has the same measure as $f$. 

One can take the following example to understand the construction of the distribution function and decreasing rearrangement. Assume the following is the graph of $f = \ind{S _1} + 4 \ind{S _2} + 2 \ind{S _3}$ where $\mu (S _1) = \mu (S _2) = \mu (S _3) = 1$.

<svg class='center-image' height='300' viewBox='0 0 250 200'>
    <image x='0' y='0' width='238' height='189' href='{{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/f(x).svg'/>
</svg>

<!-- ![f(x)]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/f(x).svg){:width="40%" .center-image} -->

To find its distribution function, rotate by 90 degrees and then find the measure of superlevel set at each level $\alpha$.

<svg class='center-image' height='630' viewBox='0 0 200 420'>
    <g transform="rotate(90, 300, 300)">
        <image x='0' y='410' width="238" height="189" href='{{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/f(x).svg'/>
    </g>
    <image x='22' y='230' width="179" height="178" href='{{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/df(a).svg'/>
</svg>

<!-- ![f(x)]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/f(x).svg){:width="40%" .center-image .rotate90}

![df(a)]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/df(a).svg){:width="30%" .center-image} -->

Finally, rotate back and flip the distribution function to obtain decreasing rearrangement.

<svg class='center-image' width='100%' viewBox='0 0 570 200'>
    <image x='0' y='0' width="238" height="189" href='{{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/f(x).svg'/>
    <g transform="rotate(-90, 0, 0)">
        <image x='-168' y='230' width="179" height="178" href='{{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/df(a).svg'/>
    </g>
    <image x='420' y='-2' width="147" height="177" href='{{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/fs(l).svg'/>
</svg>

<!-- ![f(x)]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/f(x).svg){:width="40%"}
![df(a)]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/df(a).svg){:width="30%" .rotate270}
![f*(l)]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/fs(l).svg){:width="25%"} -->

Compare $f$ and $f ^*$, it looks like just push all the level sets to the left onto the $\alpha$ axis, and end up with something decreasing. 

### Layer Cake Representation and $L ^p$ Norm

The layer cake representation states the following. For $f \ge 0$, 

\begin{align}
    \int _X f \d \mu = \int _0 ^\infty d _f (\alpha) \d \alpha.
\end{align}

This comes from thinking integration over the hypograph, 

\begin{align}
    \Omega _f = \set{(x, \alpha) \in X \times \R _+: f (x) > \alpha}.
\end{align}

Therefore

$$
\begin{align}
\int _X f \d \mu &= \int _X \int _0 ^{f(x)} \d \alpha \d \mu \notag\\\
&= \int _{\Omega _f} \d \alpha \d \mu \notag\\\
&= \int _0 ^\infty \int _X \ind{\set{f(x) > \alpha}} \d \mu \d \alpha \notag \\\
&= \int _0 ^\infty \mu (f > \alpha) \d \alpha \notag \\\
&= \int _0 ^\infty d _f (\alpha) \d \alpha. \notag
\end{align}
$$

Using decreasing rearrangement, we can also think

\begin{align}
\int _X f \d \mu = \int _0 ^\infty f ^* \d \lambda = \int _{\Omega _{f ^*}} \d \alpha \d \lambda. \notag
\end{align}

Here $\Omega _{f ^\*}$ is the hypograph of $f ^\*$ (and also the hypograph of $d _f$)

\begin{align}
    \Omega _{f ^\*} = \set{(\lambda, \alpha) \in \R _+ ^2: f ^\* (\lambda) > \alpha} = \set{(\lambda, \alpha) \in \R _+ ^2: d _f (\alpha) > \lambda}.
\notag
\end{align}

Similarly, for $L ^p$ norm,

\begin{align}
\int _X f ^p \d \mu &= \int _{\Omega _{f ^*}} \d (\alpha ^p) \d \lambda = \int _0 ^\infty d _f (\alpha) \d (\alpha ^p) = \int _0 ^\infty p \alpha ^{p - 1} d _f (\alpha) \d \alpha. \notag
\end{align}

So the integral of $f ^p$ can be just thought as the $\d(\alpha ^p) \tensor \d \lambda$ measure of the hypograph. 

### Lorenze Space

> **Definition.** *For $p, q > 0$, we define the* ***Lorenze norm*** *of $f \ge 0$ by* 
>
>\begin{align}
\label{def1}
\nor{f} _{L ^{p, q}} ^q = \int _{\Omega _{f ^*}} \d (\alpha ^q) \d \pth{\frac pq \lambda ^{\frac qp}} = \int _{\Omega _{f ^\*}}  \lambda ^{\frac qp - 1} \d (\alpha ^q) \d \lambda.
\end{align}

That is, we change the measure we put on domain, and put $L ^q$-typed measure on range. If we integrate $\lambda$ first, we end up with

$$
\begin{align}
\nor{f} _{L ^{p, q}} ^q &= \int _0 ^\infty \frac pq \bkt{d _f (\alpha)} ^{\frac qp} q \alpha ^{q - 1} \d \alpha \notag \\\
&= p \int _0 ^\infty \bkt{d _f (\alpha)} ^{\frac qp} \alpha ^{q} \frac{\d \alpha}\alpha \label{split} ,\\\
\nor f _{L ^{p,q}} &= p ^\frac1q \nor{\alpha [d _f (\alpha)] ^\frac1p} _{L ^q \pth{\R _+, \frac{\d \alpha}\alpha}} .
\label{def2}
\end{align}
$$

If we integrate $\alpha$ first, we end up with

$$
\begin{align}
\nor f _{L ^{p, q}} ^q &= \int _0 ^\infty [f ^* (\lambda)] ^q \lambda ^{\frac qp - 1} \d \lambda \notag \\
&= \int _0 ^\infty \lambda ^{\frac qp} [f ^* (\lambda)] ^q\frac{\d \lambda}\lambda \notag ,\\
\nor f _{L ^{p, q}} &= \nor{\lambda ^{\frac1p} f ^* (\lambda)} _{L ^q \pth{\R _+, \frac{\d \lambda}\lambda}}. 
\label{def3}
\end{align}
$$

### Dyadic Decomposition in Range

We decompose $f \ge 0$ by range as the following. Let $E _k = \set{f > 2 ^k}$ denote a sequence of nested dyadic level sets, and define

$$
\begin{align*}
f _k &= 2 ^{k-1} \ind{E _{k + 1}} + (f - 2^{k - 1})(\ind{E _k} - \ind{E _{k + 1}}) \\\
&= f(\ind{E _k} - \ind{E _{k + 1}}) + 2 ^k \ind{E _{k + 1}} - 2^{k - 1} \ind{E _k} .
\end{align*}
$$

Then $f = \sum _{k \in \mathbb Z} f _k$, $f _k$ is supported in $E _k$, and $f _k$ is comparible to $2 ^k \ind{E _k}$: 

$$
\begin{align*}
    \frac12 2 ^k \ind{E _k} \le f _k \le \frac32 2 ^k \ind{E _k}.
\end{align*}
$$

![Decomposition]({{ site.roooot }}/assets/images/blog/2020-04-14-lorentz-space/decomp.svg){: .center-image}

Now we also split the integral \eqref{split} dyadically,

$$
\begin{align*}
     \frac1p \nor{f} _{L ^{p, q}} ^q 
     &= \int _0 ^\infty \bkt{d _f (\alpha)} ^{\frac qp} \alpha ^{q} \frac{\d \alpha}\alpha \notag \\\
     &= \sum _{k \in \Z} \int _{2 ^k} ^{2 ^{k + 1}} \bkt{d _f (\alpha)} ^{\frac qp} \alpha ^{q} \frac{\d \alpha}\alpha .\notag \\\
\end{align*}
$$

Since $d _f$ is decreasing,

$$
\begin{align*}
2 ^{kq} \bkt{d _f \pth{2 ^{k + 1}}} ^{\frac qp} \lesssim 
\int _{2 ^k} ^{2 ^{k + 1}} \bkt{d _f (\alpha)} ^{\frac qp} \alpha ^{q} \frac{\d \alpha}\alpha \lesssim
2 ^{kq} \bkt{d _f \pth{2 ^{k}}} ^{\frac qp}. \notag
\end{align*}
$$

By definition of $E _k$,

$$
\begin{align*}
2 ^{kq} \mu\pth{E _{k + 1}} ^{\frac qp} \lesssim 
\int _{2 ^k} ^{2 ^{k + 1}} \bkt{d _f (\alpha)} ^{\frac qp} \alpha ^{q} \frac{\d \alpha}\alpha \lesssim
2 ^{kq} \mu\pth{E _{k}}  ^{\frac qp}. \notag
\end{align*}
$$

Since $\nor{f _k} _{L ^p} \sim \nor{2 ^k \ind {E _k}} _{L ^p} = 2 ^k \mu \pth{E _k} ^{\frac 1p}$,

$$
\begin{align*}
\nor{f _{k + 1}} _{L ^p} ^q \lesssim 
\int _{2 ^k} ^{2 ^{k + 1}} \bkt{d _f (\alpha)} ^{\frac qp} \alpha ^{q} \frac{\d \alpha}\alpha \lesssim
\nor{f _k} _{L ^p} ^q. \notag
\end{align*}
$$

By taking the summation over $k$, we obtain an equivalent way of defining $L ^{p, q}$ norm,

$$
\begin{align}
\label{def4}
\nor f _{L ^{p, q}} \sim _{p,q} \nor{ \set{\nor{f _k} _{L ^p}} _{k \in \Z}} _{\ell ^q}.
\end{align}
$$