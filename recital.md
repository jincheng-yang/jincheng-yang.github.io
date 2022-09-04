---
title: Graduation Recital
---

<html>
<head>
<title>{{page.title}}</title>
<meta name="viewport" content="width=device-width, initial-scale=0.8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="{{ site.baseurl }}/css/recital.css">
</head>

<body>

<div id="background"></div>
<h1>Graduation Piano Recital・畢業鋼琴独奏会</h1>

<div style="background-color:#fdf4f9" id="info">
<div class="content" markdown="1">
<blockquote>You are invited to a piano recital of Jincheng Yang.</blockquote>

* 📅 &nbsp; May 15, 2022 (Sunday) at 19:30 CDT / 北京時間5月16日周一早上8:30 [[Add]]({{ site.baseurl }}/assets/files/recital.ics)
* 📍 &nbsp; Recital Studio, MRH 2.608, 2406 Robert Dedman Dr.
* 🎥 &nbsp; Recording: [bilibili](https://www.bilibili.com/video/BV17g411o7CD) &nbsp; [YouTube](https://youtu.be/RlmiLB_sjlI)

<iframe width="560" height="315" src="https://www.youtube.com/embed/RlmiLB_sjlI" title="YouTube video player" style="margin:20px auto 20px auto; display: block"  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

</div>
</div>

<div id="program">
<div class="content" id="program2">

<h3>by Jincheng Yang</h3>

<h2>Program・曲目</h2>

{% for row in site.data.repertoire %}
<p class='title'>
{{ row['No.'] }}. <b>{{ row['Title'] }}</b>
</p>
<p class='translate'>{{ row['Translate'] }}</p>
<p class='composer'>{{ row['Composer'] }}</p>
<p class='composer_cn'>{{ row['Composer_cn'] }}</p>
{% endfor %}

</div>
</div>

<div style="background-color:#fdf4f9" id="address">
<div class="content" markdown="1">

## Location・地址

<div style="display:grid;grid-template-columns: 1fr 1fr;grid-template-rows:15em;grid-template-areas:'map text'" markdown="1">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d215.32714635339127!2d-97.73060517844304!3d30.28738965154808!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8644b590064328db%3A0x91e0897277a94cc2!2sRecital%20Studio!5e0!3m2!1sen!2sus!4v1651427348198!5m2!1sen!2sus" style="border:0;" allowfullscreen="" height="100%" width="100%" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

* __Recital Studio__
* Music Building and Recital Hall 2.608
* 2406 Robert Dedman Dr
* Austin, TX 78712

</div>

</div>
</div>

<footer>
<div id="footer-container">
<a href="https://www.utexas.edu"><img id="logo" src="https://www.utexas.edu/sites/all/themes/utexas/img/general/logo.svg"></a>
<p id="copyright">Copyright © 2022 Jincheng Yang</p>
<ul>
<li id="utmath"><a href="https://www.ma.utexas.edu/">UT Math</a></li>
<li><a href="https://www.linkedin.com/in/jincheng-yang/">LinkedIn</a></li>
<!-- <li><a href="https://github.com/jincheng-yang">GitHub</a></li> -->
<li><a href="mailto:jcyang@math.utexas.edu">Email</a></li>
</ul>
</div>
</footer>

</body>
</html>