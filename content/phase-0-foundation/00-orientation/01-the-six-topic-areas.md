---
title: "0.0.2 The 6 topic areas"
description: "The six lenses _thewozniakfile uses to teach computing: machine, OS, networking, languages and paradigms, cloud and distributed systems, and AI/ML engineering."
phase: 0
chapter: "0.0 Orientation"
lesson: "0.0.2"
status: seedling
tags:
  - phase-0
  - orientation
  - map
---

# 0.0.2 The 6 topic areas

> **In one line:** `_thewozniakfile` teaches computing through six repeating lenses: machine, OS, networking, languages and paradigms, cloud and distributed systems, and AI/ML engineering.

---

Computer science is not one subject. It is more like standing around a machine with six different torches. Each torch lights up a different truth.

One person sees the hardware. One sees the operating system. One sees the network. One sees the code itself. One sees the cloud account it runs in. One sees the AI model quietly making decisions in the corner.

Same system. Six views. That is the whole trick.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer-motherboard.jpg?width=1100" alt="A desktop computer motherboard." />
  <figcaption>A real machine is not abstract. It is silicon, copper, firmware, ports, heat, and stored bits. Image: Wikimedia Commons, Computer-motherboard.jpg.</figcaption>
</figure>

---

## A story — the latency nobody could explain

Imagine a team wakes up to a slow app.

Customers say "it takes 8 seconds to load now." The dashboards say everything is green. Slack starts glowing. Everyone has a theory.

The hardware person checks the server: maybe a disk is dying, the RAM is exhausted, or the CPU is throttling under thermal load.

The operating-system person checks processes, threads, file descriptors, scheduled tasks, and whether something is silently swapping memory to disk.

The networking person checks DNS, latency to the database, packet loss, TLS handshake time, and whether a CDN is failing somewhere.

The code person opens the application. Did a recent commit add a slow loop? Is there an N+1 database query? Is a third-party API call happening on every request? Is the JSON body 10× bigger than it should be?

The cloud person checks the load balancer, autoscaling rules, RDS connection pool, region health, IAM rate limits, and whether a noisy neighbor is hammering the same instance.

The AI engineer asks the newest question: is the app calling an LLM somewhere? Did the prompt grow? Did the model latency spike? Is a streaming response stalling?

Nobody is wrong. They are all looking at a different layer of the same machine.

That is why this vault does not begin with "memorise these acronyms." It begins by teaching you how to look.

## What's actually going on

`_thewozniakfile` uses a **spiral curriculum**. That means we touch the main areas early, then come back to each one later with more depth — and not every topic appears in every phase. The spiral is *responsive*, not mechanical.

The six topic areas are the six lenses you will keep reusing:

| Area | Plain-English meaning | What it teaches you to ask |
|---|---|---|
| **Machine** | The physical computer: CPU, RAM, storage, firmware, GPU, power, I/O | What is this system made of, and where does physics meet code? |
| **Operating System** | The manager between hardware and apps: Windows, Linux, macOS, processes, files, users, permissions, containers | What is running, who is allowed to do what, and where are the logs? |
| **Networking** | How machines talk: IP, ports, DNS, HTTP, TLS, Wi-Fi, routing, distributed traffic | Where did this request come from, where is it going, and what shape is the wire? |
| **Languages + Paradigms** | The medium of code itself: Python deep, JavaScript/TypeScript, C, Bash, SQL, plus OOP, functional, design patterns | How is intent expressed, and how do good engineers shape it? |
| **Cloud + DevOps + Distributed** | Rented infrastructure, containers, CI/CD, distributed systems thinking: AWS, Docker, Kubernetes, Terraform, queues, caches | Who owns which responsibility, and how does this stay alive at scale? |
| **AI / ML Engineering** | Building, deploying, and operating ML/LLM systems: training, inference, RAG, agents, fine-tuning, MLOps | What does the model actually do, and how do we make it useful in production? |

The six lenses are deliberately *broader* than just "topics" — they are *ways of looking* at any computing problem. A senior engineer instinctively flips between all six when something gets weird.

## Why a builder cares

Real software does not respect topic boundaries. It chains things.

A real product feature might start in a React frontend, send an HTTP request through a CDN, hit a load balancer, route to a Python backend running in a container on Kubernetes, query a Postgres replica, call a vector database, send the result to an LLM API, stream tokens back, and write a log line that ends up in a dashboard the team checks every morning.

That one feature crosses every area:

- **Machine** — where the bytes physically live and the GPU runs the model
- **OS** — the container runtime, the file descriptors, the kernel networking stack
- **Networking** — TLS, DNS, load balancing, retries, timeouts
- **Languages + Paradigms** — the React, the Python, the SQL, the JSON
- **Cloud + DevOps + Distributed** — the K8s cluster, the autoscaler, the deploy pipeline, the cache
- **AI / ML Engineering** — the model serving, the prompt design, the streaming, the eval

This is why this vault does not teach "networking for twelve weeks, then code later." A builder needs a rough map of the whole territory early. The map gets sharper every time we return.

## The six lenses

Phase 0 is not trying to make you an expert. It is trying to make you **dangerously understandable**: able to follow a senior conversation, ask the next good question, and know where to dig.

### 1. Machine

You learn what a computer is before you try to build on one. CPU, RAM, storage, motherboard, GPU, BIOS/UEFI, boot sequence, physical I/O.

Engineering payoff: understanding latency budgets, memory hierarchies, why some code is fast and some is slow, why GPUs matter for ML, and why "it's a hardware problem" is sometimes the real answer.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer-motherboard.jpg?width=900" alt="A computer motherboard with CPU socket, memory slots, expansion slots, chipset, and connectors." />
  <figcaption><strong>Machine lens:</strong> the box is not a metaphor. Engineers who know it survive performance work, debugging, and the GPU era.</figcaption>
</figure>

### 2. Operating System

You learn how Windows and Linux manage running programs, users, permissions, files, services, logs, and terminals — and how containers chop the OS up into reproducible boxes.

Engineering payoff: debugging production outages, writing reliable services, understanding container internals (namespaces, cgroups), and knowing why one process is eating 100% of a CPU.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Operating_system_architecture.svg?width=900" alt="Operating system architecture diagram showing applications above the operating system and hardware beneath it." />
  <figcaption><strong>OS lens:</strong> the operating system is the manager between messy human software and strict physical hardware.</figcaption>
</figure>

### 3. Networking

You learn how computers find each other and move data: IP addresses, subnets, ports, DNS, TCP, UDP, HTTP, HTTPS, TLS, firewalls, VPNs, load balancers, CDNs.

Engineering payoff: building APIs, debugging "why is this slow" in production, understanding distributed systems, and not getting lost when someone says "the issue is at L4."

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/OSI_Model_v1.svg?width=650" alt="OSI model diagram with seven layers from physical to application." />
  <figcaption><strong>Network lens:</strong> packets are not magic. They climb and descend layers, and each layer gives engineers a different place to act.</figcaption>
</figure>

### 4. Languages + Paradigms

You learn the language of code itself. Python deep first (the universal glue), then JavaScript/TypeScript for the web, plus reading literacy in C, Bash, SQL, and the meta-skills: OOP, functional programming, design patterns, clean code.

Engineering payoff: this is the medium you'll spend your career inside. The difference between a junior who copy-pastes and a senior who designs is mostly here.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Python_logo_and_wordmark.svg?width=700" alt="Python logo." />
  <figcaption><strong>Code lens:</strong> code is how engineers think out loud. The right tool, named clearly, beats the clever one.</figcaption>
</figure>

### 5. Cloud + DevOps + Distributed

You learn what the cloud really is: someone else's computers, wrapped in APIs, identity, billing, and managed services. Then containers, CI/CD, Terraform, and how production systems stay alive at scale.

Engineering payoff: getting hired anywhere serious in 2026. Modern software lives in cloud. Knowing the AWS forty (the core services) and how to ship to them through CI/CD is the table stakes for senior roles.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Cloud_computing.svg?width=900" alt="Cloud computing diagram showing clients and services connected through cloud infrastructure." />
  <figcaption><strong>Cloud lens:</strong> cloud engineering is identity, configuration, networking, observability, cost — and the muscle to ship safely.</figcaption>
</figure>

### 6. AI / ML Engineering

You learn how models enter the picture as software components: training vs inference, LLMs from inside, RAG, agents, fine-tuning, evals, MLOps, model serving, drift, guardrails.

Engineering payoff: this is the differentiator in 2026 and beyond. Engineers who can ship AI features ship the products that get built. Engineers who can't, don't.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Artificial_neural_network.svg?width=800" alt="Artificial neural network diagram with input, hidden, and output nodes." />
  <figcaption><strong>AI/ML lens:</strong> models are software components now. They have inputs, outputs, hidden assumptions, and operational reality.</figcaption>
</figure>

## The Feynman test

Here is the test for every note in this vault:

> If you cannot explain the concept to a curious beginner without hiding behind jargon, you do not understand it well enough yet.

That does not mean the lesson should be shallow. It means the ladder should have small rungs.

For each topic, the pattern is:

1. Start with the ordinary thing: a desk, a road, a locked room, a receptionist, a filing cabinet.
2. Map the ordinary thing to the technical thing.
3. Name the real term.
4. Show why an engineer cares.
5. Show what a senior would actually do with it.

That is the tone we want: easy to enter, deep enough to matter.

## In one sketch

```text
                      _thewozniakfile
                            |
        ------------------------------------------------------
        |         |           |             |          |     |
     Machine     OS      Networking    Languages    Cloud   AI/ML
                                       + Paradigms  + Distrib  Eng
        |         |           |             |          |     |
        ------------------------------------------------------
                            |
                   Computational Thinking
                  (the meta-skill that ties it all)
```

Every phase walks around this map again, but only revisits the lenses that matter for that phase. Phase 0 gives the street names. Phase 1 deepens code and software engineering. Phase 2 makes cloud and distributed systems practical. Phase 3 takes AI/ML engineering seriously.

## References and image credits

- [Computer-motherboard.jpg](https://commons.wikimedia.org/wiki/File:Computer-motherboard.jpg) — Marcin Wieclaw, CC BY-SA 4.0.
- [Operating_system_architecture.svg](https://commons.wikimedia.org/wiki/File:Operating_system_architecture.svg) — Skjackey tse, public domain.
- [OSI_Model_v1.svg](https://commons.wikimedia.org/wiki/File:OSI_Model_v1.svg) — Offnfopt, public domain / CC0.
- [Python_logo_and_wordmark.svg](https://commons.wikimedia.org/wiki/File:Python_logo_and_wordmark.svg) — Python Software Foundation, GPL-compatible licence.
- [Cloud_computing.svg](https://commons.wikimedia.org/wiki/File:Cloud_computing.svg) — Sam Johnston, CC BY-SA 3.0.
- [Artificial_neural_network.svg](https://commons.wikimedia.org/wiki/File:Artificial_neural_network.svg) — Cburnett, GFDL / CC BY-SA 3.0.

## Memory peg

Computing is not one subject. It is six lenses pointed at the same machine. Learn the lenses early; deepen them for the rest of your career.
