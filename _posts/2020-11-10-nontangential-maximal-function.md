---
layout: post
title: "Nontangential Maximal Function"
date: 2020-11-10
use-math: true
comment: true
use-d3: true
---

### Introduction

We are interested in the relations between a function $f$ defined on $\Rn$ and a corresponding function $F$ defined on $\RR{n+1}_+$. For instance, $F (\cdot, t) = f * \Phi _t$ for some convolution kernel $\Phi$. We define the nontangential maximal function

\begin{align\*}
    F ^* (x) := \sup _{|x - y| < t} |F (y, t)| = \sup _{\Gamma (x)} |F|.
\end{align\*}

Here $\Gamma (x) = \set{(y, t): \abs{y - x} < t}$ is a cone centered at $x$ with aperture $1$. We may also define cone with aperture $a$ by $\Gamma _a (x) = \set{(y, t): \abs{y - x} < at}$, and corresponding $F ^* _a (x)$.

<div theorem="Proposition">
Let $\Phi$ has a non-increasing, bounded, integrable radial majorant. Then if $F (x, t) = f * \Phi _t (x)$, then $F ^* (x) \le c \mm f (x)$.
</div>

### Carleson Measure 

$
\newcommand{\cN}{\mathcal N}
\newcommand{\cC}{\mathcal C}
$
For a ball $B = B \_r (x \_0) \subset \Rn$, let $T (B) \subset \RR{n+1}_+$ be the cone with base $B$:

\begin{align\*}
    T (B) = \set{
        (x, t): \abs{x - x _0} \le r - t
    } = \RR{n+1} _+ \setminus \bigcup _{x \notin B} \Gamma (x).
\end{align\*}

In general for an open set $O \subset \Rn$, we define

\begin{align\*}
    T (O) = \RR{n+1} _+ \setminus \bigcup _{x \notin O} \Gamma (x).
\end{align\*}

It is easy to see

\begin{align\*}
    A \subset B \Rightarrow B ^c \subset A ^c \Rightarrow \bigcup _{x \notin B} \Gamma (x) \subset \bigcup _{x \notin A} \Gamma (x) \Rightarrow T (A) \subset T (B)
\end{align\*}

and 

\begin{align\*}
    (x, t) \in T (A) \cap T (B) &\Leftrightarrow (x, t) \notin \bigcup _{x \notin B} \Gamma (x) \cup \bigcup _{x \notin A} \Gamma (x)  
    \newline 
    &\Leftrightarrow (x, t) \notin \bigcup _{x \notin A \cap B} \Gamma (x) 
    \newline 
    &\Leftrightarrow (x, t) \in T (A \cap B)
\end{align\*}

so $T (A) \cap T (B) = T (A \cap B)$. As for the union, 

\begin{align\*}
    (x, t) \in T (A) \cup T (B) 
    &\Leftrightarrow (x, t) \notin \bigcup _{x \notin A} \Gamma (x) \cap \bigcup _{x \notin B} \Gamma (x) 
    \newline 
    &\Rightarrow (x, t) \notin \bigcup _{x \notin A \cup B} \Gamma (x) 
    \newline
    &\Leftrightarrow 
    (x, t) \in T (A \cup B).
\end{align\*}

so $T (A) \cap T (B) \subset T (A \cap B)$. 

Consider the following two spaces:

\begin{align\*}
    \cN &= \set{F: \RR{n+1} _+ \to \R \text{ measurable function with } F ^* \in L^1(\Rn)}, 
    \newline
    \cC &= \set{\mu \text{ Borel measure on $\RR{n+1} _+$}: \mu (T (B)) \le C |B| \text{ for all $B$ for some $C < \infty$}}.
\end{align\*}

These two spaces equipped with norm 

\begin{align\*}
    \nor{F} _{\cN} &= \nor{F ^*} _{L ^1 (\Rn)}, 
    \newline
    \nor{\mu} _{\cC} &= \sup _B \frac{\mu (T (B))}{|B|} 
    \newline
    &= \sup _{x \in \Rn} \underbrace{\sup _{B \ni x} \frac{\mu (T (B))}{|B|}} _{:=C (\d\mu) (x)}.
\end{align\*}

are Banach spaces. $\cC$ is called the Carleson measure. The main theorem is the following.

<div theorem="Theorem">
If $F \in \cN$ and $\mu \in \cC$, then 
\begin{align}
    \int _{\RR{n+1}_+} F (x, t) \d \mu (x, t) 
    &\le c \intRn F ^* (x) C (\d \mu) (x) \d x \\
    &\le c \nor{F} _\cN \nor{\d\mu} _\cC.
\end{align}
</div>

#### Proof.

The proof is based on the following two observations:

1. $\set{\abs F > \alpha} \subset T \pth{ \set{ F ^* > \alpha}}$.
2. $\mu (T(B)) \le \abs B$ for all $B$ implies $\mu (T(O)) \le c \abs O$ for all $O \subset \Rn$.

Let's see why they are true. Assume $F > 0$ for simplicity. For the first one, 

\begin{align\*}
    (x, t) \in \set{F > \alpha} &\Rightarrow \forall y \in B _t (x), F ^* (y) > \alpha
    \newline
    &\Rightarrow (x, t) \in T (B _t (x)) \subset T \pth{
        \set{
            F ^* > \alpha
        }
    }.
\end{align\*}

For the second one, pick $(x, t) \in T (O)$, then $B _t (x) \subset O$. Let $\seq Q k$ be a Whitney decomposition of $O$, such that $\diam (Q _k) \sim \dist (Q _k, O ^c)$. Let $Q _k$ be the cube that contains $x$, and let $B _k$ be a ball centered at $Q _k$ with radius $c \diam (Q _k)$. Then by choosing $c$ large enough, $B _t (x) \subset B _k$, and $(t, x) \in T (B _k)$. Therefore, $T (O) \subset \bigcup _k T (B _k)$, and 

\begin{align\*}
    \mu (T(O)) \le \sum _k \mu (T(B _k))
\end{align\*}

Now for any $x \in Q _k \subset B _k$, 

\begin{align\*}
    \mu (T(B _k)) \le C (\d \mu) (x) |B _k|,
\end{align\*}

therefore 

\begin{align\*}
    \mu (T(B _k)) \le \frac1{|Q _k|} \int _{Q _k} C (\d \mu) (x) \d x |B _k| = c \int _{Q _k} C (\d \mu) (x) \d x,
\end{align\*}

thus 

\begin{align\*}
    \mu (T (O)) \le c \sum _k \int _{Q _k} C (\d \mu) (x) \dx = c \int _O C (\d \mu) (x) \d x.
\end{align\*}


After these two observations, we have 

\begin{align\*}
    \mu \ptset{F > \alpha} \le \mu( T( \set{F ^* > \alpha})) \le c \intset{F ^* > \alpha} C (\d\mu) (x) \d x.
\end{align\*}

Integrate with respect to $\alpha$, 

\begin{align\*}
    \int \_{\RR{n+1}_+} F \d \mu \le c \intRn F ^* (x) C (\d\mu) (x) \d x.
\end{align\*}

### The Effect of Aperture

We now show that the choice of aperture is not important. 

<div theorem="Proposition">
Recall that for $a > 0$, 
\begin{align*}
    F ^* _a (x) = \sup _{(y, t) \in \Gamma _a (x)} |F (y, t)| = \sup _{|y - x| \le at} |F (y, t)|.
\end{align*}
Then for any $a \ge b > 0$, 
\begin{align*}
    \abset{F ^* _a > \alpha} \le c _{a, b} \abset{F ^* _b > \alpha}, \qquad \forall \alpha > 0.
\end{align*}
Integrating with respect to $\alpha$ gives $\nmL1{F _a ^*} \le c _{a,b} \nmL1{F _b ^*}$. 
</div>

Note that $F ^* _a \ge F ^* _b$ pointwisely, so the above inequalities are comparible.

#### Proof. 

Denote $O = \set{F ^* _b > \alpha}$. For $x \in \set{F ^* _a > \alpha}$, there exists $(\bar x, t)$ with $F (\bar x, t) > \alpha$ and $x \in B _{at} (\bar x)$. For every $x \in B _{bt} (\bar x)$ we have $F ^* _b (x) > \alpha$, so $B _{bt} (\bar x) \subset O$. If we set $B = B _{(a + b) t} (x) \supset B _{bt} (\bar x)$, then 

\begin{align\*}
    \frac{|O \cap B|}{|B|} \ge \frac{B _{bt} (\bar x)}{|B|} \ge \pthf b{a+b} ^n.
\end{align\*}

This shows that 

\begin{align\*}
    \mm \ind O (x) \ge \pthf b{a+b} ^n.
\end{align\*}

Therefore, 

\begin{align\*}
    \abset{F ^* _a > \alpha} \le \abset{\mm \ind O \ge \pthf b{a+b} ^n} \le c_n \pthf{a+b}b ^n \nmL1{\ind O} = c _n \pthf{a+b}b ^n \abset{F ^* _b > \alpha}.
\end{align\*}

### Atomic Decomposition

<div theorem="Theorem">
Any $F \in \cN$ can be written as 
\begin{align*}
    F = \sum _k \lambda _k a _k
\end{align*}
where $a _k$ are atoms, $\lambda _k \ge 0$, and 
\begin{align*}
    \sum _k \lambda _k \le c \nor{F}_{\cN}.
\end{align*}
Here $a \in \cN$ is an atom if $a$ is supported in the tent $T (B)$ of some ball $B$ with $\nor{a}_{L ^\infty} \le |B| ^{-1}$, so that $a ^* (x) \le |B| \inv$ when $x \in B$ and $a ^* (x) = 0$ when $x \notin B$, and $\nor{a} _{\cN} \le 1$.
</div>

#### Proof.

We denote the dyadic level sets of $F ^\*$ by $O ^j = \set{F ^\* > 2 ^j}$, then $\supp F \subset \bigcup \_{j \in \Z} T (O ^j)$. Moreover, we Whitney decompose $O ^j$ into $Q ^j \_k$, so that 

\begin{align\*}
    T (O ^j) = \bigcup _k T (B ^j _k) \cap (Q ^j _k \times (0, \infty)).
\end{align\*}

Denote 

\begin{align\*}
    \Delta ^j _k = T (B ^j _k) \cap (Q ^j _k \times (0, \infty)) \cap (T (O ^j) \setminus T(O ^{j + 1})).
\end{align\*}

Then $\supp F$ is the disjoint union of $\Delta _k ^j$. Now set $\lambda ^j \_k a ^j \_k = F \ind{\Delta \_k ^j}$, where $\lambda ^j \_k = 2 ^{j + 1} \abs{B \_k ^j}$. Then $a ^j \_k$ is an atom and 

\begin{align\*}
    \sum _{j, k} \lambda _k ^j = \sum _{j, k} 2 ^{j + 1} |B _k ^j| = c \sum _{j, k} 2 ^{j + 1} |Q _k ^j| = c \sum _j 2 ^{j + 1} |O ^j| \le c \nmL1{F ^*} = c \nor F _{\cN}.
\end{align\*}