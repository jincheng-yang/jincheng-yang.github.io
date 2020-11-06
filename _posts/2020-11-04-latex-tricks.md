---
layout: post
title: "Latex Trick"
date: 2020-11-04
use-math: true
hide: true
---

### expandafter

Used to change the order of expansion of macros.

Don't quite understand.

### noexpandarg

Don't know either.

### StrSubstitute

Substitute arguments. 

``` latex
\usepackage{xstring}
\StrSubstitute{A Very Long Sentense}{Very Long}{Short}
% Output: A Short Sentense
```

### csname, endcsname

Used to form the name of a command.

``` latex
\newcommand{\xxx}{beg}
\csname \xxx in\endcsname {align}
    3 + 5
\end{align}
% This is equivalent to 
% \begin{align}
%   3 + 5
% \end{align}
```

### Automatically Align Equations

``` latex
\usepackage{xstring}
\StrSubstitute[1]{#1}{=}{myfirstequalitysign}[\x]
\expandafter\StrSubstitute\expandafter{\x}{=}{\\&=}[\x]
\expandafter\StrSubstitute\expandafter{\x}{<}{\\&<}[\x]
\expandafter\StrSubstitute\expandafter{\x}{>}{\\&>}[\x]
\expandafter\StrSubstitute\expandafter{\x}{\le}{\\&\le}[\x]
\expandafter\StrSubstitute\expandafter{\x}{\ge}{\\&\ge}[\x]
\expandafter\StrSubstitute\expandafter{\x}{myfirstequalitysign}{&=}[\x]
\begin{align*}
    \x
\end{align*}
```