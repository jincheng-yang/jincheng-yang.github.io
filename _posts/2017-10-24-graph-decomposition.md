---
layout: post
title: "Graph Decomposition"
date: 2017-10-24
comments: true
---

## Introduction

A graph $$(V, E)$$ contains a vertex set $$V$$ connected by a set of edges $$E \subset V \times V$$. The **complete graph** $$K _n$$ has $$n$$ vertices, and each pair is connected by an edge. The followings are examples of complete graphs.

<div style="text-align:center">
	<img src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig-k5.svg" width="30%">
	<img src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig-k6.svg" width="25%">
	<img src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig-k7.svg" width="30%">
</div>

<p class="figure">Complete graphs \(K _5\), \(K _6\) and \(K _7\)</p>

A **Hamiltonian cycle** of a graph is a cycle that pass all vertices exactly once without walking repeated edges. For example, the orange cycle $$C _7$$ (a cycle with 7 vertices) is a Hamiltonian cycle in $$K _7$$.

<div id="fig2" style="text-align:center">
	<img class="emerge" src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig-c7.svg" width="40%"><img class="disappear" src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig-k7.svg" width="40%">
</div>

<p class="figure">A Hamiltonian Cycle \(C _7\) in \(K _7\)</p>

Can we decompose a complete graph into Hamiltonian cycles? This is a classical problem in the field of graph decomposition. More specifically, we want to know if we can write the edge set $$E$$ as a union of cycles, each passes all the vertices.

## Decomposition of $$K_n$$ into $$C_n$$'s

For what $$n$$ can we decompose $$K_n$$ into $$mC_n$$? First, let's check number of edges. If $$K _n$$ can be decomposed, then the number of edges of $$K _n$$ must be a multiple of number of edges in $$C _n$$, which has $$n$$ edges. A complete graph $$K _n$$ has $$\left(
\begin{array}{c}
n\\
2
\end{array}
\right) = \displaystyle{\frac{n(n-1)}{2}}$$ edges. It is a multiple of $$n$$ if and only if $$\displaystyle{\frac{n-1}{2}}$$ is an integer, i.e. $$n$$ must be odd.

<div id="fig3" style="text-align:center">
	<img class="mvleft" src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig1.svg" width="30%"><img class="mvmiddle" src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig2.svg" width="30%"><img class="mvright" src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig3.svg" width="30%">
</div>

<p class="figure">Decompose \(K _7\) into \(3C _7\)</p>

Therefore, $$K _{2n}$$ can never be decomposed into $$m C _{2n}$$, but it is possible for $$K _{2n + 1}$$ to be decomposed into $$n$$ $$C _{2n+1}$$'s for $$n \geq 1$$. $$K _3 = C _3$$ is trivial, $$K _5 = 2 C _5$$ because it can be decomposed into a pentagon and a star. $$K _7$$ can be decomposed as the animation above. How about general $$K _{2n + 1}$$?

If $$2n+1$$ is a prime number, then the decomposition can be easily done as the following. Let 

$$
\begin{align*}
V = \mathbb{Z} _{2n + 1} = \left\lbrace 1, w, w ^2, \dots, w ^{2n} \right\rbrace,
\end{align*}
$$

where $$w = e^{\frac{2\pi i}{2n + 1}}$$. Then $$w ^0 \rightarrow w ^1 \rightarrow w ^2 \rightarrow \cdots \rightarrow w ^{2n} \rightarrow w ^0$$ is a cycle. $$w ^0 \rightarrow w ^2 \rightarrow w ^4 \rightarrow \cdots \rightarrow w ^{4n} \rightarrow w ^0$$ is another cycle. Similarly, we can draw a cycle $$w ^0 \rightarrow w ^m \rightarrow w ^{2m} \rightarrow \cdots \rightarrow w ^{2nm} \rightarrow w ^0$$ in $$K _{2n + 1}$$, as long as $$m$$ and $$2n + 1$$ are relatively prime. Therefore, if $$2n + 1$$ is prime, then any integer between $$1$$ and $$n$$ is relatively prime to $$2n + 1$$, so we can break $$K _{2n + 1}$$ into $$n$$ cycles.

For convenience, we call edge connecting $$w ^k$$ and $$w ^{k + p}$$ an **edge of length** $$\boldsymbol{p}$$. Thus edges of length $$p$$ form a Hamilton cycle in $$K _{n}$$ iff $$(p, n) = 1$$. For example, $$1$$-edges (blue edges), $$2$$-edges (green edges) and $$3$$-edges (orange edges) form three Hamiltonian cycles in $$K _7$$. $$1$$-edges form a Hamiltonian cycle in $$K _6$$, but $$2$$-edges do not form a Hamiltonian cycle, but two triangles in $$K _6$$ instead.

Up to now, we can decompose any complete graph with odd prime number of vertices into Hamiltonian cycles. How about odd composite number of vertices? It is more tricky to think about, but there is actually a universal way to deal with any complete graph with odd number of vertices.

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
	$(window).scroll(function() {
		var displacement1 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig2').offsetTop + $(window).height() / 2) * 1.5, 0), 300);
		var displacement2 = Math.min(Math.max(($(window).scrollTop() - document.getElementById('fig3').offsetTop + $(window).height() / 2) * 1.5, 0), 300) / 9;
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
	});
</script>