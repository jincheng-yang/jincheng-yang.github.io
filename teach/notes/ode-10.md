---
layout: note
title: "Lecture 10: critical points"
use-math: true
---

# Properties of critical points

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
\newcommand{\bA}{\boldsymbol A}
\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
$$

## Stability

> [!Definition]
> Let $\bx _0 \in \R ^d$ be a critical point of the autonomous system $\bu' (t) = \bf (\bu (t))$, so $\bf (\bx _0) = \boldsymbol 0$. 
> 1. $\bx _0$ is *stable* if for every $\e > 0$, there exists $\delta > 0$, if $\abs{\bu (0) - \bx _0} < \delta$, then $\abs{\bu (t) - \bx _0} < \e$ for all $t > 0$.
> 2. $\bx _0$ is attractive if for some $\delta > 0$, if $\abs{\bu (0) - \bx _0} \le \delta$, then $\lim _{t \to +\infty} \abs{\bu (t) - \bx _0} = 0$.
> 3. $\bx _0$ is globally attractive if it is attractive for every $\delta > 0$.
> 4. $\bx _0$ is strictly stable if it is both stable and attractive. 
> 5. $\bx _0$ is neutrally stable if it is stable but not attractive.
> 6. $\bx _0$ is unstable if it is not stable.

> [!Remark]
> $\bx _0$ is attractive means $\bx _0$ has a $\delta$-neighborhood which is *eventually* attracted to $\bx _0$. That is, for every $\e > 0$, there exists $T > 0$ (could depend on both $\delta$ and $\e$), such that $\abs{u (t) - \bx _0} < \e$ for all $t > T$. It is possible to be attractive but not stable. 

> [!Theorem]
> The critical point $\boldsymbol 0$ of $\bu' (t) = \bA \bu (t)$ is attractive if and only if every eigenvalue of $\bA$ has a negative real part. In this case, the system is also strictly stable.

Proof. If a nonnegative real eigenvalue $\lambda$ exists and there is a corresponding eigenvector $\bv$ of unit length, then $\bu (t) = \frac\delta2 e ^{\lambda t} \bv$ is a solution with $\abs{\bu (0)} < \delta$, but $\lim _{t \to +\infty} \abs{\bu (t)} = \lim _{t \to +\infty} \frac\delta2 e ^{\lambda t} \neq 0$. If a complex eigenvalue $\lambda = \alpha + i \beta$ has nonnegative real part $\alpha \ge 0$, and there is a corresponding unit complex eigenvector $\bv = \bv _{\Re} + i \bv _{\Im}$ (that is, $\abs{\bv} ^2 = \abs{\bv _\Re} ^2 + \abs{\bv _{\Im}} ^2 = 1$), then $\bu (t) = \frac\delta2 e ^{\alpha t} (\cos (\beta t) \bv _{\Re} - \sin (\beta t) \bv _{\Im})$ does not converge to zero as $t \to +\infty$. If all eigenvalue has negative real parts $\alpha < 0$, then we have independent solutions that are $e ^{\alpha t} O (t ^d)$ as $t \to +\infty$, where the $O (t ^d)$ part is a combination of sine, cosine, and polynomials. So each independent solution converges to zero exponentially, thus their linear combinations also converges to zero exponentially.

## Lyapunov functional

How to decide if a critical point is stable or attractive? We can use Lyapunov functional. 

A Lyapunov function $E: B _\delta (\bx _0) \subset \Rd \to \R$ for a critical point $\bx _0$ to the autonomous system $\bu' (t) = \bf (\bu (t))$ is a differentiable function that assumes its global minimum at $\bx _0$ and satisfies 

$$
	\grad E (\bx) \cdot \bf (\bx) < 0, \qquad \forall \bx \in B _\delta (\bx _0), \bx \neq \bx _0.
$$

For any solution $\bu (t)$, we deduce from the chain rule that

$$
	\ddt E (\bu (t)) = \grad E (\bu (t)) \cdot \bu' (t) = \grad E (\bu (t)) \cdot \bf (\bu (t)) < 0.
$$

So Lyapunov function decreases along any orbit. If we can furthermore deduce that $\lim_{t \to +\infty} E (\bu (t)) = \min _{\bx \in \Rd} E (\bx) = E (\bx _0)$, then it must happen that $\bu (t) \to \bx _0$ as $t \to +\infty$ (why?).

