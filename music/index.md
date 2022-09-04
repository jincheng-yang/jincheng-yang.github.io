---
layout: grid
title: Jincheng's Website | Music
---

<div class="content" markdown="1">

# Music

[![Photo]({{ site.baseurl }}/assets/images/photo8.jpeg){: style="width:300px; float:right; padding-left:80px; max-width:100%"}](https://youtu.be/RlmiLB_sjlI)


Math and music are two most important themes of my life. As Hermann von Helmholtz once said, 

> *Mathematics and music, the most sharply contrasted fields of scientific activity which can be found, and yet related, supporting each other, as if to show forth the secret connection which ties together all the activities of our mind, and which leads us to surmise that the manifestations of the artist's genius are but the unconscious expressions of a mysteriously acting rationality.*

I am honored to follow the guidance of my piano instructors, [Prof. Gilmson](https://www.sophia-gilmson.com) and [Xinyi Li](https://music.utexas.edu/about/people/xinyi-li).

</div>

<div style="background-color:antiquewhite">
<div class="content" markdown="1">

###### Piano Recitals and Accompany

{% for recital in site.data.piano.Recital reversed %}

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

<div style="background-color:aliceblue">
<div class="content" markdown="1">

###### Rock Lives

{% for recital in site.data.rock.Rock reversed %}

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
