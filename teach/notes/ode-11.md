---
layout: note
title: "Lecture 11: Limit set"
use-math: true
---

# $\alpha$-limit set and $\omega$-limit set

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
\newcommand{\bg}{\boldsymbol g}
\newcommand{\be}{\boldsymbol e}
\newcommand{\bphi}{\boldsymbol \phi}
\newcommand{\bxi}{\boldsymbol \xi}
\newcommand{\bA}{\boldsymbol A}
\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
\newcommand{\bB}{\boldsymbol B}
\newcommand{\bC}{\boldsymbol C}
$$

For a dynamical system, other than the question of stability, the most important question we may ask about a solution is: where does it eventually head to? For an orbit sufficiently close to an attractive critical point, we know it will eventually converge to that critical point. In the case of linear system, we also see examples of orbit escaping to infinity. In the case of a vortex point, every orbit is a closed loop and they stay on the loop forever. We introduce the concept of limit set below.

> [!Definition]
> Suppose $\bu' (t) = \bf (\bu (t))$ where $\bf \in C (\R ^d)$ is bounded and locally Lipschitz (so a unique global solution exists for any given data). Let $\bu$ be the solution with initial data $\bu (0) = \bx _0$. The orbit passing $\bx _0$ is the image of $\bu$, denoted by $L _{\bx _0}$. The image of $\bu ([0, +\infty))$ is called the positive half orbit, denoted by $L ^+ _{\bx _0}$. The image of $\bu ((-\infty, 0])$ is called the negative half orbit, denoted by $L ^- _{\bx _0}$. 
> 
> If there exists a sequence of times $t _n \to +\infty$ and 
> 
> $$
> 	\lim _{n \to +\infty} \bu (t _n) = \bx _+
> $$
> 
> then we say $\bx _+$ is an $\omega$-limit point of $L ^+ _{\bx _0}$. Similarly, if $t _n \to -\infty$ and $\bu (t _n) \to \bx _-$, then we say $\bx _-$ is an $\alpha$-limit point of $L ^- {\bx _0}$. 
> 
> The set of all $\omega$-limit point is called the $\omega$-limit set, denoted as $\Omega _{\bx _0}$. The set of all $\alpha$-limit point is called the $\alpha$-limit set, denoted as $A _{\bx _0}$. 

For example, if $\bx _0$ is a critical point, then $\Omega _{\bx _0} = A _{\bx _0} = \{\bx _0\}$. If there is a closed orbit (loop) $\Gamma$ passing $\bx _0$, then $\bu$ is periodic and $\Omega _{\bx _0} = A _{\bx _0} = \Gamma$. If $\lim _{t \to +\infty} \bu (t) = \bx _1$, then  $\Omega _{\bx _0} = \{\bx _1\}$. It is also possible that an orbit gets closer and closer to a closed orbit.

> [!Definition]
> We say a set $B$ is invariant if for every $\bx _0 \in B$, it holds that $L _{\bx _0} \subset B$. 

> [!Theorem]
> Let $\bx _0 \in \Rd$. Then 
> 
> 1. $\Omega _{\bx _0}$ is closed.
> 2. $\Omega _{\bx _0}$ is invariant.
> 3. If $L ^+ _{\bx _0}$ is bounded, then $\Omega _{\bx _0}$ is connected.
> 
> Similar results hold for $\alpha$-limit set as well.


Proof. To show $\Omega _{\bx _0}$ is closed, suppose $\bx _n \in \Omega _{\bx _0}$ and $\bx _n \to \bx _\infty$. Then there exists $t _m \to +\infty$ as $m \to \infty$ and $\bu (t _m) \to \bx _n$. In particular, there exists $t _n > 0$ such that $\abs{\bu (t _n) - \bx _n} \le \frac1n$. Then $\abs{\bu (t _n) - \bx _\infty} \le \frac1n + \abs{\bx _n - \bx _\infty} \to 0$ as $n \to \infty$.

To show $\Omega _{\bx _0}$ is invariant, take $\bx _1 \in \Omega _{\bx _0}$ and $\bx _2 \in L _{\bx _1}$. Then there exists a solution $\bv$ with $\bx _1 = \bv (0)$ and $\bx _2 = \bv (T)$. That is, $\bx _2 = \Phi (T; \bx _1)$ where $\Phi$ is the flow map. Since $\bx _1 \in \Omega _{\bx _0}$, we know that there exists $t _n \to +\infty$ and $\bu (t _n) \to \bx _1$, then $\bu (t _n + T) = \Phi (T; \bu (t _n)) \to \Phi (T; \bx _1) = \bx _2$ due to continuity of the flow map. Hence $\bx _2 \in \Omega _{\bx _0}$ as well.

To show $\Omega _{\bx _0}$ is connected, suppose by contradiction that $\Omega _{\bx _0} = \Omega _{\bx _0} \pp 1 \cup \Omega _{\bx _0} \pp 2$ where $\Omega _{\bx _0} \pp 1 \subset U _1$ and $\Omega _{\bx _0} \pp 2 \subset U _2$ are separated closed sets and $U _1, U _2$ are disjoint open sets. Then $\bu (t)$ must commuting between $U _1$ and $U _2$ as $t \to +\infty$, otherwise $\bu (t)$ stays in one region forever so the other cannot contain any limit points. This also means $\bu$ passes $V := \Rd \setminus U _1 \setminus U _2$ infinitely often. However, since $L _{\bx _0} ^+$ is bounded, $\bu$ must have an accumulation point in $V$, a.k.a. an $\omega$-limit point. $\square$

# Limit set of planar autonomous system

Now we consider the case $d = 2$. 

> [!Proposition]
> $L _{\bx _0}$ can only have the following three structure: 
> 
> 1. $L _{\bx _0} = \{\bx _0\}$ is a critical point.
> 2. $L _{\bx _0} = \Gamma$ is a closed orbit.
> 3. $L _{\bx _0} \cap \Omega _{\bx _0} = \varnothing$.

Proof. Suppose $\bx _1 \in L _{\bx _0} \cap \Omega _{\bx _0}$ and $\bx _1 \notin \bx _0$. We want to show that $L _{\bx _0}$ is a closed orbit. Note that since $\Omega _{\bx _0}$ is invariant, we must have $L _{\bx _0} = L _{\bx _1} \subset \Omega _{\bx _0}$. In particular, $\bx _0 \in \Omega _{\bx _0}$. 

Since $\bx _0$ is not a critical point, it has a neighborhood $U = B _\e (\bx _0)$ in which orbits are a family of $C ^1$ curves. Suppose after some time, $L _{\bx _0}$ returns to $U$ for the first time, then it must travel along some $C ^1$ curve. If $L _{\bx _0}$ is not a closed orbit, then we can see from picture that this first revisit separates $U$ into two parts and $\bx _0$ is no longer accessible. $\square$

> [!Proposition]
> If $L _{\bx _0} ^+$ is bounded, then $\Omega _{\bx _0}$ can only have one of the following structure:
> 
> 1. $\Omega _{\bx _0}$ is a connected closed set consisting of critical points.
> 2. $\Omega _{\bx _0}$ is a single closed orbit.
> 3. $\Omega _{\bx _0}$ is a union of critical points and open orbits connecting them.

Proof. Since $\Omega _{\bx _0}$ is closed and invariant, it suffices to show if $\Omega _{\bx _0}$ contains a closed orbit $\Gamma$ then $\Omega _{\bx _0} = \Gamma$. 

By connectedness of $\Omega _{\bx _0}$, if $\Omega _{\bx _0}$ is strictly larger than $\Gamma$ then any limit point outside $\Gamma$ is connected to some $\bx _1 \in \Gamma$.  It is not a critical point, so it has a neighborhood $U$ in which orbits are a family of $C ^1$ curves. Pick any $\bx _2 \in L _{\bx _0} ^+ \cap U$, then for the first time $L _{\bx _2} ^+$ revisits $U$ it must travel on a curve on the same side as $\bx _2$ but closer to $\Gamma$. Geometrically, this forbids the orbit from having any other accumulation point than the ones on $\Gamma$. $\square$

Combine this two, we have the following proposition.

> [!Proposition]
> If $L _{\bx _0} ^+$ is contained in a bounded region $D$ in which there is a unique critical point $\bx _*$, then $\Omega _{\bx _0}$ can only have one of the following structure:
> 
> 1. $\Omega _{\bx _0} = \set{\bx _\ast}$. In this case either $L _{\bx _0} = \set{\bx _\ast}$ or $L _{\bx _0} \cap \Omega _{\bx _0} = \varnothing$.
> 2. $\Omega _{\bx _0} = \Gamma$ is a closed orbit. In this case either $L _{\bx _0} = \Gamma$ or $L _{\bx _0} \cap \Omega _{\bx _0} = \varnothing$.
> 3. $\Omega _{\bx _0}$ is a union of $\bx _\ast$ and open orbits in $D$ whose $\alpha$- and $\omega$-limit sets are all $\{\bx _\ast\}$. In this case $L _{\bx _0} \cap \Omega _{\bx _0} = \varnothing$.

## Poincaré-Bendixson Theorem 

Before we present the theorem, we first prove a useful lemma.

> [!Lemma]
> A closed orbit must enclose at least a critical point.

Proof. If you know topology, then there is a topological proof (hairy ball theorem). However, we prefer an analysis proof in this class.

We prove by contradiction. Let $\Gamma$ be a closed orbit, which enclose an open set $U$. If $U$ contains no critical point. Then for every $\bx \in U$, $L _{\bx}$ is bounded inside $U$ and thus $\Omega _{\bx}$ is some orbit. Similarly, $A _{\bx}$ is some orbit as well. Every point is either on an orbit, or its limit sets are two orbits. Moreover, each orbit must enclose some other orbit. 

We can equip the set of orbits a partial order: $\Gamma _1 \le \Gamma _2$ if $\Gamma _1$ is enclosed by $\Gamma _2$. We want to use Zorn's lemma. Indeed, if we have a totally ordered subset, we can also sort them and index them by area. Let $\{\Gamma _t\} _{t \in \mathcal T}$ be a family of orbits that are totally ordered, and let $\Gamma _{t _n}$ be a sequence of orbits that minimizes area. Then we take a sequence $\bx _n \in \Gamma _{t _n}$, which has a converging subsequence to $\bx _\infty$ that is enclosed by all of $\Gamma _{t _n}$, so $\Omega _{\bx _\infty}$ serves as a lower bound. Zorn's lemma asserts the existence of a minimal element, which is a contradiction because each orbits encloses some other orbit.

> [!Theorem]
> (Poincaré-Bendixson) Let $D = U _1 \setminus U _2$ be an annulus-like region bounded by closed curve $L _1 = \partial U _1$ and $L _2 = \partial U _2$, and suppose $D$ contains no critical point. If $\bf$ on both $L _1$ and $L _2$ points inward $(\bf \cdot \boldsymbol n < 0)$ or both outward, then there exists at least one closed orbit $\Gamma$ that encloses $L _2$.

Proof. Take $\bx _0 \in D$ and consider the orbit $L _{\bx _0} ^+$. If $\bf$ points inward, then $L _{\bx _0} ^+$ is bounded in $D$. Since $D$ has no critical point, $\Omega _{\bx _0}$ is a closed orbit $\Gamma$. Since $\Gamma$ must enclose some critical point which can only appear in $U _2$, $\Gamma$ must surround the entire $U _2$ area.