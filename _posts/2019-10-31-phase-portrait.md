---
layout: post
title: "Phase Portriat"
date: 2019-10-31
comments: true
image: false
---

<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/6.2.5/math.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.6/MathJax.js?config=TeX-AMS_CHTML"></script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    TeX: {
      equationNumbers: {
        autoNumber: "AMS"
      },
      extensions: [
        "AMSmath.js",
        "AMSsymbols.js",
        "noErrors.js",
        "noUndefined.js",
      ]
    },
    tex2jax: {
      inlineMath: [ ['$','$'] ],
      displayMath: [ ['$$','$$'] ],
      processEscapes: true,
    },
    jax: ["input/TeX", "output/CommonHTML"]
  });
</script>


This is an active phase-portrait plotter for two dimensional dynamical systems. With the help from `math.js`, `MathJax.js`, `d3.js`, I created a cross-platform web-based phase portrait animator. 

I refer to an [example](https://bl.ocks.org/mbostock/db6b4335bf1662b413e7968910104f0f) for plotting the axes.

<div id="menu" style="text-align:center">
    <p>
      <span id="dot_x" onclick="edit_dot_x()">
        $\dot x = 3xy + \sin (y) $
      </span>
    </p>
    <p id="dot_x_input" style="display: none;">
      $\dot x = $ <input id='input_vx' type='text' value='3xy+sin(y)' onkeydown="if(event.keyCode==13){updateVelocityByString()}">
    </p>
    <p>
      <span id="dot_y" onclick="edit_dot_y()">
        $\dot y = 5 y^2 - 6 x y ^3 + 2 \cos (x + y) $
      </span>
    </p>
    <p id="dot_y_input" style="display: none;">
      $\dot y = $ <input id='input_vy' type='text' value='5y^2-6xy^3+2cos(x+y)' onkeydown="if(event.keyCode==13){updateVelocityByString()}">
    </p>
    <div id="an_svg"></div>
</div>

<script type="text/javascript">
    document.getElementById("an_svg").innerHTML = "<svg height = 600 width = 600></svg>"

    var input_vx, input_vy
    var code_vx, code_vy
    const function_list = ['sin', 'cos', 'exp', 'log', 'tan', 'cot', 'sec', 'csc']
    
    input_vx = "3x + 2y"
    input_vy = "-2x + 3xy"
    
    updateVelocity()
    
    function updateVelocityByString() {
      input_vx = document.getElementById("input_vx").value.replace(/\s/g, "")
      input_vy = document.getElementById("input_vy").value.replace(/\s/g, "")
      updateVelocity()
      d3.select("#dot_x")
        .style("display", "block")
      d3.select("#dot_x_input")
        .style("display", "none")
      d3.select("#dot_y")
        .style("display", "block")
      d3.select("#dot_y_input")
        .style("display", "none")
    }
    
    function updateVelocity() {
      
      // update latex formulae
      var latex_vx = input_vx
      var latex_vy = input_vy
      for (var func of function_list) {
        latex_vx = latex_vx.split(func).join('\\'+func)	
        latex_vy = latex_vy.split(func).join('\\'+func)	
      }
      
      d3.select("#dot_x")
        .text("$\\dot x = " + latex_vx + "$")
        .style("{display: block}")
      d3.select("#dot_y")
        .text("$\\dot y = " + latex_vy + "$")

      MathJax.Hub.Typeset()
      
      head = document.head || document.getElementsByTagName('head')[0],
      style = document.createElement('style');
      head.appendChild(style);
      stylesheet = ".axis line{stroke: #BBBBBB;} .axis text{font-size: 1.5em; color: #666666;} .minor line{stroke: #EEEEEE;} .minor text { display: none; } #dot_x { cursor: pointer; } #dot_y { cursor: pointer; }"
      document.getElementsByTagName("style")[0].innerHTML += stylesheet

      // update velocity function
      var str_vx = input_vx.split("xy").join(" x y ").split("yx").join(" x y ")
      var str_vy = input_vy.split("xy").join(" x y ").split("yx").join(" y x ")
      code_vx = math.parse(str_vx).compile()
      code_vy = math.parse(str_vy).compile()
    }

    function edit_dot_x() {
      d3.select("#dot_x")
        .style("display", "none")
      d3.select("#dot_x_input")
        .style("display", "block")
    }

    function edit_dot_y() {
      d3.select("#dot_y")
        .style("display", "none")
      d3.select("#dot_y_input")
        .style("display", "block")
    }

</script>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjs/6.2.5/math.js"></script>
<script src='/users/jcyang/plugin/coordinate.js'></script>
<script src='/users/jcyang/release/phase-portrait.js'></script>

Click [here](/users/jcyang/release/phase-portrait.html) for a full screen version.
