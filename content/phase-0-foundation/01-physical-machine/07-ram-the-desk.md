---
title: "0.1.8 RAM — the desk"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.8"
status: seedling
tags: [phase-0, physical-machine, memory]
---

# 0.1.8 RAM — the desk

> **In one line:** RAM is the working space where your computer keeps everything it's currently using — and *everything* in there is in plaintext, until the power goes off.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/RAM_Module_(SDRAM-DDR4).jpg?width=1100" alt="A DDR4 RAM module." />
  <figcaption>A RAM stick looks boring. During runtime, it can hold passwords, tokens, decrypted files, malware, and the exact story of what the machine is doing. Image: Wikimedia Commons, RAM Module (SDRAM-DDR4).jpg.</figcaption>
</figure>

---

## A story — the magnetic donuts of the 1950s

The first practical computer memory wasn't silicon. It was **literally tiny ceramic donuts**.

In the early 1950s, MIT professor **Jay Forrester** invented **magnetic core memory**. Each bit was a doughnut of ferrite ceramic about a millimetre wide, threaded with three wires. Pulse the wires one way, the donut magnetised "north" = 1. Pulse the other way, "south" = 0. To *read* a bit, you tried to flip it — if it changed, it was a 0; if not, a 1. Reading destroyed the bit, so you had to write it back immediately. Computers had whole rooms full of these things, hand-woven by women called "core stringers" — IBM's primary supplier was textile mills.

In 1968 Intel started selling DRAM (Dynamic RAM) — silicon chips that did the same job a million times faster, at a tiny fraction of the size. Core memory was dead in a decade. But the *name* stuck — the operating system kernel's memory image is still called a **core dump**, fifty years after the last ceramic donut was strung.

## What's actually going on

RAM (**Random Access Memory**) is the computer's **working memory** — the desk surface. When you double-click a program:

1. The OS reads the program file from storage (slow).
2. It copies the program's instructions and data into RAM (fast access from now on).
3. The CPU executes from RAM, billions of times per second.

It's called "random access" because the CPU can jump to any byte directly — unlike a tape, where you'd have to spool through everything. Modern desktops typically have 16–64 GB. Servers run 256 GB to multiple TB.

RAM is **volatile**: the moment you cut power, every bit returns to garbage within seconds. That's the trade-off you make for the speed.

DRAM works by storing each bit as **charge in a tiny capacitor**. The capacitor leaks charge over milliseconds, so the memory controller has to **refresh** every cell thousands of times per second — read and rewrite each row. That refresh cycle is also the basis for the **Rowhammer** family of attacks.

## Why an engineer cares

RAM is the universal currency of performance:

- **Memory budgets matter** — running a 7B-parameter LLM needs ~14 GB at fp16. A 70B model needs ~140 GB, which is why GPUs are so expensive. Knowing the math means knowing what you can actually run.
- **OOM kills** — when a server runs out of memory, the kernel kills the biggest process (the OOM killer). One of the most common production outages.
- **Memory leaks** — long-running processes that slowly grow until they OOM. Profilers (`pprof`, `valgrind`, `tracemalloc`) are the tools.
- **Swap thrashing** — when RAM is full, the OS swaps to disk. Performance falls off a cliff. "Why is this server so slow" is often "it's swapping."
- **DRAM bandwidth as bottleneck** — modern CPUs are often *memory-bandwidth-bound*, not compute-bound. Optimising memory access patterns wins more than micro-optimising the loop body.

RAM is fast but finite. Senior engineers think in memory budgets the way junior engineers think in lines of code.

## In one sketch

```
     ┌───────── RAM stick (DIMM) ─────────┐
     │  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ │
     │  ▓ DRAM chips (8 or 16 of them)  ▓ │
     │  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ │
     │  ════════════════════════════════  │ ← gold contacts
     └────────────────────────────────────┘
              ↓ slots into motherboard

   What's inside RAM right now:
     ┌──────────────────────────────────┐
     │  Linux kernel                    │
     │  Browser process — 3 GB          │
     │  Spotify — 800 MB                │
     │  VS Code — 1.2 GB                │
     │  Claude desktop — 600 MB         │
     │  ... encryption keys ...         │ ← everything in plaintext
     │  ... OAuth tokens ...            │
     │  ... your typed password ...     │
     └──────────────────────────────────┘
```

## Reference and image credit

- [RAM_Module_(SDRAM-DDR4).jpg](https://commons.wikimedia.org/wiki/File:RAM_Module_(SDRAM-DDR4).jpg) — ElooKoN, CC BY-SA 4.0.

## Memory peg

RAM is the desk. Fast, volatile, plaintext. Pull the plug — it forgets. Read it while it's running — you read everything.
