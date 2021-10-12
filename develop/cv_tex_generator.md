---
layout: grid
---

# Talks

{% for talk in site.data.talk.Talk %}

&#92;talkentry&#123;{{ talk.Title }}&#125;&#123;{{ talk.Date }}&#125;&#123;{{ talk.Location }}&#125;&#123;{{ talk.Series }}&#125;&#123;{{ talk.Abstract }}&#125;

{% endfor %}

---

# Honors

