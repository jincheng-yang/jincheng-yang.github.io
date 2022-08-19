---
layout: post
title: "Graph Decomposition"
date: 2017-10-24
comments: true
image: true
use-math: true
thumb: graph-decomposition.svg
---

### Introduction

A graph $V, E$ contains a vertex set $V$ connected by a set of edges $E \subset V \times V$. The **complete graph** $K _n$ has $n$ vertices, and each pair is connected by an edge. The followings are examples of complete graphs. 

<div style="text-align:center">
    <img src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig-k5.svg" width="30%">
    <img src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig-k6.svg" width="25%">
    <img src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig-k7.svg" width="30%">
</div>

<p class="figure">Complete graphs $K _5$, $K _6$ and $K _7$</p>

A **Hamiltonian cycle** of a graph is a cycle that pass all vertices exactly once without walking repeated edges. For example, the orange cycle $C _7$, a cycle with 7 vertices, is a Hamiltonian cycle in $K _7$.

<div id="fig2" style="text-align:center">
    <img class="emerge" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig-c7.svg" width="40%"><img class="disappear" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig-k7.svg" width="40%">
</div>

<p class="figure">A Hamiltonian Cycle $C _7$ in $K _7$</p>

Can we decompose a complete graph into Hamiltonian cycles? This is a classical problem in the field of graph decomposition. More specifically, we want to know if we can write the edge set $E$ as a union of cycles, each passes all the vertices.

### Decomposition of $K_n$ into $C_n$'s

For what $n$ can we decompose $K_n$ into $mC_n$? First, let's check number of edges. If $K _n$ can be decomposed, then the number of edges of $K _n$ must be a multiple of number of edges in $C _n$, which has $n$ edges. A complete graph $K _n$ has $\mathcal{C} ^2 _n = \dfrac{n(n-1)}{2}$ edges. It is a multiple of $n$ if and only if $\dfrac{n-1}{2}$ is an integer, i.e. $n$ must be odd.

<div id="fig3" style="text-align:center">
    <img class="mvleft" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig1.svg" width="30%"><img class="mvmiddle" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig2.svg" width="30%"><img class="mvright" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/fig3.svg" width="30%">
</div>

<p class="figure">Decompose $K _7$ into $3C _7$</p>

Therefore, $K _{2n}$ can never be decomposed into $m C _{2n}$, but it is possible for $K _{2n + 1}$ to be decomposed into $n$ $C _{2n+1}$'s for $n \geq 1$. $K _3 = C _3$ is trivial, $K _5 = 2 C _5$ because it can be decomposed into a pentagon and a star. $K _7$ can be decomposed as the animation above. How about general $K _{2n + 1}$?

If $2n+1$ is a prime number, then the decomposition can be easily done as the following. Let 

$$
\begin{align*}
V = \mathbb{Z} _{2n + 1} = \left\lbrace 1, w, w ^2, \dots, w ^{2n} \right\rbrace,
\end{align*}
$$

where $w = e^{\frac{2\pi i}{2n + 1}}$. Then $w ^0 \rightarrow w ^1 \rightarrow w ^2 \rightarrow \cdots \rightarrow w ^{2n} \rightarrow w ^0$ is a cycle. $w ^0 \rightarrow w ^2 \rightarrow w ^4 \rightarrow \cdots \rightarrow w ^{4n} \rightarrow w ^0$ is another cycle. Similarly, we can draw a cycle $w ^0 \rightarrow w ^m \rightarrow w ^{2m} \rightarrow \cdots \rightarrow w ^{2nm} \rightarrow w ^0$ in $K _{2n + 1}$, as long as $m$ and $2n + 1$ are relatively prime. Therefore, if $2n + 1$ is prime, then any integer between $1$ and $n$ is relatively prime to $2n + 1$, so we can break $K _{2n + 1}$ into $n$ cycles.

For convenience, we call edge connecting $w ^k$ and $w ^{k + p}$ an **edge of length** $\boldsymbol{p}$. Thus edges of length $p$ form a Hamilton cycle in $K _{n}$ iff $(p, n) = 1$. For example, $1$-edges (blue edges), $2$-edges (green edges) and $3$-edges (orange edges) form three Hamiltonian cycles in $K _7$. $1$-edges form a Hamiltonian cycle in $K _6$, but $2$-edges do not form a Hamiltonian cycle, but two triangles in $K _6$ instead.

Up to now, we can decompose any complete graph with odd prime number of vertices into Hamiltonian cycles. How about odd composite number of vertices? It is more tricky to think about, but there is actually a universal way to deal with any complete graph with odd number of vertices.

**Proposition (Walecki)** There exist a Hamiltonian cycle decomposition of $K _{2n + 1}$ when $n \in \mathbb{N}^*$.

*Proof*  Label the points as $\{0, 1, w, w^2, \dots, w^{2n - 1} \}$ where $w = e^{\frac{2\pi i}{2n}}$. Then 

\begin{align}
C^0 := 0 \rightarrow 1 \rightarrow w \rightarrow w^{-1} \rightarrow w ^2 \rightarrow w ^{-2} \rightarrow \dots \rightarrow w ^{n - 1} \rightarrow w ^{-n + 1} \rightarrow -1 \rightarrow 0 \notag
\end{align}

is a Hamiltonian cycle. $C^k := w^k C ^0$ (element-wise multiplication) is also a Hamiltonian cycle, since it is just a rotation of $C ^0$. The quotient of consecutive endpoints in each cycle are $\{\infty, w, w^{-2}, w^3, w^{-4}, \dots, w^{-(2n-2)}, w^{2n-1}, 0\}$, which are all different. Therefore, if considering dirction of edges, then $\{C ^k, k = 0, 1, \dots, 2n-1 \}$ are $2n$ pairwise disjoint directed Hamiltonian cycles. But $C ^k$ and $C ^{k + n}$ are exactly the same graph with opposite directioning. Therefore, $\{C ^k, k = 0, 1, \dots, n - 1 \}$ are $n$ pairwise disjoint (nondirected) Hamiltonian cycles.

Graphically, it can be seen as the following.

<div id="fig4" style="text-align:center">
    <img class="mvll" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/w9-0.svg" width="25%"><img class="mvl" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/w9-2.svg" width="25%"><img class="mvr" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/w9-1.svg" width="25%"><img class="mvrr" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/w9-3.svg" width="25%">
</div>

<p class="figure">Walecki Decomposition of $K _9$ into $4C _3$</p>

### Subgraph with Edges of Two Lengths

We known that all the edges of length $k$ forms a Hamiltonian cycle in $K_n$ iff $(k, n)=1$. Moreover, if $(k, n)=d$, then edges of length $k$ forms $d$ cycles $C_{n/d}$. The main question is the following.

> Can we divide the subgraph of $K _n$, which is consisted by edges of length $k$ and length $l$, into two Hamiltonian cycles?

For convenience, we denote the subgraph of $K _n$ consisted by edges of length $k$ and length $l$ by $K _n ^{k, l}$. The following is an example of $K _9 ^{1, 3}$, with blue 1-edges and orange 3-edges.

<div class="boxl">

<div id="fig5" style="text-align:center">
    <img src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/k9-1-3.svg" width="40%">
</div>

<p class="figure">Graph $K _9 ^{1, 3}$</p>

</div>

<div class="boxr">

<div id="fig6" style="text-align:center">
    <img class="mvlll" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/k9-1-3-1.svg" width="40%"><img class="mvrrr" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/k9-1-3-2.svg" width="40%">
</div>

<p class="figure">$K _9 ^{1, 3} = 2C _9 $</p>

</div>

<p style='overflow:visible'>
Why we are interested in $K _9 ^{1, 3}$? We know that $K _9 ^1$, $K _9 ^2$, $K _9 ^4$ are Hamiltonian cycles, but $K _9 ^3$ is not. However, since $K _9 ^{1, 3}$ can be decomposed into 2 Hamiltonian cycles, we can still break $K _9$ into four Hamiltonian cycles.
</p>


It is not clear to me what kind of $K _n ^{k, l}$ can be broken into two Hamiltonian cycles. Never the less, there are some simple observations.

**Proposition 1** If $(n, k) = (n, l) = 1$, then $K _n ^{k, l}$ can be broken into two Hamiltonian cycles.

*Proof* $K _n ^{k}$ and $K _n ^{l}$ are both Hamiltonian cycles, so.

**Proposition 2** If $(n, k, l) > 1$, then $K _n ^{k, l}$ cannot be broken into two Hamiltonian cycles.

*Proof* If $d = (n, k, l) > 1$, then $w ^m$ can only be in the same cycle with $w ^{m + dp}$. $w ^{m + 1}$, for instance, cannot be reached via any path.

**Proposition 3** If $K _n ^{k, l}$ is breakable, then $K _n ^{mk, ml}$ is breakable, where $m$ is relatively prime to $n$.

*Proof* $w \mapsto w^m$ is a bijection.

I barely know anything more than these.

It should be noted that even though most cases I constructed are symmetric, there are still non-symmetric cases, for example $K _{12} ^{1,4}$.

<div class="boxl">

<div id="fig5" style="text-align:center">
    <img src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/k12-1-4.svg" width="40%">
</div>

<p class="figure">Graph $K _{12} ^{1, 4}$</p>

</div>

<div class="boxr">
<div id="fig7" style="text-align:center">
    <img class="mvllll" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/k12-1-4-1.svg" width="40%"><img class="mvrrrr" src="{{ site.roooot }}/assets/images/blog/2017-10-24-graph-decomposition/k12-1-4-2.svg" width="40%">
</div>

<p class="figure">$K _{12} ^{1, 4} = 2C _{12} $</p>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
    $(".emerge").css({
        "opacity": 0, 
        "position": "relative",
        "left": 20 + "%"
    });
    $(".disappear").css({
        "position": "relative",
        "left": -20 + "%"
    });
    $(".mvleft").css({
        "position": "relative",
        "left": -30 + "%"
    });
    $(".mvmiddle").css({
        "position": "relative",
    });
    $(".mvright").css({
        "position": "relative",
        "left": 30 + "%"
    });
    $(".mvll").css({
        "position": "relative",
        "left": -37.5 + "%"
    });
    $(".mvl").css({
        "position": "relative",
        "left": -12.5 + "%"
    });
    $(".mvr").css({
        "position": "relative",
        "left": 12.5 + "%"
    });
    $(".mvrr").css({
        "position": "relative",
        "left": 37.5 + "%"
    });
    $(".mvlll").css({
        "position": "relative",
        "left": -20 + "%"
    });
    $(".mvrrr").css({
        "position": "relative",
        "left": 20 + "%"
    });
    $(".mvllll").css({
        "position": "relative",
        "left": -20 + "%"
    });
    $(".mvrrrr").css({
        "position": "relative",
        "left": 20 + "%"
    });
    $(".boxl").css({
        "width": "50%",
        "float": "left"
    });
    $(".boxr").css({
        "width": "50%",
        "float": "left"
    });
    $(window).scroll(function() {
        var displacement1 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig2').offsetTop + $(window).height() / 2) * 1.5, 0), 300);
        var displacement2 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig3').offsetTop + $(window).height() / 2) * 1.5, 0), 300) / 9;        var displacement3 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig4').offsetTop + $(window).height() / 2) * 1.5, 0), 300) / 7.5;        var displacement4 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig6').offsetTop + $(window).height() / 2) * 1.5, 0), 300) / 12;        var displacement5 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig7').offsetTop + $(window).height() / 2) * 1.5, 0), 300) / 12;
        $(".emerge").css({
            "opacity": "" + displacement1 / 300
        });
        $(".disappear").css({
            "opacity": "" + 1 - displacement1 / 350
        });
        $(".mvleft").css({
            "left": 30 - displacement2 + "%"
        });
        $(".mvright").css({
            "left": -30 + displacement2 + "%"
        });
        $(".mvll").css({
            "left": 37.5 - displacement3 + "%"
        });
        $(".mvl").css({
            "left": 12.5 + displacement3 / 3 + "%"
        });
        $(".mvr").css({
            "left": -12.5 - displacement3 / 3 + "%"
        });
        $(".mvrr").css({
            "left": -37.5 + displacement3 + "%"
        });
        $(".mvlll").css({
            "left": 20 + displacement4 + "%"
        });
        $(".mvrrr").css({
            "left": -20 - displacement4 + "%"
        });
        $(".mvllll").css({
            "left": 20 + displacement5 + "%"
        });
        $(".mvrrrr").css({
            "left": -20 - displacement5 + "%"
        });
    });
</script>
