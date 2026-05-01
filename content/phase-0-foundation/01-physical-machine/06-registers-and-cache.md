---
title: "0.1.7 Registers and cache"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.7"
status: seedling
tags: [phase-0, physical-machine, cpu, memory]
---

# 0.1.7 Registers and cache

> **In one line:** RAM is *slow* compared to the CPU, so chip designers put tiny ultra-fast scratchpads inside the CPU itself — registers and cache — to keep the worker fed.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Typical_Cpu_cache_organization.svg?width=900" alt="Diagram of a typical CPU cache organization." />
  <figcaption>Cache is a speed trick made physical: keep the next likely bytes close to the CPU so the core does not wait around for RAM. Image: Wikimedia Commons, Typical Cpu cache organization.svg.</figcaption>
</figure>

---

## A story — the chef and the pantry

Imagine a chef working at a kitchen counter. Right in front of her: a small cutting board, holding the onion she's chopping right now. That's a **register**.

On the counter beside her: a tray with the next four ingredients she'll use in this dish. That's the **L1 cache**.

Across the kitchen: a shelf with all the ingredients for tonight's menu. That's the **L2 cache**.

Down in the basement: the cold-room with every ingredient the restaurant owns. That's the **L3 cache**.

Down the street: the warehouse. A truck has to go fetch from there. That's **RAM**.

Across town in another city: a long-haul shipment from the wholesaler. That's the **SSD**.

The chef can chop the onion in half a second. Reaching to the counter for the next ingredient: still fast. Walking to the shelf: noticeable pause. Down to the basement: real wait. To the warehouse: she's standing around for ages. To the wholesaler: forget it, she'll cook something else.

This is exactly the modern memory hierarchy. The CPU operates on numbers measured in **picoseconds**. Reaching out to RAM takes **nanoseconds** — sounds tiny, but that's *thousands* of CPU cycles wasted waiting. So designers stacked progressively slower, larger memories close to the CPU to hide the wait.

## What's actually going on

| Level | Size | Speed (latency) | Where it lives |
|---|---|---|---|
| **Registers** | ~16 to 32 slots, each 64 bits | ~0.3 ns (1 CPU cycle) | Inside the core itself |
| **L1 cache** | ~64 KB per core | ~1 ns (3-4 cycles) | Inside the core |
| **L2 cache** | ~1 MB per core | ~3 ns (~10 cycles) | Per core or shared |
| **L3 cache** | ~16-64 MB shared | ~10 ns (~40 cycles) | Shared across cores |
| **RAM** | 8-128 GB | ~80 ns (~300 cycles) | Sticks on the motherboard |
| **SSD** | 256 GB - 4 TB | ~100,000 ns | M.2 slot |
| **HDD** | 1-20 TB | ~10,000,000 ns | SATA cable |

Each level up is roughly **10× slower and 10–100× bigger**. Programmers don't usually manage this manually — the CPU does it automatically, copying data from RAM into cache, from cache into registers, as needed. But cache-aware code can run **10× faster** than cache-oblivious code doing the same thing.

## Why a hacker cares

Cache is *itself* an attack surface — and a magnificent one:

- **Spectre / Meltdown (2018)** worked because the CPU left **traces in the cache** even when it threw away the results of speculative execution. By measuring how fast certain memory addresses loaded (cached = fast, uncached = slow), an attacker could *infer* secret values the CPU had peeked at.
- **Cache timing attacks** on cryptography — by measuring how long an AES round takes (and which cache lines were hit), researchers can recover the encryption key. Modern crypto libraries (`OpenSSL`, etc.) write their critical loops in *constant time* specifically to defeat this.
- **Rowhammer (2014)** — physically *flipping bits* in RAM by repeatedly hammering nearby rows. Used to escalate from userland to kernel. Doesn't touch cache, but lives in the same neighbourhood.

If you ever wondered why CPU vendors release patches that say "performance regression of 5–30% in some workloads" — those are usually mitigations for cache-side-channel attacks.

## In one sketch

```
       (slowest, biggest)                       (fastest, tiniest)
   ┌──────┐  ┌──────┐  ┌──────┐  ┌──────┐  ┌──────┐  ┌──────┐
   │ HDD  │→ │ SSD  │→ │ RAM  │→ │  L3  │→ │ L1/2 │→ │ Regs │
   └──────┘  └──────┘  └──────┘  └──────┘  └──────┘  └──────┘
   10 ms     0.1 ms    80 ns     10 ns     1-3 ns    0.3 ns
```

## Reference and image credit

- [Typical_Cpu_cache_organization.svg](https://commons.wikimedia.org/wiki/File:Typical_Cpu_cache_organization.svg) — Chomwitt, CC BY-SA 3.0.

## Memory peg

Registers are the cutting board, cache is the counter and shelf, RAM is the warehouse. The closer to the CPU, the faster, smaller, and more expensive per byte.
