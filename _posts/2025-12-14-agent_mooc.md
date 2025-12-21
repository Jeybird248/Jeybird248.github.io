---
layout: post
title: "Reflection: Agentic AI MOOC"
date: 2025-12-21 09:00:00
description: Agentic AI, safety, and the growing gap between exploration and institutionalization.
tags:
categories: reflection
thumbnail: assets/img/mooc.png
---

### From the Wild West to the Lecture Hall

I recently had the chance to sit down and properly watch the Agentic AI MOOC, in particular Professor Dawn Song's lecture about safety in Agentic AI. The experience felt oddly like opening a time capsule. The field is barely a year old, yet compared to how fast the field of AI has been changing the past couple years it might as well be from a different era.

When I first started working on agentic systems, the field did not exist in any formal sense. There were no lecture series, no standardized terminology, no clear boundaries. What we now call “agentic AI” was, at the time, a loose collection of practitioners chaining self-invoking LLM calls together and hoping the context window would hold (it didn't). It was chaotic, fragile, and very much unsafe. But the underlying idea was compelling. And that's what pulled me in.

Today, the field has matured with remarkable speed. We now have professors and industry leaders formalizing what was once exploratory work. The shift toward safety, in particular, feels like a delayed but necessary correction. Many of the concerns now being framed as central were visible long before the field acquired its current prestige.

### TRAP and the Normalization of Known Failures

A large portion of Professor Song's lecture focused on newly recognized attack surfaces in agentic systems. Much of it closely mirrored the problems that motivated my first paper, accepted to NeurIPS 2025, on TRAP: Targeted Redirecting of Agentic Preferences.

At the time, the dominant assumption was that meaningful attacks required privileged access. Either the attacker controlled the environment or they had some form of system level authority. This assumption turned out to be false. Agentic systems do not need to be confronted directly. The entire point of these things is that they browse, read, and interpret the open web on their own, and that means many of the platforms they will find themselves in are platforms created and curated for humans, by humans.

The failure mode is simple. Instead of blocking the agent, the attacker misleads it. A poisoned instruction or image hidden in otherwise benign content is often enough. The agent does the rest by itself. And even better, in the case of TRAP it's not even visible to the human eye.

What is now being standardized as “indirect prompt injection” is something we were already wrestling with before it had a name. Seeing this transition from ad hoc concern to formal taxonomy was validating, but also unsettling. The vulnerabilities were becoming structural.

### Why Scaling the Model Is the Wrong Fix

One of the most important points in the lecture was the emphasis on system level safety rather than model level capability. This distinction is something that I believe is one of the key differentiators between LLM safety and Agentic safety.

Across my own experiments, even the most capable proprietary models failed under surprisingly simple attacks. This has always been the case with many jailbreaking attacks, but the consequences become more severe with these autonomous sytems that we are trying to release into the wild. And the problem isn't that the model isn't "smart enough" or anything like that, it's just how they were designed.

Agentic systems sit at the intersection of language models, tools, interfaces, and external environments. Each additional connection expands the attack surface. A system can score exceptionally well on static benchmarks and still be catastrophically unsafe if its architecture allows untrusted inputs to propagate unchecked.

Treating agent safety as a matter of scaling compute or improving reasoning misses the core problem under the context of AI safety. The model is rarely the weakest link. The system almost always is.

### Evaluation as an Agentic Problem

While I was unfortunately unable to participate in the AgentX AgentBeats competition due to overlapping deadlines in the next couple weeks, I think the actual idea behind it deserves serious attention. Using agents themselves as dynamic evaluators represents a meaningful shift in how we think about benchmarking, since static benchmarks struggle to capture the open ended and interactive nature of agentic behavior. Arguably, benchmarks aren't sufficient for evaluating LLMs either, but that's a topic for a different day. An agent as evaluator, operating through a standardized interface, allows for stress testing that more closely resembles real deployment conditions. Conceptually, this aligns with the broader movement toward protocol based interaction, similar in spirit to Model Context Protocol but applied to evaluation.

If agentic systems are dynamic, their evaluation frameworks should be as well.

### The Cost of the Offense Defense Asymmetry

Professor Song also highlighted something that's been on my mind after going to NeurIPS: in security research, offense is easier than defense. In modern academia, this asymmetry is amplified by incentive structures.

Incremental attack papers are comparatively easy to produce and validate. Defensive frameworks are not. A proposed defense often invites undue scrutiny, and any uncovered gap is treated as a failure rather than a step forward. As a result, researchers are systematically encouraged to identify new one-off ways to break systems rather than build actual solutions. It was just more cost-effective for their careers.

This dynamic inflates publication volume while slowing genuine progress. As the field hopefully moves toward more formal methods and verification based approaches with provable guarantees on safety, we as researchers in the AI community need to confront this imbalance directly. Otherwise, we may find ourselves in an endless game of cat and mouse until we face actual consequences for our actions with consequences we cannot handle.
