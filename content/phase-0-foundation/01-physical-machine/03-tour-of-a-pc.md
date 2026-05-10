---
title: "0.1.4 Tour of a PC tower"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.4"
status: seedling
tags: [phase-0, physical-machine, hardware]
---

# 0.1.4 Tour of a PC tower

> **In one line:** open the side panel and you'll see eight things — learn their names once and the rest of this chapter is just zooming in on each.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer_inside_(1).jpg?width=1100" alt="Inside a desktop computer case with motherboard, expansion cards, cables, and cooling visible." />
  <figcaption>Do not learn hardware as vocabulary first. Learn it as a room you can point around: board, chip, memory, storage, card, power, cooling, case. Image: Wikimedia Commons, Computer inside (1).jpg.</figcaption>
</figure>

---

## A story — IBM's "weekend project" that ate the world

In 1980, IBM was a mainframe company. The personal-computer market was Apple's, Commodore's, Tandy's. IBM management told a small skunkworks team in Boca Raton, Florida: build us a PC, in **one year**, using off-the-shelf parts. The team — Don Estridge and twelve engineers — said yes.

To hit the deadline they did something unprecedented for IBM: they bought everything from outside vendors. Intel chips. A scrappy little operating system from a 24-year-old named Bill Gates (DOS). An open architecture so anyone could plug in expansion cards.

The IBM PC shipped August 1981. Within five years, **clones** — Compaq, Dell, HP — were selling the same architecture for less. The "PC" became a category. Apple stayed proprietary; everyone else converged on the IBM design. The motherboard layout you'd see if you opened a tower today is a direct descendant of that 1981 board.

## What's actually going on

If you unscrew the side panel of a desktop PC, here's what you're looking at:

| # | Part | What it does |
|---|---|---|
| 1 | **Motherboard** | The big green/black PCB that everything plugs into — the city's road network |
| 2 | **CPU** | A square chip in the middle, hidden under a heatsink and fan — the worker |
| 3 | **RAM** | Long thin sticks slotted vertically next to the CPU — the desk |
| 4 | **Storage** | A 2.5" SSD, 3.5" HDD, or a tiny M.2 stick on the motherboard — the filing cabinet |
| 5 | **GPU** | A long, heavy card in the bottom slot, with its own fans — the artist |
| 6 | **PSU** | A box at the top or bottom corner with a fan and many cables — the power station |
| 7 | **Cooling** | Fans, sometimes liquid loops — keeps the heat from melting things |
| 8 | **Case + I/O panel** | The metal box itself, plus the back panel with USB / HDMI / Ethernet / audio jacks |

The motherboard is the centrepiece. Everything physically plugs into it: the CPU socket, the RAM slots (usually 2 or 4), the M.2/SATA storage connectors, the PCIe slots (where the GPU lives), and the front-panel headers where the case's power button and USB ports connect.

## Why an engineer cares

Each part has performance and engineering implications:

- **CPU** — core count and clock speed shape what kind of workloads the box can run. Compile time, web request handling, scientific computing all depend here.
- **RAM** — your memory budget for everything from running a Postgres replica to loading a 70B-parameter LLM. Run out of RAM and you swap to disk and everything slows by 1000x.
- **GPU** — the whole modern AI stack runs on GPUs. Model size is bound by VRAM. Training is bound by compute. Buying or renting GPUs is one of the most consequential decisions in ML engineering.
- **Storage** — NVMe vs SATA SSD vs HDD changes throughput by 10x to 100x. Database performance, container cold-start time, log ingestion all live here.
- **Motherboard / chipset** — PCIe lanes determine how many GPUs and NVMe drives can run at full speed. This matters for ML rigs.
- **Power supply** — modern GPUs draw 300–700W each. Underspecced PSUs cause silent crashes that look like software bugs.

Knowing the box keeps you from blaming code when the bottleneck is silicon.

## In one sketch

```
   ┌────────────────── PC TOWER (side view) ──────────────────┐
   │                                                          │
   │  ┌─────────┐                          ┌──────────────┐   │
   │  │   PSU   │                          │ Motherboard  │   │
   │  │ ⚡ ▸▸▸ │ ← cables to everything    │  ┌──┐  ┌──┐  │   │
   │  └─────────┘                          │  │CPU│ │RAM│  │   │
   │                                       │  └──┘  └──┘  │   │
   │  ┌─────────┐                          │     │ │GPU│  │   │
   │  │ 💾 SSD  │ ← SATA/M.2 to mobo       │     │ └──┘  │   │
   │  └─────────┘                          └──────┴──────┘   │
   │                                                          │
   │  Fans ◌ ◌ ◌                          [ I/O on back ]    │
   └──────────────────────────────────────────────────────────┘
```

## Reference and image credit

- [Computer_inside_(1).jpg](https://commons.wikimedia.org/wiki/File:Computer_inside_(1).jpg) — Luke, public domain.

## Memory peg

Motherboard, CPU, RAM, Storage, GPU, PSU, Cooling, Case. Eight parts. Every desktop PC ever built since 1981 is just a different arrangement of these.
