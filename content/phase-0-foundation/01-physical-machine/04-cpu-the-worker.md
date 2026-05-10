---
title: "0.1.5 The CPU — the worker"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.5"
status: seedling
tags: [phase-0, physical-machine, cpu]
---

# 0.1.5 The CPU — the worker

> **In one line:** the CPU is the only thing that *actually does anything* — every other part either feeds it instructions or stores its results.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Intel_4004.jpg?width=800" alt="Intel 4004 microprocessor package." />
  <figcaption>The Intel 4004 was tiny and slow by modern standards, but it carried the central idea: one general-purpose chip, many possible instructions. Image: Wikimedia Commons, Intel 4004.jpg.</figcaption>
</figure>

---

## A story — the chip that was meant for a calculator

In 1969 a Japanese company called **Busicom** asked Intel — then a tiny startup — to design twelve custom chips for a desktop calculator. Intel had a young engineer named **Ted Hoff** who looked at the spec, sighed, and said: "what if instead we build *one* general-purpose chip that runs calculator software?"

That chip — the **Intel 4004** — shipped in 1971. It had **2,300 transistors**, ran at 740 kHz, and could do roughly 92,000 instructions per second. It cost $200. Busicom got their calculator. Intel got the future.

Today's Apple M3 Max has **92 billion transistors** running at 4 GHz — about **40 million times** faster than the 4004, and 40 million times more transistors. But the *idea* is identical. A CPU is a single chip that does one thing very well: it follows instructions, one after another, very fast.

## What's actually going on

The CPU (Central Processing Unit) is a tiny silicon square — usually 1–4 cm² — packed with billions of transistors arranged into circuits that do exactly four things:

1. **Fetch** an instruction from memory.
2. **Decode** what the instruction means.
3. **Execute** it (add, compare, jump, read, write…).
4. **Store** the result somewhere.

That's it. That's the whole job. The CPU does this loop billions of times per second.

A modern CPU has multiple **cores** — independent workers on the same chip — and each core can often run **two threads** at once (Intel calls this Hyper-Threading). A desktop CPU might be "8-core / 16-thread," meaning sixteen instruction streams running in parallel.

The CPU also has **caches** built in (we'll cover those in 0.1.7) — tiny, fast scratchpads of memory right next to the cores so they don't have to wait for slow RAM every time they need a value.

## Why an engineer cares

The CPU is the heart of every performance discussion:

- **Cores and threads** — modern code that doesn't take advantage of multiple cores leaves the box mostly idle. Knowing the difference between *parallelism* (many cores) and *concurrency* (one core, juggling) is the difference between a senior and a junior.
- **Clock speed vs IPC (instructions per cycle)** — 3 GHz isn't always faster than 2.5 GHz; modern CPUs do more per tick.
- **Microcode updates** — Intel and AMD ship CPU bug-fixes through the OS. Knowing this exists explains why a kernel update sometimes changes performance.
- **CPU vs GPU vs accelerator** — your engineering instinct should be "what is the right silicon for this workload?" — CPUs for branchy logic, GPUs for parallel matmul, TPUs/NPUs for ML inference.
- **ARM vs x86** — Apple Silicon, AWS Graviton, mobile devices are all ARM. Code needs to be portable; performance assumptions don't carry across architectures.

## In one sketch

```
   ┌─────────────── CPU chip ────────────────┐
   │                                         │
   │   ┌───────┐  ┌───────┐  ┌───────┐       │
   │   │ Core 1│  │ Core 2│  │ Core 3│  ...  │
   │   │ + L1$ │  │ + L1$ │  │ + L1$ │       │
   │   └───────┘  └───────┘  └───────┘       │
   │                                         │
   │   ┌─────────────────────────────────┐   │
   │   │       Shared L2 / L3 cache       │   │
   │   └─────────────────────────────────┘   │
   │                                         │
   │   Memory controller ▸  to RAM           │
   └─────────────────────────────────────────┘
```

## Reference and image credit

- [Intel_4004.jpg](https://commons.wikimedia.org/wiki/File:Intel_4004.jpg) — LucaDetomi, GFDL / CC BY-SA 3.0.

## Memory peg

Fetch, decode, execute, store. Repeat 4 billion times a second. That's all a CPU does. Everything else is decoration.
