---
layout: post
title: "Hypergeometric Function"
date: 2019-11-06
use-math: true
---

### Definition

<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
        TeX: {
            Macros: {
                R: '\\mathbb R',
                d: '\\mathop{\\kern0pt\\mathrm{d}}\\!{}',
                dfr: ['\\frac{\\d #1}{\\d #2}', 2],
                pfr: ['\\frac{\\partial #1}{\\partial #2}', 2],
                pth: ['\\left(#1\\right)', 1],
                bkt: ['\\left[#1\\right]', 1],
                set: ['\\left\lbrace#1\\right\rbrace', 1]
            }
        }
    });
</script>

We first define $n$-product

$$
(q)_n = \begin{cases}
    1 & n = 0 \\
    q (q + 1) \cdots (q + n - 1) & n > 0
\end{cases}
$$

Hypergeometric functions has three parameter $a$, $b$ and $c$,

$$
F(a, b; c; z) = \sum _{n = 0} ^\infty \frac{
    (a)_n (b)_n
}{
    (c) _n 
} \frac{z^n}{n!}.
$$

### Properties

* Radius of convergence is $\lvert z\rvert<1$.

* Derivative is
  
  $$
  \frac{\partial F}{\partial z} (a, b; c; z) = \frac{ab}c F(a + 1, b + 1; c + 1; z)
  $$

* Hypergeometric function solves the **hypergeometric equation**
  
  $$
  z(1-z) \frac{\d ^2 w}{\d z ^2} + [c - (a + b + 1) z] \dfrac wz - ab \, w = 0.
  $$

* Value at $z = 1$ (**Gauss's theorem**): if $\Re (c) > \Re (a + b)$, then 

  $$
  F (a, b; c; 1) = \frac{\Gamma (c) \Gamma (c - a - b)}{\Gamma(c - a) \Gamma (c - b)}.
  $$

* **Euler transform**:

  $$
  F (a, b; c; z) = (1 - z)^{c - a - b} F (c - a, c - b; c; z).
  $$

* Expansion at $z = 1$: we can express it as a series of $1 - z$ by

  $$
  \begin{align*}
  F (a, b; c; z) &= \frac{\Gamma (c) \Gamma (c - a - b)}{\Gamma(c - a) \Gamma (c - b)} F (a, b; a + b + 1 - c; 1 - z) \\
  &\qquad + \frac{\Gamma (c) \Gamma (a + b - c)}{\Gamma(a) \Gamma (b)} (1 - z)^{c - a - b} F (c - a, c - b; 1 + c - a - b; 1 - z).
  \end{align*}
  $$
  
  this can be proven by a combination of Gauss's theorem and Euler transform.

