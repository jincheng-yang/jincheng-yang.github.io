---
layout: base
title: Jincheng's Website | Music
---

<div class="transparent">
<div class="container" markdown="1">

# Music

<img src="/users/jcyang/assets/images/photo6.png" style="float:right; width:300px; max-width:100%; padding-left: 30px">

Math and music are two most important themes of my life. As Hermann von Helmholtz once said, 

> *Mathematics and music, the most sharply contrasted fields of scientific activity which can be found, and yet related, supporting each other, as if to show forth the secret connection which ties together all the activities of our mind, and which leads us to surmise that the manifestations of the artist's genius are but the unconscious expressions of a mysteriously acting rationality.*

I am honored to follow the guidance of my piano instructor, [Prof. Gilmson](https://www.sophia-gilmson.com).

</div>
</div>

<div class="eggshell">
<div class="container" markdown="1">

### Piano Recitals and Accompany

{% for recital in site.data.piano.Recital %}

<div style="margin-left: 3em; margin-right: 3em">

<h5 style="display: flex; justify-content: space-between">
<span>
	{{ recital.Title }}
</span>
<span>
	{{ recital.Date }}
</span>
</h5>

<ul>
{% for repertoire in recital.Repertoire %}
	<li> <b>{{ repertoire.Artist }}</b>: {{ repertoire.Title }} </li>
{% endfor %}
</ul>

</div>

{% endfor %}

</div>
</div>

<div class="aliceblue">
<div class="container" markdown="1">

### Rock Lives

{% for recital in site.data.rock.Rock %}

<div style="margin-left: 3em; margin-right: 3em">

<h5 style="display: flex; justify-content: space-between">
<span>
	{{ recital.Title }}
</span>
<span>
	{{ recital.Date }}
</span>
</h5>

<ul>
{% for repertoire in recital.Repertoire %}
	<li> <b>{{ repertoire.Artist }}</b>: {{ repertoire.Title }} </li>
{% endfor %}
</ul>

</div>

{% endfor %}

</div>
</div>
