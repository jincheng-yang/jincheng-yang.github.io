---
layout: post
title: "Graph Decomposition"
date: 2017-10-24
comments: true
---

This is a graph.

<div style="margin-left:250px">
<div class="mvright" style="position:absolute">
	<img src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig1.svg" width="300px">
</div>

<div style="position:absolute">
	<img src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig3.svg" width="300px">
</div>

<div class="mvleft">
	<img src="/users/jcyang/assets/images/blog/2017-10-24-graph-decomposition/fig2.svg" width="300px">
</div>
</div>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script>				
$(window).scroll(function() {
			var displacement = Math.min(Math.max($(window).scrollTop() * 1.5, 0), 300);
			  $(".mvright").css({
				"margin-left": displacement + "px"
			  });
			  $(".mvleft").css({
				"margin-left": - displacement + "px"
			  });
			});
</script>