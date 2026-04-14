---
layout: page
permalink: /research/
title: research
description: an interactive map of my research landscape
nav: true
nav_order: 3
---

<style>
  .constellation-container {
    width: 100%;
    position: relative;
    border: 1px solid var(--global-divider-color);
    border-radius: 8px;
    overflow: hidden;
    background: var(--global-card-bg-color);
    margin-bottom: 2rem;
  }
  .constellation-container svg {
    display: block;
    width: 100%;
    cursor: grab;
  }
  .constellation-container svg:active {
    cursor: grabbing;
  }
  /* theme (cluster) nodes */
  .node-theme circle {
    stroke-width: 2px;
    cursor: default;
  }
  .node-theme text {
    font-size: 11px;
    font-weight: 600;
    fill: var(--global-text-color);
    pointer-events: none;
    text-anchor: middle;
  }
  /* paper nodes */
  .node-paper circle {
    stroke-width: 1.5px;
    cursor: pointer;
    transition: r 0.15s ease;
  }
  .node-paper:hover circle {
    filter: brightness(1.2);
  }
  .node-paper text {
    font-size: 10px;
    fill: var(--global-text-color);
    pointer-events: none;
    text-anchor: middle;
  }
  /* edges */
  .edge {
    stroke-opacity: 0.25;
    stroke-width: 1.5px;
  }
  /* detail panel */
  .detail-panel {
    position: absolute;
    top: 12px;
    right: 12px;
    width: 300px;
    max-width: 80%;
    background: var(--global-bg-color);
    border: 1px solid var(--global-divider-color);
    border-radius: 8px;
    padding: 1.1rem;
    box-shadow: 0 4px 20px rgba(0,0,0,0.12);
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.2s ease;
    z-index: 10;
  }
  .detail-panel.visible {
    opacity: 1;
    pointer-events: auto;
  }
  .detail-panel h4 {
    margin: 0 0 0.4rem 0;
    font-size: 0.95rem;
    color: var(--global-theme-color);
    line-height: 1.3;
  }
  .detail-panel .meta {
    font-size: 0.8rem;
    color: var(--global-text-color-light);
    margin-bottom: 0.5rem;
  }
  .detail-panel .authors {
    font-size: 0.82rem;
    color: var(--global-text-color);
    margin-bottom: 0.6rem;
  }
  .detail-panel .themes-list {
    display: flex;
    flex-wrap: wrap;
    gap: 0.3rem;
    margin-bottom: 0.6rem;
  }
  .detail-panel .theme-badge {
    font-size: 0.7rem;
    padding: 0.15rem 0.5rem;
    border-radius: 10px;
    color: #fff;
    font-weight: 600;
  }
  .detail-panel .links a {
    font-size: 0.8rem;
    margin-right: 0.6rem;
    color: var(--global-theme-color);
  }
  .detail-panel .close-btn {
    position: absolute;
    top: 8px;
    right: 10px;
    background: none;
    border: none;
    font-size: 1.1rem;
    color: var(--global-text-color-light);
    cursor: pointer;
    line-height: 1;
  }
  .legend {
    display: flex;
    flex-wrap: wrap;
    gap: 0.8rem;
    justify-content: center;
    margin-bottom: 1rem;
    font-size: 0.8rem;
    color: var(--global-text-color-light);
  }
  .legend-item {
    display: flex;
    align-items: center;
    gap: 0.3rem;
  }
  .legend-dot {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    display: inline-block;
  }
  .constellation-hint {
    text-align: center;
    font-size: 0.78rem;
    color: var(--global-text-color-light);
    margin-bottom: 0.5rem;
  }
</style>

<p class="constellation-hint">click a paper node to see details &middot; drag to rearrange</p>

<div class="legend" id="legend"></div>

<div class="constellation-container">
  <svg id="constellation"></svg>
  <div class="detail-panel" id="detail-panel">
    <button class="close-btn" id="close-detail">&times;</button>
    <h4 id="detail-title"></h4>
    <div class="meta" id="detail-meta"></div>
    <div class="authors" id="detail-authors"></div>
    <div class="themes-list" id="detail-themes"></div>
    <div class="links" id="detail-links"></div>
  </div>
</div>

<script src="{{ site.third_party_libraries.d3.url.js }}" integrity="{{ site.third_party_libraries.d3.integrity.js }}" crossorigin="anonymous"></script>

<script>
(function() {
  // ── data ──────────────────────────────────────────────────
  const themeColors = {
    "Adversarial Attacks":       "#e74c3c",
    "AI Safety & Steering":      "#9b59b6",
    "Multi-Agent Systems":       "#2ecc71",
    "Agentic AI":                "#3498db",
    "Multimodal":                "#e67e22",
    "Certification":             "#1abc9c"
  };

  const papers = [
    {
      id: "trap",
      title: "TRAP: Targeted Redirecting of Agentic Preferences",
      authors: "Jehyeok Yeon*, Hangoo Kang*, Gagandeep Singh",
      year: 2025,
      venue: "NeurIPS 2025",
      themes: ["Adversarial Attacks", "Multi-Agent Systems", "Agentic AI"],
      links: { publications: "/publications/" }
    },
    {
      id: "certify",
      title: "Certifying Robustness of Agent Tool-Selection Under Adversarial Attacks",
      authors: "Jehyeok Yeon, Isha Chaudhary, Gagandeep Singh",
      year: 2025,
      venue: "ICLR 2026 Workshop",
      themes: ["Adversarial Attacks", "Certification", "Agentic AI"],
      links: { website: "https://llmcert-t.certifyllm.com/", publications: "/publications/" }
    },
    {
      id: "flowguard",
      title: "Securing Multimodal AI through Internal Information Decomposition",
      authors: "Jehyeok Yeon, Hyeonjeong Ha, Qiusi Zhan, Heng Ji",
      year: 2025,
      venue: "Under Review",
      themes: ["Adversarial Attacks", "Multimodal", "AI Safety & Steering"],
      links: { publications: "/publications/" }
    },
    {
      id: "gsae",
      title: "GSAE: Graph-Regularized Sparse Autoencoders for Robust LLM Safety Steering",
      authors: "Jehyeok Yeon, Federico Cinus, Yifan Wu, Luca Luceri",
      year: 2025,
      venue: "Under Review",
      themes: ["AI Safety & Steering", "Certification"],
      links: { publications: "/publications/" }
    },
    {
      id: "friendship",
      title: "The Power of Friendship: Analyzing Leadership and Adversarial Attacks in Multi-Agent Collaboration",
      authors: "Jehyeok Yeon",
      year: 2025,
      venue: "ACM Collective Intelligence 2025",
      themes: ["Multi-Agent Systems", "Adversarial Attacks"],
      links: { publications: "/publications/" }
    }
  ];

  const themes = Object.keys(themeColors);

  // build graph nodes & links
  const nodes = [];
  const links = [];

  themes.forEach(t => {
    nodes.push({ id: t, type: "theme", label: t, color: themeColors[t] });
  });

  papers.forEach(p => {
    // paper node color = blend of its themes, or just first theme
    nodes.push({
      id: p.id, type: "paper", label: p.title.length > 40 ? p.title.substring(0, 37) + "..." : p.title,
      fullTitle: p.title, color: themeColors[p.themes[0]], data: p
    });
    p.themes.forEach(t => {
      links.push({ source: p.id, target: t, color: themeColors[t] });
    });
  });

  // ── layout ────────────────────────────────────────────────
  const container = document.querySelector(".constellation-container");
  const width = container.clientWidth;
  const height = Math.max(420, Math.min(560, width * 0.6));
  const svg = d3.select("#constellation")
    .attr("viewBox", [0, 0, width, height])
    .attr("height", height);

  const simulation = d3.forceSimulation(nodes)
    .force("link", d3.forceLink(links).id(d => d.id).distance(d => d.source.type === "theme" || d.target.type === "theme" ? 100 : 60).strength(0.6))
    .force("charge", d3.forceManyBody().strength(d => d.type === "theme" ? -300 : -120))
    .force("center", d3.forceCenter(width / 2, height / 2))
    .force("collision", d3.forceCollide().radius(d => d.type === "theme" ? 40 : 28));

  // edges
  const link = svg.append("g")
    .selectAll("line")
    .data(links)
    .join("line")
    .attr("class", "edge")
    .attr("stroke", d => d.color);

  // nodes
  const node = svg.append("g")
    .selectAll("g")
    .data(nodes)
    .join("g")
    .attr("class", d => d.type === "theme" ? "node-theme" : "node-paper");

  // theme circles
  node.filter(d => d.type === "theme")
    .append("circle")
    .attr("r", 28)
    .attr("fill", d => d.color + "22")
    .attr("stroke", d => d.color);

  node.filter(d => d.type === "theme")
    .append("text")
    .attr("dy", "0.35em")
    .text(d => d.label);

  // paper circles
  node.filter(d => d.type === "paper")
    .append("circle")
    .attr("r", 18)
    .attr("fill", d => d.color + "44")
    .attr("stroke", d => d.color)
    .on("click", (event, d) => showDetail(d.data));

  node.filter(d => d.type === "paper")
    .append("text")
    .attr("dy", 30)
    .text(d => d.label);

  // drag
  node.call(d3.drag()
    .on("start", (event, d) => {
      if (!event.active) simulation.alphaTarget(0.3).restart();
      d.fx = d.x; d.fy = d.y;
    })
    .on("drag", (event, d) => {
      d.fx = event.x; d.fy = event.y;
    })
    .on("end", (event, d) => {
      if (!event.active) simulation.alphaTarget(0);
      d.fx = null; d.fy = null;
    })
  );

  simulation.on("tick", () => {
    link
      .attr("x1", d => d.source.x).attr("y1", d => d.source.y)
      .attr("x2", d => d.target.x).attr("y2", d => d.target.y);
    node.attr("transform", d => `translate(${d.x},${d.y})`);
  });

  // ── detail panel ──────────────────────────────────────────
  const panel = document.getElementById("detail-panel");

  function showDetail(p) {
    document.getElementById("detail-title").textContent = p.title;
    document.getElementById("detail-meta").textContent = p.venue + " \u00b7 " + p.year;
    document.getElementById("detail-authors").textContent = p.authors;

    const themesEl = document.getElementById("detail-themes");
    themesEl.innerHTML = "";
    p.themes.forEach(t => {
      const badge = document.createElement("span");
      badge.className = "theme-badge";
      badge.style.backgroundColor = themeColors[t];
      badge.textContent = t;
      themesEl.appendChild(badge);
    });

    const linksEl = document.getElementById("detail-links");
    linksEl.innerHTML = "";
    if (p.links) {
      Object.entries(p.links).forEach(([label, url]) => {
        const a = document.createElement("a");
        a.href = url;
        a.textContent = label.charAt(0).toUpperCase() + label.slice(1);
        if (url.startsWith("http")) a.target = "_blank";
        linksEl.appendChild(a);
      });
    }

    panel.classList.add("visible");
  }

  document.getElementById("close-detail").addEventListener("click", () => {
    panel.classList.remove("visible");
  });

  svg.on("click", (event) => {
    if (event.target === svg.node()) panel.classList.remove("visible");
  });

  // ── legend ────────────────────────────────────────────────
  const legend = document.getElementById("legend");
  themes.forEach(t => {
    const item = document.createElement("span");
    item.className = "legend-item";
    item.innerHTML = `<span class="legend-dot" style="background:${themeColors[t]}"></span>${t}`;
    legend.appendChild(item);
  });
})();
</script>
