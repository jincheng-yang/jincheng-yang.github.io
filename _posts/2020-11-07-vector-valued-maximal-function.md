---
layout: post
title: "Vector-Valued Maximal Function"
date: 2020-11-07
use-math: true
comment: true
use-d3: true
---

For $f \in L ^1 _\loc (\Rn)$, we can define

\begin{align\*}
    \mm f (x) := \sup _{r > 0} \fint _{B _x (r)} |f (y)| \d y.
\end{align\*}

$
\newcommand{\vf}{\boldsymbol f}
\newcommand{\vg}{\boldsymbol g}
\newcommand{\vb}{\boldsymbol b}
\newcommand{\vM}{\boldsymbol{\mathcal M}}
$

Consider the space of function sequence $\vf = \set{f _j} \cnt j1\infty \in \pth{L^p (\Rn)} _\tensor$, define 

\begin{align\*}
    | \vf (x) | = \pth{
        \SUM j1i |f _j (x)| ^2
    } ^\half = \nor{\set{f _j (x)} \cnt j1\infty} _{\ell^2}
\end{align\*}

We say $\vf \in L ^p$ if $\abs{\vf} \in L ^p (\Rn)$, or $\nor{\vf} _{L ^p} = \nor{f _j (x)} _{L ^p _x \ell ^2 _j}$. 

Vector-valued maximal operator $\vM$ is defined by 

\begin{align\*}
    \vM \vf (x) = \pth{
        \SUM j1\infty |\mm f _j (x)| ^2
    } ^\half = \nor{\set{\mm f _j (x)} \cnt j1\infty} _{\ell^2} .
\end{align\*}

Then: 

<div theorem="Theorem">
Let $1 \le p < \infty$, assume $\vf \in L ^p$. Then

<div markdown="1">
1. $\vM \vf$ is finite a.e.
2. $\vM$ is weak-type $(1, 1)$.
3. $\vM$ is strong-type $(p, p)$, $1 < p < \infty$.
</div>

</div>

<div theorem="Remark">
The case $p = \infty$ is wrong. Think $f _j = \ind{(2 ^{j}, 2 ^{j + 1})}$.
</div>

We will prove this theorem first for $p = 2$, then for $p = 1$, then for $p \in (1, 2)$, then for $p \in (2, \infty)$.

#### Proof for $p = 2$

Case $p = 2$ is natural, because $\mm$ is bounded on $L^2$, and $L ^2 \_x \ell ^2 \_j = L ^2\_{x, j}$. 

#### Proof for $p = 1$

When $p = 1$, we want to prove for all $\alpha > 0$,

\begin{align\*}
    \abset{
        \vM \vf > \alpha
    } \le \frac A\alpha \nmL1\vf.
\end{align\*}

Assume $\vf \ge 0$. We have Calder\'on-Zygmund decomposition, that is, we have a collection $\set{Q _k}$ disjoint cubes, $\vf = \vg + \vb = \vg + \sum _k \vb _k$, such that 

1. $\abs{\vg} = \abs{\vf} \le \alpha$ in $\Rn \setminus \bigcup _k Q _k$, and $\vg = 0$ in $Q _k$. 
2. $\vb _k$ is supported in $Q _k$, and $\fint _{Q _k} \abs{\vb _k} \le A \alpha$.
3. $\sum _k \abs{Q _k} \le \frac A\alpha \nor\vf _{L ^1}$.

Because $\abs{\vg} \le \min \set{\alpha, \abs{\vf}}$,

\begin{align\*}
    \abset{
        \vM \vg > \frac\alpha2
    } \le \frac4{\alpha ^2} \nmL2{\vM \vg} ^2 \le \frac A{\alpha ^2} \nmL2\vg ^2 \le \frac A\alpha \nmL1\vf.
\end{align\*}

it suffices to show 

\begin{align\*}
    \abset{
        \vM \vb > \frac\alpha2
    } \le \frac A\alpha \nmL1\vf.
\end{align\*}

Denote $\bar \vb _k = \fint _{Q _k} \vb _k \le A\alpha$, and $\bar \vb = \sum _k \bar \vb _k \ind{Q _k}$. Then 

\begin{align\*}
    \abset{
        \vM \bar \vb > \frac\alpha2
    } \le \frac4{\alpha ^2} \nmL2{\vM \bar \vb} ^2 \le \frac A{\alpha ^2} \nmL2{\bar \vb} ^2 \le A ^3 \sum _k |Q _k| \le \frac A\alpha \nmL1\vf.
\end{align\*}

Similarly 

\begin{align\*}
    \abset{
        c \vM \bar \vb > \frac\alpha2
    } \le \frac A\alpha \nmL1\vf.
\end{align\*}

We want to show that 

\begin{align\*}
    \vM \vb (x) \le c \vM \bar \vb (x) \qquad x \notin \bigcup _k Q _k ^*
\end{align\*}

where $Q _k ^* = 2 Q _k$. This would end the proof because 


\begin{align\*}
    \abset{
        \vM \vb (x) > \frac\alpha2 
    } 
    &\le \abset{
        c \vM \bar \vb > \frac\alpha2
    } + \abset{
        \vM \vb (x) > c \vM \bar \vb
    } 
    \\\&\le \frac A\alpha \nmL1\vf + \sum _k |Q _k ^*|
    \\\&\le \frac A\alpha \nmL1\vf.
\end{align\*}


To see why $c \vM \bar \vb$ bound $\vM \vb$ away from $Q _k ^\*$, it suffices to prove for each coordinate,

\begin{align\*}
    \mm b _j (x) \le c \mm \bar b _j (x) \qquad x \notin \bigcup _k Q _k ^\*
\end{align\*}

then the $\ell ^2$ norm are controlled. Let $B = B (x, r)$, and consider 

\begin{align\*}
    \fint _B b _j (x) \d x = \frac1{|B|} \sum _k \int _{B \cap Q _k} b _j (x) \d x.
\end{align\*}

If $x \notin Q _k ^\*, B \cap Q _k \neq \varnothing$, then $Q _k \subset 3 B$, so 

\begin{align\*}
    \fint _B b _j \d x \le \frac1{|B|} \int _{3B} b _j \d x = \frac1{|B|} \int _{3B} \bar b _j \d x \le 3 ^n M \bar b _j (x).
\end{align\*}

#### Proof for $1 < p < 2$

By Marcinkiewicz interpolation, we have all the strong type bound for $1 < p \le 2$. 

#### Proof for $2 < p < \infty$

First we introduce the weighted maximal inequality.

<div theorem="Proposition">
Let $\mu < < \mathcal L ^n$ be absolute continuous with respect to the Lebesgue measure, that is $\d \mu = \omega (x) \d x$ for some $\omega \in L^1_{\loc}$. Then 

\begin{align*}
    \mu \ptset{
        \mm f (x) > \alpha
    } \le \frac A\alpha \nor{f} _{L^1(\mm \omega \d x)}
\end{align*}

and 

\begin{align*}
    \nor{\mm f} _{L ^q(\omega \d x)} \le A _q \nor f_{L ^q (\mm \omega \d x)}.
\end{align*}

Here $A$ and $A _q$ are independent from $\omega$.
</div>

##### Proof. 

The case $q = \infty$ is trivial, and the case $1 < q < \infty$ is by Marcinkiewicz interpolation.

For $x \in \set{\mm f (x) > \alpha}$, there exists $B _x$ such that 

\begin{align\*}
    |B _x| < \frac1\alpha \int _{B _x} |f (y)| \d y.
\end{align\*}

Then 
\begin{align\*}
    \mu (5 B \_x) = \int \_{5 B \_x} \omega \d x &\le A |B \_x| \mm \omega (y), \qquad \forall y \in B _x
    \\\&
    \le \frac A\alpha \int _{B _x} |f (y)| \mm \omega (y) \d y.
\end{align\*}

Fincally, we choose a disjoint subselection of $B _{x _k}$ such that $5 B _{x _k}$ is a covering of $\set{\mm f (x) > \alpha}$.

---

Back to the case $\vf = \set{f _j} \cnt j1i$, by proposition case $q = 2$ we have 

\begin{align\*}
    \nor{\mm f _j} _{L ^2(\omega \d x)} \le A _2 \nor{f _j} _{L ^2 (\mm \omega \d x)}.
\end{align\*} 

Take $\ell ^2$ norm, 

\begin{align\*}
    \nor{\vM \vf} _{L ^2(\omega \dx)} \le A _2 \nor{\vf}  _{L ^2 (\mm \omega \d x)},
\end{align\*}

that is 

\begin{align\*}
    \int (\vM \vf) ^2 \omega \d x \le A \int |\vf| ^2 (\mm \omega) \d x.
\end{align\*}

Then by duality, set $q = \pthf p2 ^*$,

\begin{align\*}
    \nmL p{\vM \vf} &= \nmL{\frac p2}{(\vM \vf) ^2} 
    \\\&= \sup _{\nmL q{\omega} = 1} 
    \int (\vM \vf) ^2 \omega \d x 
    \\\& \le \sup _{\nmL q{\omega} = 1} A \int |\vf| ^2 (\mm \omega) \d x \\\& \le A \nmL{\frac p2}{\vf ^2} \sup _{\nmL q{\omega} = 1}  \nmL{q}{\mm \omega} 
    \\\& \le A \nmL p \vf.
\end{align\*}

<div theorem="Remark">
We can replace $\ell ^2$ by $\ell ^q$ for $1 < q \le \infty$, by setting $\vM _q \vf (x) = \nor{M f _j (x)}_{\ell ^q}$. For $q < \infty$, one start the proof for $p = q$, then interpolate $(1, q)$, then bootstrap to $(q, \infty)$. For $q = \infty$, $\vM _\infty \vf \le M (|\vf| _\infty)$. However $q = 1$ doesn't work.
</div>

<div theorem="Remark">
If $\mm \omega$ is comparible to $\omega$, then the two weights in the proposition are the same. This is called $A _1$ condition.
</div>