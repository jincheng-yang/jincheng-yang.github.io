---
layout: post
title: Nushu
---

<style>
@import url('https://cdn.jsdelivr.net/gh/nushu-script/NotoTraditionalNushu@woff-v1.0/index.css');

:lang(zh-Nshu) {
    font-family: sans-serif, 'Noto Traditional Nushu', sans-serif;
}

</style>

<h3 lang="zh-Nshu">𛆁𛈬（女书）</h3>

{% for row in site.data.nushu %}

<img src="https://github.com/nushu-script/nushu-nsgfzsfzt/raw/main/{{ row['char'] }}.jpg" style="width:2em"/>​
<img src="https://github.com/nushu-script/nushu-nsgfzsfzt/raw/main/{{ row['char'] }}.jpg" style="width:2em"/>​
<img src="https://github.com/nushu-script/nushu-nsgfzsfzt/raw/main/{{ row['char'] }}.jpg" style="width:2em"/>​
<img src="https://github.com/nushu-script/nushu-nsgfzsfzt/raw/main/{{ row['char'] }}.jpg" style="width:2em"/>​
<img src="https://github.com/nushu-script/nushu-nsgfzsfzt/raw/main/{{ row['char'] }}.jpg" style="width:2em"/>​

<span> {{ row['no'] }}. </span>
<span lang="zh-Nshu">{{ row['char'] }}</span>
<span> [{{ row['pron'] }}]: {{ row['chn'] }} </span>
{% endfor %}