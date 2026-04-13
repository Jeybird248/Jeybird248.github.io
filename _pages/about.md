---
layout: about
title: about
permalink: /
selected_papers: true
news: true

profile:
  align: right
  image: yeonj.jpg
  image_circular: false # crops the image to make it circular

social: true # includes social icons at the bottom of the page
---

<style>
  .reading-tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dashed var(--global-text-color);
    cursor: help;
  }
  .reading-tooltip .reading-bubble {
    visibility: hidden;
    opacity: 0;
    transition: opacity 0.18s ease-out;
    background-color: var(--global-bg-color);
    color: var(--global-text-color);
    border: 1px solid var(--global-divider-color);
    border-radius: 8px;
    padding: 0.7rem 0.9rem;
    position: absolute;
    z-index: 1000;
    bottom: 130%;
    left: 50%;
    transform: translateX(-50%);
    width: max-content;
    max-width: 320px;
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.12);
    font-size: 0.88rem;
    line-height: 1.45;
    text-align: left;
    white-space: normal;
  }
  .reading-tooltip .reading-bubble::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -7px;
    border-width: 7px;
    border-style: solid;
    border-color: var(--global-divider-color) transparent transparent transparent;
  }
  .reading-tooltip:hover .reading-bubble,
  .reading-tooltip:focus .reading-bubble {
    visibility: visible;
    opacity: 1;
  }
  .reading-bubble em {
    color: var(--global-theme-color);
    font-style: normal;
    font-weight: 600;
  }
  .reading-bubble .reading-meta {
    display: block;
    margin-top: 0.4rem;
    font-size: 0.78rem;
    color: var(--global-text-color-light, #888);
  }
</style>

Oh, hey there! I'm Jehyeok Yeon, an incoming PhD candidate at Max Planck Institute for Intelligent Systems with [Maksym Andriushchenko](https://www.andriushchenko.me/) with a focus on building intelligent systems that are both technically robust and socially responsible. I was previously at the University of Illinois Urbana-Champaign, where I was previously advised by [Professor Gagandeep Singh](https://ggndpsngh.github.io/) at the FOCAL Lab.

My current research interest focuses on scalable oversight and "superalignment". As AI models become more capable, I believe it's more important than ever to be able to continue evaluating and analyzing these models, even if the models become smarter than us. This could mean creating more difficult tasks with no ground truth answer, finding scalable ways to control and interpret models, or reverse-engineering their internal representations to guarantee their hidden objectives match our instructions.

Outside of research, I care a lot about writing, both creative and academic, and how it shapes the way we think. I spend a lot of time walking and thinking through ideas, and I try to catch theatre performances whenever I can. There's something powerful about live storytelling that reminds me why I study intelligence in the first place. When I'm not writing or watching something live, I'm usually <span class="reading-tooltip" tabindex="0">reading something<span class="reading-bubble"><em>Moby Dick</em> &mdash; Herman Melville<span class="reading-meta">currently on my nightstand</span></span></span>.

The fastest way to reach me is through `tommy8289@gmail.com`. Feel free to reach out if you have any interesting ideas to throw around!
