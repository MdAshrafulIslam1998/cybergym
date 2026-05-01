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

## Why a hacker cares

The CPU is a target *and* a weapon:

- **Spectre and Meltdown (2018)** — vulnerabilities in how CPUs do speculative execution that let untrusted code read memory it shouldn't. Affected basically every Intel chip from the previous 20 years. Patched in microcode + OS.
- **Microcode** — the CPU's own internal firmware. Intel and AMD ship microcode updates inside Windows / Linux updates. Compromise the microcode and you have a backdoor below the OS.
- **Side-channel attacks** — measure how long an instruction takes, or how much power it draws, and you can sometimes *recover encryption keys* from a CPU performing the encryption. Smart-card attacks have been doing this for 25 years.
- **Cryptojacking** — malware that quietly uses your CPU to mine cryptocurrency. Slow computer, hot lap, weird power bill.

The CPU is also the *enforcer* of security. **Privileged execution levels** (Ring 0 = kernel, Ring 3 = userland) are a CPU feature. **Virtualisation extensions** that let one machine run many isolated VMs are CPU features. **TPM and secure-enclave chips** are tiny CPUs whose only job is to keep secrets the main CPU can't see.

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

## Memory peg

Fetch, decode, execute, store. Repeat 4 billion times a second. That's all a CPU does. Everything else is decoration.
