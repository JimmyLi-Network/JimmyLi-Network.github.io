---
layout: layout
title: Blog
permalink: /blog/
---

<section class="home-section blog-page">
  <div class="section-heading">
    <p class="section-label">Technical Writing</p>
    <h1>Blog</h1>
    <p class="section-intro">
      Technical posts, research notes, and short guides on systems, edge AI,
      wireless sensing, and small-model deployment.
    </p>
  </div>

  {% assign notes = site.posts | where: "listed", true | sort: "date" | reverse %}
  <div class="blog-list">
    {% for note in notes %}
      <article class="blog-item">
        <div class="blog-item-header">
          <p class="blog-date">{{ note.date | date: "%B %-d, %Y" }}</p>
          {% if note.theme %}
            <span class="blog-theme">{{ note.theme }}</span>
          {% endif %}
        </div>
        <h2 class="blog-title">
          <a href="{{ note.url }}">{{ note.title }}</a>
        </h2>
        {% if note.summary %}
          <p class="blog-summary">{{ note.summary }}</p>
        {% endif %}
        <a class="text-link" href="{{ note.url }}">Read the note</a>
      </article>
    {% endfor %}
  </div>
</section>
