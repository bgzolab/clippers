---
draft: true
aliases:
  - Obsidian weread plugin
created: 2025-03-09T10:49:58
description: Obsidian Weread Plugin is a plugin to sync Weread(微信读书) hightlights and annotations into your Obsidian Vault.
modified: 2025-07-27T10:38:06
source: https://github.com/zhaohongxuan/obsidian-weread-plugin
tags: []
tags-link:
  - "[[obsidian]]"
title: Obsidian weread plugin
type: repo
---
# Obsidian [[weread]] plugin

![](https://img.shields.io/github/stars/zhaohongxuan/obsidian-weread-plugin?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/zhaohongxuan/obsidian-weread-plugin?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/zhaohongxuan/obsidian-weread-plugin?style=for-the-badge&label=since)

[![](https://github-readme-stats.vercel.app/api/pin/?username=zhaohongxuan&repo=obsidian-weread-plugin&bg_color=00000000)](https://github.com/zhaohongxuan/obsidian-weread-plugin)

## 模板备份

```shell
---
title: {{metaData.title}}
aliases: {{metaData.title}}
author: {{metaData.author}}, {{metaData.publisher}}
cover: {{metaData.cover}}
published: {{metaData.publishTime}}
last-read: {{metaData.lastReadDate}}
description: {{metaData.intro}}
isbn: {{metaData.isbn}}
tags: 
- {{metaData.category}}
type: weread-notes
weread: {{metaData.pcUrl}}
---

## Highlights
{% for chapter in chapterHighlights %}
{% if chapter.level == 1 %}### {{chapter.chapterTitle}}{% elif chapter.level == 2 %}#### {{chapter.chapterTitle}}{% elif chapter.level == 3 %}##### {{chapter.chapterTitle}}{% endif %}
{% for highlight in chapter.highlights %}{% if highlight.reviewContent %}
> [!NOTE]
> {{ highlight.markText |trim }} 
> 
> {{highlight.createTime}} ^{{highlight.bookmarkId}}
💭 {{highlight.reviewContent}} {% else %}
> [!NOTE] 
> {{ highlight.markText |trim }}
> 
> {{highlight.createTime}} ^{{highlight.bookmarkId}}
{% endif %}
{% endfor %}{% endfor %}

## Review
{% for chapter in bookReview.chapterReviews %}{% if chapter.reviews or chapter.chapterReview %}
### {{chapter.chapterTitle}}
{% if chapter.chapterReviews %}{% for chapterReview in chapter.chapterReviews %}
#### Chapter No.{{loop.index}}
> [!NOTE]
> {{chapterReview.content}} 
> 
> {{chapterReview.createTime}} ^{{chapterReview.reviewId}}
{% endfor %}{% endif %}{% if chapter.reviews %}{% for review in chapter.reviews %}
#### Comment
> [!NOTE]
> {{review.abstract |trim }}
> 
> {{review.createTime}} ^{{review.reviewId}}
💭{{review.content}}
{% endfor %} {% endif %} {% endif %} {% endfor %}

## Book Review
{% if bookReview.bookReviews %}{% for bookReview in bookReview.bookReviews %}
### No.{{loop.index}} 
> [!NOTE]
> {{bookReview.mdContent}}
> 
> {{bookReview.createTime}} ^{{bookReview.reviewId}}
{% endfor %}{% endif %}
```
