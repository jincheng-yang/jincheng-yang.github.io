---
layout: post
title: "Guiguzi Problem"
date: 2020-10-15
comments: true
use-math: true
---

### Statement of the Problem

Cindy chose two different natural numbers between $2$ and $99$. She told Alice the sum and then she told Bob the product, then she left. And the following is a dialogue between Alice and Bob.

> `(P1)` Alice: I don't know the two numbers, but `(P2)` I know you don't know either.

> `(P3)` Bob: I didn't know, but now I know.

> `(P4)` Alice: Now I know, too.

What are the numbers?

### Set Theory

First we reformulate this question using the language of set theory.

Let $D = \\{(a, b) \in \mathbb N ^2: 1 < a < b < 100\\},$ and 

$$
\begin{aligned}
    s : D &\to \mathbb N & p: D &\to \mathbb N \\
    (a, b) &\to a + b & (a, b) &\to a \cdot b.
\end{aligned}
$$

Suppose Alice was told the sum is $x$ and Bob was told the product is $y$. 

Denote $D _A = s ^{-1} (x)$ and $D _B = p ^{-1} (y)$. These are private informations for Alice and Bob. Before the dialogue starts, the public information is just $(a, b)$ belongs to the set $D$, $a + b$ belongs to $X = s (D)$, and $a \cdot b$ belongs to $Y = p (D)$.

Let's rewind the dialogue.

> `(P1)` Alice: I don't know the two numbers.

This is the first piece of public information: $D _A$ has more than one element, so $x$ must belong to

$$
\begin{aligned}
    X _1 := \{ m \in X: |s ^{-1} (m)| > 1 \}.
\end{aligned}
$$

> `(P2)` Alice: but I know you don't know either.

This means she is sure that for any $(a, b) \in D _A$, $p (a, b)$ is in the following set,

$$
\begin{aligned}
    Y _1 := \{ n \in Y: |p ^{-1} (n)| > 1 \}.
\end{aligned}
$$

So `(P2)` means 

$$
\begin{aligned}
    D _A = s ^{-1} (x) \subset p ^{-1} (Y _1).
\end{aligned}
$$

This provides the second piece of information, $x$ must be inside

$$
\begin{aligned}
    X _2 = \{ m \in X _1: s ^{-1} (m) \subset p ^{-1} (Y _1) \},
\end{aligned}
$$

so after this step, the public informations are $(a, b)$ and $y$ belong to 

$$
\begin{aligned}
    D _2 = s ^{-1}(X _2), \qquad Y _2 = p(D _2).
\end{aligned}
$$

> `(P3)` Bob: Now I know.

`(P3)` means

$$
\begin{aligned}
    |D _2 \cap D _B| = 1.
\end{aligned}
$$

This provides a third information, $y$ must be inside

$$
\begin{aligned}
    Y _3 = \{n \in Y _2: |D _2 \cap p ^{-1} (n)| = 1 \}.
\end{aligned}
$$

So $(a, b)$ and $x$ must be inside 

$$
\begin{aligned}
    D _3 = D _2 \cap p ^{-1} (Y _3), \qquad X _3 = s (D _3).
\end{aligned}
$$

> `(P4)` Alice: Now I know, too.

`(P4)` means 

$$
\begin{aligned}
    |D _3 \cap D _A| = 1.
\end{aligned}
$$

This provides the last information, $x$ must be inside 

$$
\begin{aligned}
    X _4 = \{ m \in X _3: |D _3 \cap s ^{-1} (m)| = 1\}.
\end{aligned}
$$

and $(a, b)$ and $y$ are inside

$$
\begin{aligned}
    D _4 = D _3 \cap s ^{-1} (X _4), \qquad Y _4 = s (D _4).
\end{aligned}
$$

After this formulation, we provide two ways to solve it: either by math, or by coding.

### Number Theory

Now we use the number theory to determine each set. 

Start from $X$ and $Y$, clearly 

$$
\begin{aligned}
    X = \{ m \in \mathbb N: 5 \le m \le 197 \}.
\end{aligned}
$$

$Y$ is hard to characterise, so we just let it be. From the first public information, 

$$
\begin{aligned}
    X _1 := \{ m \in \mathbb N: 5 \le m \le 197, |s ^{-1} (m)| > 1 \},
\end{aligned}
$$

$x$ can be separated as the sums in at least two ways, so $x$ cannot be $5 = 2 + 3, 6 = 2 + 4, 196 = 97 + 99, 197 = 98 + 99$, which can only be uniquely decomposed as sums. Therefore

$$
\begin{aligned}
    X _1 := \{ m \in \mathbb N: 7 \le m \le 195 \}.
\end{aligned}
$$

Now for $Y _1$, one possible type of $n \notin Y _1$ that can only be uniquely decomposed are the product of prime numbers, so if we call

$$
\begin{aligned}
    Y _1 ^* := \{ p _1 \cdot p _2: p _1, p _2 \le 99 \text{ are prime} \}
\end{aligned}
$$

we have $Y _1 ^* \cap Y _1 = \varnothing$. So in $X _1$ we can exclude most even numbers (they can be expressed as a sum of primes by the famous Goldbach's Conjecture) and also the sum of 2 and odd prime number. This leaves us with 

$$
\begin{aligned}
    X _2 \subset \{
        11, 17, 23, 27, 29, 35, 37, 41, 47, 51, 53, 57, 59, 65, 67, 71, 77, 79, 83, 87, 89, 93, 95, 97, \dots
    \}
\end{aligned}
$$

We can also eliminate the ones that are too large to have alternative choices. The product of anything with large prime numbers can only have one possibility, if we call

$$
\begin{aligned}
    Y _2 ^* := \{ p \cdot m: 50 \le p \le 99 \text{ is prime}, 2 \le m \le 99 \}
\end{aligned}
$$

we have $Y _2 ^* \cap Y _1 = \varnothing$. 

Every number greater than $55$ can be written as the sum of a prime number between $50$ and $99$ and something else:

$$
\begin{aligned}
    n &= 53 + (n - 53), \qquad 55 \le n \le 152, \\
    n &= 97 + (n - 97), \qquad 152 \le n \le 195.
\end{aligned}
$$

Therefore every element in $X _1$ is smaller than $55$, thus

$$
\begin{aligned}
    X _2 \subset \{
        11, 17, 23, 27, 29, 35, 37, 41, 47, 51, 53
    \}.
\end{aligned}
$$

We almost have equality here because every summation decomposition of numbers here must be 2 plus a composite number, or even number plus odd number. Their product always have alternative expression. The only exception is $51 = 17 + 34$, $17 \times 34$ have no other decomposition because $17$ is prime and half of $34$, and we only have this one case. So 

$$
\begin{aligned}
    X _2 = \{
        11, 17, 23, 27, 29, 35, 37, 41, 47, 53
    \}.
\end{aligned}
$$

Now we think about elements in $Y _3$. For $n$ in $Y _3$, it has more than one way of product decomposition, but only one decomposition has sum in $X _2$. One possibility is 

$$
\begin{aligned}
    Y _3 ^* = \{
        2 ^k \cdot p: 2 \le k \le 5, p \text{ is prime}, 2 ^k + p \in X _2
    \}.
\end{aligned}
$$

Then if $n = 2 ^k \cdot p$, $2 ^k + p \in X _2$, so $n \in Y _2$. Moreover, any other product decomposition of $2 ^k \cdot p$ will be the product of even numbers, so their sum is even and cannot be inside $X _2$. Therefore $Y _3 ^* \subset Y _3$. Let's write out the elements in $Y _3 ^*$:

$$
\begin{aligned}
    Y _3 ^* = \{
        &2 ^3 \cdot 3, \\
        &2 ^2 \cdot 13, \\
        &2 ^2 \cdot 19, 2 ^4 \cdot 7, \\
        &2 ^2 \cdot 23, 2 ^3 \cdot 19, 2 ^4 \cdot 11, \\
        &2 ^4 \cdot 13, \\
        &2 ^2 \cdot 31, 2 ^4 \cdot 19, 2 ^5 \cdot 3, \\
        &2 ^3 \cdot 29, 2 ^5 \cdot 5, \\
        &2 ^2 \cdot 37, \\
        &2 ^2 \cdot 43, 2 ^4 \cdot 31, \\
        &2 ^4 \cdot 37
    \}.
\end{aligned}
$$

Another possibility is 

$$
\begin{aligned}
    Y _3 ^{**} = \{
        2 ^k \cdot p ^l: p = 3 \text{ or } 5, l \ge 2, 2 ^k + 3 ^l \in X _2 
    \} \setminus \{ 2 ^3 \cdot 3 ^2, 2 \cdot 5 ^3 \}.
\end{aligned}
$$

Then if $n = 2 ^k \cdot p ^l$, $2 ^k + p ^l \in X _2$, so $n \in Y _2$. Moreover, any other product decomposition of $2 ^k \cdot p ^l$ will either be the product of even numbers, or a product of multiple of $p$, so their sum is either even or multiple of $p$ and cannot be inside $X _2$ (the only exceptions are $27 = (2 ^3 \cdot 3) + 3$ and $35 = (2 \cdot 5) + 5 ^2$). Therefore $Y _3 ^{**} \subset Y _3$. It is

$$
\begin{aligned}
    Y _3 ^{**} = \{
        &2 ^1 \cdot 3 ^2, \\
        &2 ^1 \cdot 5 ^2, \\
        &2 ^1 \cdot 3 ^3, 2 ^2 \cdot 5 ^2, \\
        &2 ^3 \cdot 3 ^3, \\
        &2 ^5 \cdot 3 ^2, 2 ^4 \cdot 5 ^2
    \}.
\end{aligned}
$$

A third possibility is

$$
\begin{aligned}
    Y _3 ^{***} = \{
        p \cdot k: p \ge 27, p + k \in X _2 
    \}.
\end{aligned}
$$

Similar as before, $Y _3 ^{\ast\ast\ast} \subset Y _3$, because all other product decomposition of $p \cdot k$ will involve a number no less than $2 p \ge 54$, and the sum will be greater than 53. In particular, $Y _3 ^{\ast\ast\ast}$ include 

$$
\begin{aligned}
    Y _3 ^{***} \supset \{
        &29 \cdot 6, 31 \cdot 4, \\
        &29 \cdot 8, 31 \cdot 6, \\
        &29 \cdot 12, 31 \cdot 10, \\
        &29 \cdot 18, 31 \cdot 16, \\
        &29 \cdot 24, 31 \cdot 22
    \}.
\end{aligned}
$$

Therefore, 

$$
\begin{aligned}
    Y _3 \supset Y _3 ^* \cup Y _3 ^{**} \cup Y _3 ^{***} \supset \{
        &2 ^1 \cdot 3 ^2, 2 ^3 \cdot 3, \\
        &2 ^2 \cdot 13, \\
        &2 ^2 \cdot 19, 2 ^4 \cdot 7, \\
        &2 ^2 \cdot 23, 2 ^3 \cdot 19, 2 ^4 \cdot 11, 2 ^1 \cdot 5 ^2\\
        &2 ^4 \cdot 13, 2 ^1 \cdot 3 ^3, 2 ^2 \cdot 5 ^2\\
        &2 ^2 \cdot 31, 2 ^4 \cdot 19, 2 ^5 \cdot 3, 2 ^3 \cdot 3 ^3, 29 \cdot 4\\
        &2 ^3 \cdot 29, 2 ^5 \cdot 5, 31 \cdot 6\\
        &2 ^2 \cdot 37, 2 ^5 \cdot 3 ^2, 2 ^4 \cdot 5 ^2, 29 \cdot 12, 31 \cdot 10\\
        &2 ^2 \cdot 43, 2 ^4 \cdot 31, 29 \cdot 18\\
        &2 ^4 \cdot 37, 29 \cdot 24, 31 \cdot 22
    \}.
\end{aligned}
$$

Finally we discuss $X _4$. From the above we can see that other than $m = 17$, we always have

$$
\begin{aligned}
    |s ^{-1} (m) \cap D _3| \ge 2.
\end{aligned}
$$

So $x = 17$. The numbers are $4$ and $13$. The product $y = 52$.

### Algorithm

Python has a set of build-in set-theory functions. We can do this completely without the knowledge of number theory.


```python
D = {(a, b) for a in range(2, 100) for b in range(a + 1, 100)}
```

Define the summation and multiplication maps.

```python
s = lambda tup: tup[0] + tup[1]
p = lambda tup: tup[0] * tup[1]
```

Define the image operator. We also need to keep track of the preimage.

```python
# image(fun, dom) will generate the image of a function as a dictionary 
# and record the information of preimage at the same time: a key is an
# element in the image, and its value is the preimage set of this key

def image(fun, dom):
    ima = dict([])
    for d in dom:
        f = fun(d)
        if f in ima:
            ima[f] = ima[f].union({d})
        else:
            ima[f] = {d}
    return ima
```

Then we start. Initial public information:

```python
X = image(s, D)
Y = image(p, D)
```

`P1` and `P2`:

```python
X1 = {m : X[m] for m in X if len(X[m]) > 1}
Y1 = {n : Y[n] for n in Y if len(Y[n]) > 1}
D1 = {d for n in Y1 for d in Y1[n]}
```


```python
X2 = {m : X1[m] for m in X1 if X1[m].issubset(D1)}
D2 = {d for m in X2 for d in X2[m]}
Y2 = image(p, D2)
print(sorted(X2))
```

    [11, 17, 23, 27, 29, 35, 37, 41, 47, 53]

`P3`:


```python
Y3 = {n : Y2[n] for n in Y2 if len(Y2[n]) == 1}
D3 = {d for n in Y3 for d in Y3[n]}
X3 = image(s, D3)
```

`P4`:

```python
X4 = {m : X3[m] for m in X3 if len(X3[m]) == 1}
D4 = {d for m in X4 for d in X4[m]}
Y4 = image(p, D4)
```


```python
(X4, Y4)
```




    ({17: {(4, 13)}}, {52: {(4, 13)}})





---
Download this page as [Jupyter Notebook]({{ site.baseurl }}/assets/files/jupyter/guiguzi.ipynb).


### Swift Code

As a practice of swift's basic language, let's realize this algorithm via swift.

``` swift
let N = 100

var D = Set(Array(2..<N).flatMap { a in
                Array(a+1...N).map{[a, $0]}
            })

let s = {(tuple: [Int]) in tuple[0] + tuple[1]}
let p = {(tuple: [Int]) in tuple[0] * tuple[1]}

func imageWithPreimage(function: (_: [Int]) -> Int, domain: Set<[Int]>) -> Dictionary<Int, Set<[Int]>> {
    var image = Dictionary<Int, Set<[Int]>>()
    for data in domain {
        let f = function(data)
        image[f] = (image[f] ?? Set<[Int]>()).union([data])
    }
    return image
}

var X = imageWithPreimage(function: s, domain: D)
var Y = imageWithPreimage(function: p, domain: D)

let X1 = X.filter { $1.count > 1 }
var Y1 = Y.filter { $1.count > 1 }

let D1 = D.filter { X1[s($0)] != nil && Y1[p($0)] != nil }

var X2 = X1.filter { $1.isSubset(of: D1) }
let D2 = D1.filter { X2[s($0)] != nil }

for (n, y) in Y1 {
    Y1[n] = y.filter { D2.contains($0) }
}

let Y3 = Y1.filter { $1.count == 1 }
let D3 = D2.filter { Y3[p($0)] != nil }

for (m, x) in X2 {
    X2[m] = x.filter { D3.contains($0) }
}

let X4 = X2.filter { $1.count == 1 }
let D4 = D3.filter { X4[s($0)] != nil }

print(D4)
```