---
layout: note
title: "Lecture 12: Limit cycle"
use-math: true
---

# Limit cycle

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

We learned that if $L _{\bx _0} ^+$ is bounded, then the limit set can be a critical point, a closed orbit, or a combination of critical points and open orbits. Among them it is the easiest to locate critical points: you just look for roots of $\bf$. If there are only finitely many discrete critical points, then find orbits that connects them could be somewhat tricky, but usually doable. The most difficult and intriguing task is to locate (or rule out) closed orbits. They are important because they represent periodic solutions, which models countless natural phenomena. However, it is still mathematically unsatisfactory how to systematically find them. 

We are interested to know if an orbit can be a limit set. We introduce the following definitions.

> [!Definition]
> A closed orbit $\Gamma$ is called a limit cycle if it is the $\omega$-limit set or $\alpha$-limit set of some other orbit. $\Gamma$ is called a stable limit cycle if it is the $\omega$-limit set of all $\bx _0$ in a neighborhood of $\Gamma$. It is called an unstable limit cycle if it is the $\alpha$-limit set of all $\bx _0$ in a neighborhood of $\Gamma$. It is called a semistable limit cycle if it is the $\omega$-limit set of some $\bx _0$ and also the $\alpha$-limit set of some $\bx _1$. It is called neutrally stable if it is none of the above three.

Of course, it is possible that a closed orbit is not a limit cycle. One instance is the orbits around the vortex point in the linear autonomous system. In this case we also say the orbit is neutrally stable.

We can look at the following motivating example:

$$
	\begin{cases}
	\displaystyle
		\dfr xt = -y - x (x ^2 + y ^2 - 1) \\
	\displaystyle
		\dfr yt = x - y (x ^2 + y ^2 - 1)
	\end{cases}
$$

We can write in polar coordinate: $x = r \cos \theta$, $y = r \sin \theta$, and it becomes 

$$
	\begin{cases}
	\displaystyle
		\dfr rt = -r (r ^2 - 1) \\
	\displaystyle
		\dfr \theta t = 1
	\end{cases}
$$

Therefore $\theta = \theta _0 + t$. We can see that $r \equiv 0$ is a solution and $r \equiv 1$ is another solution. The first one is a critical point, whereas the second is a closed orbit, the unit circle. Other solutions can be explicitly found, but from the expression we see that except the critical point we must have $r \to 1$ as $t \to +\infty$. So the unit circle is a stable limit cycle.

## Nonexistence of a limit cycle

There are ways to determine whether a limit cycle cannot exist in a certain region. Some ideas also apply to other types of candidate of limit set: we say a union of finitely many critical points and finitely many homoclinic or heteroclinic orbits is a "singular closed orbit".

Below let us consider $\bf \in C ^1 (G)$ in a simply connected (no hole) region $G \subset \RR2$.

> [!Theorem]
> (Critical Point Criterion) If $G$ contains no critical point, then $G$ does not contain a closed orbit or singular closed orbit.

Proof. We know any closed orbit must surround a critical point, and any singular closed orbit must contain a critical point.

> [!Theorem]
> (Bendixson’s Criterion) If $\div \bf \ge 0$ in $G$ and does not vanish in an entire subdomain, then there is no closed orbit or singular closed orbit contained in $G$.

Proof. Suppose $\gamma = \partial U$ is a closed loop which consists of critical points and orbits. It can be a closed orbit or a part of singular closed orbit. Then $\bf$ is parallel to the tangent vector of $\gamma$, and as a consequence 

$$
	\int _U \div \bf (\bx) \d \bx = \oint _\gamma \bf \cdot \boldsymbol n \d \ell = 0.
$$

Therefore $\div \bf \equiv 0$ in $\bar U$, which is a contradiction.

A natural generalization is due to Dulac.

> [!Theorem]
> (Dulac's Criterion) If there exists a function $B \in C ^1 (G)$ such that $\div (B \bf) \ge 0$ in $G$ and does not vanish in an entire subudomain, then there is no closed orbit or singular closed orbit contained in $G$. The function $B$ is called Dulac function.

Proof. This is because multiplying $B$ is only accelerating or decelerating the vector field $\bf$ and does not change its direction. In particular, using the proof of Bendixson's criterion, $B \bf$ is also parallel to the tangent vector of $\gamma$. So 

$$
	\int _U \div (B \bf) (\bx) \d \bx = \oint _\gamma B \bf \cdot \boldsymbol n \d \ell = 0.
$$

The next one has a similar inspiration as the Lyapunov function: if we can design a scalar field such that the orbit is always heading the downhill direction, it cannot loop back to itself. 

> [!Theorem]
> (Poincaré) If there exists a function $E \in C ^1 (G)$ such that 
> 
> $$
> 	\grad E (\bx) \cdot \bf (\bx) \ge 0.
> $$
> 
> Moreover, the set $\set{\bx \in G: \grad E (\bx) \cdot \bf (\bx) = 0}$ does not contain an entire orbit. Then there is no closed orbit or singular closed orbit contained in $G$.

Proof. We compute the derivative of $E$ along $\gamma$: 

$$
	0 = \oint _{\gamma} \d E = \int _{t _0} ^{t _0 + T} \grad E (\bu (t)) \cdot \bu' (t) \d t =  \int _{\gamma} \grad E (\bx) \cdot \bf (\bx) \d \ell \ge 0.
$$

Therefore $\grad E \cdot \bf \equiv 0$ on $\gamma$, contradicting the assumption.

## Existence of limit cycle

> [!Theorem]
> Under the assumptions of Poincaré-Bendixson theorem, there exists at least a limit cycle. If the vector field is inward on the boundary, then there exists a limit cycle stable from the outside, and a limit cycle stable from the inside (which could be the same one).

As stated in the beginning, finding limit cycle is extremely difficult in a general setting. The following is the second part of Hilbert's XVI problem (as in Hilbert's 23 problems):

Suppose $\bf$ is a polynomial of degree $n$. What is the maximum number of limit cycles?

In homework you are asked to prove the case $n = 1$. Even for $n = 2$ this is an open question. There exists an example of a quadratic dynamical system with four limit cycles, but it is open whether a quadratic dynamical system can have five limit cycles.

## Stability of a limit cycle

How to decide if a limit cycle is stable or not? That is, how to determine whether the orbits around it is cycling inward or outward? In principle, Poincaré-Bendixson helps to decide its stability if it is the unique limit cycle in the annulus region. However, Poincaré-Bendixson theorem does not tell the number of limit cycles. Determining whether it is stable or unstable is also in general difficult, but here we pitch an idea how to do this.

Suppose one has located a limit cycle and its explicit formulae is also determined (or numerically known up to certain accuracy). Suppose in addition one can find a $C ^1$ bijection of its neighborhood with $C ^1$ inverse, that transforms this limit cycle into a unit circle. Up to adjusting the speed and orientation, the new system can be written in polar coordinate as 

$$
	\begin{cases}
		r' (t) = \phi (r (t), \theta (t)) \\
		\theta' (t) = 1
	\end{cases}.
$$

Here $\phi: (1 - \e, 1 + \e) \times \mathbb T \to \R$ is $C ^1$ and satisfies $\phi (1, \theta) = 0$, because the unit circle is a closed orbit, and we have adjusted the speed such that it rotates at a unit speed. Then 

$$
	r' (t) = \phi (r (t), \theta (t)) = \partial _r \phi (1, \theta (t)) (r (t) - 1) + o (|r (t) - 1|).
$$

Using Grönwall inequality, 

$$
	r (t) - 1 = (r (0) - 1) \exp \pth{\int _{0} ^t \partial _r \phi (1, \theta (s)) \d s} + o (r (0) - 1).
$$

From $t = 0$ to $t = 2 \pi$, $\theta (t) = \theta (0) + t$ increases by exactly $2 \pi$, so for $r (0) \approx 1$, we have

$$
	r (2 \pi) - 1 \approx (r (0) - 1) \exp \pth{\int _{0} ^{2 \pi} \partial _r \phi (1, s) \d s}.
$$

If $\int _{0} ^{2 \pi} \partial _r \phi (1, s) \d s > 0$ then $r (2 \pi) > r (0)$, so the limit cycle is unstable. If $\int _{0} ^{2 \pi} \partial _r \phi (1, s) \d s < 0$ then the limit cycle is stable. If $\int _{0} ^{2 \pi} \partial _r \phi (1, s) \d s = 0$, then it is hard to tell unless we investigate higher derivatives.

Now, suppose the system 

$$
	\bu' (t) = \bf (\bu (t))
$$

has a periodic solution $\bu _{\Gamma} (t)$, whose period is $T$ and image is a closed orbit $\Gamma$. Moreover, for $\bx = \bu _{\Gamma} (t)$, denote $\boldsymbol n (t) = \boldsymbol n _{\boldsymbol x}$ to be the normal vector of $\Gamma$ at $\bx$. It is computed by 

$$
	\boldsymbol n (t) = \frac{\bu' _{\Gamma}  (t) ^\perp}{\abs{\bu' _{\Gamma}  (t)}} = \frac{\bf (\bu_{\Gamma}  (t)) ^\perp}{\abs{\bf (\bu_{\Gamma}  (t))}}.
$$

Let $\bu (t) = \bu _{\Gamma} (t) + z (t) \boldsymbol n (t)$. Then 

$$
	\bu' (t) = \bu _{\Gamma}' (t) + z' (t) \boldsymbol n (t) + z (t) \boldsymbol n' (t).
$$

where 

$$
	\bu' (t) = \bf (\bu (t)) = \bf (\bu _{\Gamma} (t) + z (t) \boldsymbol n (t)) = \bf (\bu _{\Gamma} (t)) + \nabla f (\bu _{\Gamma} (t)) \boldsymbol n (t) z (t) + o (\abs{z (t)}),
$$

and $\boldsymbol n' (t) \perp \boldsymbol n (t)$. Taking the dot product with $\boldsymbol n (t)$, we have

$$
	z' (t) = \boldsymbol n (t) ^\top \nabla \bf (\bu _{\Gamma} (t)) \boldsymbol n (t) z (t) + o (\abs{z (t)}).
$$

Same as before, by Grönwall we can show that $\Gamma$ is a stable/unstable limit cycle if the following integral is negative/positive:

$$
	I = \int _0 ^T \boldsymbol n (t) ^\top \nabla \bf (\bu _{\Gamma} (t)) \boldsymbol n (t) \d t.
$$

Note that for $\boldsymbol \ell (t) = \dfrac{\bu' _{\Gamma}  (t)}{\abs{\bu' _{\Gamma}  (t)}}$, it holds that 
                    
$$
	\int _0 ^T \boldsymbol \ell (t) ^\top \nabla \bf (\bu _{\Gamma} (t)) \boldsymbol \ell (t) \d t = \int _{0} ^T \frac{\nabla \bf (\bu _\Gamma (t))}{\abs{\bf (\bu _{\Gamma} (t))} ^2} \bf (\bu _\Gamma (t)) \cdot \bu' _{\Gamma} (t) \d t = \oint _{\Gamma} \grad \log \abs{\bf (\bx)} \cdot \d \ell = 0.
$$

Here we made the assumption that $\bf$ does not vanish, which is true on $\Gamma$. Hence 

$$
	I = \int _0 ^T \operatorname{div} \bf (\bu (t)) \d t.
$$

> [!Lemma]
> Let $\bu$ be a periodic solution to $\bu' (t) = \bf (\bu (t))$ of period $T$, and let $\Gamma$ be its trajectory. Define
> 
> $$
> 	I = \int _0 ^T \div \bf (\bu (t)) \d t.
> $$
> 
> If $I > 0$ then $\Gamma$ is an unstable limit cycle. If $I < 0$ then $\Gamma$ is a stable limit cycle. Whenever $I \neq 0$, $\Gamma$ is called a hyperbolic limit cycle.
