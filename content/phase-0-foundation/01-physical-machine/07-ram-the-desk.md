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

## Why a hacker cares

RAM is the **goldmine of forensic and offensive value** because *everything is in plaintext while the program is running*:

- **Decrypted documents** — the disk file may be encrypted, but the open document in your editor lives unencrypted in RAM.
- **Encryption keys** — your VeraCrypt, BitLocker, full-disk-encryption keys all sit in RAM while you're logged in. Cold-boot attacks chill the RAM with cooling spray (slowing the leak) and dump it before it forgets.
- **Passwords** — typed credentials, browser-stored cookies, session tokens, OAuth bearer tokens — all of them touch RAM in plaintext.
- **Live malware** — RAM-resident malware that never writes to disk. Antivirus that only scans files misses it. This is **fileless malware** and it's a major modern threat.

For defenders, **memory forensics** (tools like Volatility, Rekall) is its own specialty. Triage an incident, dump RAM first, *then* image the disk — because RAM tells you what was *running*, while the disk only tells you what's *stored*.

For offence, **Rowhammer**, **Meltdown**, and **DMA attacks** (Direct Memory Access from a malicious USB or Thunderbolt device) all let attackers read or modify RAM they shouldn't be able to touch.

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
