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
  .node-paper circle {
    stroke-width: 2px;
    cursor: pointer;
  }
  .node-paper:hover circle {
    filter: brightness(1.25);
  }
  .node-paper text {
    font-size: 10.5px;
    fill: var(--global-text-color);
    pointer-events: none;
    text-anchor: middle;
  }
  .edge {
    stroke-opacity: 0.18;
    stroke-width: 2px;
  }
  .edge-label {
    font-size: 8.5px;
    fill: var(--global-text-color-light);
    pointer-events: none;
    text-anchor: middle;
  }
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

<p class="constellation-hint">click a node to see details &middot; drag to rearrange &middot; edges = shared research themes</p>

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
  const themeColors = {
    "Adversarial Attacks":  "#e74c3c",
    "Representation Learning/Engineering": "#9b59b6",
    "Multi-Agent Systems":  "#2ecc71",
    "Agentic AI":           "#3498db",
    "Multimodal":           "#e67e22",
    "Certification":        "#1abc9c",
    "Information Geometry": "#2B2D42",
    "Scalable Oversight":   "#f1c40f",
    "Long Horizon Agents":  "#e84393"
  };

  const papers = [
    {
      id: "trap",
      title: "TRAP: Targeted Redirecting of Agentic Preferences",
      authors: "Jehyeok Yeon*, Hangoo Kang*, Gagandeep Singh",
      year: 2025, venue: "NeurIPS 2025",
      themes: ["Adversarial Attacks", "Agentic AI"],
      links: { publications: "/publications/" }
    },
    {
      id: "certify",
      title: "Certifying Robustness of Agent Tool-Selection Under Adversarial Attacks",
      authors: "Jehyeok Yeon, Isha Chaudhary, Gagandeep Singh",
      year: 2025, venue: "ICLR 2026 Workshop",
      themes: ["Certification", "Adversarial Attacks", "Agentic AI"],
      links: { website: "https://llmcert-t.certifyllm.com/", publications: "/publications/" }
    },
    {
      id: "flowguard",
      title: "Securing Multimodal AI through Internal Information Decomposition",
      authors: "Jehyeok Yeon, Hyeonjeong Ha, Qiusi Zhan, Heng Ji",
      year: 2026, venue: "ICML 2026 (Spotlight)",
      themes: ["Multimodal", "Representation Learning/Engineering"],
      links: { publications: "/publications/" }
    },
    {
      id: "gsae",
      title: "GSAE: Graph-Regularized Sparse Autoencoders for Robust LLM Safety Steering",
      authors: "Jehyeok Yeon, Federico Cinus, Yifan Wu, Luca Luceri",
      year: 2026, venue: "ICML 2026 AI4GOOD",
      themes: ["Representation Learning/Engineering", "Information Geometry"],
      links: { publications: "/publications/" }
    },
    {
      id: "friendship",
      title: "The Power of Friendship: Analyzing Leadership and Adversarial Attacks in Multi-Agent Collaboration",
      authors: "Jehyeok Yeon, Lawrence Angrave",
      year: 2025, venue: "ACM Collective Intelligence 2025",
      themes: ["Multi-Agent Systems", "Adversarial Attacks"],
      links: { publications: "/publications/" }
    },
    {
      id: "inferencebench",
      title: "InferenceBench: A Benchmark for Open-Ended LLM Inference Optimization by AI Agents",
      authors: "Jehyeok Yeon, Ben Rank, Maksym Andriushchenko",
      year: 2026, venue: "ICML 2026 AIWILD (Spotlight)",
      themes: ["Long Horizon Agents", "Scalable Oversight", "Agentic AI"],
      links: { publications: "/publications/" }
    },
    {
      id: "researcharena",
      title: "ResearchArena: Evaluating Sabotage and Monitoring in Automated AI R&D",
      authors: "Ben Rank*, Lena Libon*, Jehyeok Yeon, et al.",
      year: 2026, venue: "Under Review",
      themes: ["Long Horizon Agents", "Scalable Oversight"],
      links: { publications: "/publications/" }
    }
  ];

  // ── Build paper-to-paper edges from shared themes ──
  const nodes = [];
  const links = [];

  papers.forEach(p => {
    nodes.push({
      id: p.id, label: p.title, color: themeColors[p.themes[0]], data: p
    });
  });

  // Connect every pair of papers that share at least one theme
  for (let i = 0; i < papers.length; i++) {
    for (let j = i + 1; j < papers.length; j++) {
      const shared = papers[i].themes.filter(t => papers[j].themes.includes(t));
      if (shared.length > 0) {
        links.push({
          source: papers[i].id,
          target: papers[j].id,
          shared: shared,
          strength: shared.length,
          color: themeColors[shared[0]]
        });
      }
    }
  }

  // ── Layout ──
  const container = document.querySelector(".constellation-container");
  const width = container.clientWidth;
  const height = Math.max(380, Math.min(500, width * 0.55));
  const svg = d3.select("#constellation")
    .attr("viewBox", [0, 0, width, height])
    .attr("height", height);

  const simulation = d3.forceSimulation(nodes)
    .force("link", d3.forceLink(links).id(d => d.id).distance(d => 160 / d.strength).strength(d => 0.3 * d.strength))
    .force("charge", d3.forceManyBody().strength(-250))
    .force("center", d3.forceCenter(width / 2, height / 2))
    .force("collision", d3.forceCollide().radius(50));

  // edges
  const link = svg.append("g")
    .selectAll("line")
    .data(links)
    .join("line")
    .attr("class", "edge")
    .attr("stroke", d => d.color)
    .attr("stroke-width", d => 1 + d.strength);

  // edge labels (shared theme names)
  const edgeLabels = svg.append("g")
    .selectAll("text")
    .data(links)
    .join("text")
    .attr("class", "edge-label")
    .text(d => d.shared.join(", "));

  // paper nodes
  const node = svg.append("g")
    .selectAll("g")
    .data(nodes)
    .join("g")
    .attr("class", "node-paper");

  node.append("circle")
    .attr("r", 24)
    .attr("fill", d => d.color + "33")
    .attr("stroke", d => d.color)
    .on("click", (event, d) => showDetail(d.data));

  node.append("text")
    .attr("dy", 36)
    .text(d => d.label.length > 30 ? d.label.substring(0, 27) + "..." : d.label);

  // drag
  node.call(d3.drag()
    .on("start", (event, d) => {
      if (!event.active) simulation.alphaTarget(0.3).restart();
      d.fx = d.x; d.fy = d.y;
    })
    .on("drag", (event, d) => { d.fx = event.x; d.fy = event.y; })
    .on("end", (event, d) => {
      if (!event.active) simulation.alphaTarget(0);
      d.fx = null; d.fy = null;
    })
  );

  simulation.on("tick", () => {
    link
      .attr("x1", d => d.source.x).attr("y1", d => d.source.y)
      .attr("x2", d => d.target.x).attr("y2", d => d.target.y);
    edgeLabels
      .attr("x", d => (d.source.x + d.target.x) / 2)
      .attr("y", d => (d.source.y + d.target.y) / 2 - 4);
    node.attr("transform", d => `translate(${d.x},${d.y})`);
  });

  // ── Detail panel ──
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

  // ── Legend (from themes actually used) ──
  const usedThemes = [...new Set(papers.flatMap(p => p.themes))];
  const legend = document.getElementById("legend");
  usedThemes.forEach(t => {
    const item = document.createElement("span");
    item.className = "legend-item";
    item.innerHTML = '<span class="legend-dot" style="background:' + themeColors[t] + '"></span>' + t;
    legend.appendChild(item);
  });
})();
</script>
