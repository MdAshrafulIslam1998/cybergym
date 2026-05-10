---
title: "0.1 Physical Machine"
phase: 0
chapter: "0.1 Physical Machine"
status: writing
tags: [phase-0, physical-machine, hardware, index]
---

# 0.1 — Physical Machine

> **In one line:** before you build for a computer, you should know what one actually is — down to the box and the wires.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer_from_inside_018.jpg?width=1100" alt="The inside of a desktop computer case showing the motherboard and connected components." />
  <figcaption>A computer stops being mysterious once you see the inside: board, wires, slots, fans, storage, power. Image: Wikimedia Commons, Computer from inside 018.jpg.</figcaption>
</figure>

Most software engineers skip hardware. They learn it the hard way years later — when a memory leak crashes production, when a 100ms latency they can't explain shows up in profiling, when an ML model won't fit in VRAM and they don't know why.

We won't skip it. This chapter walks you through the machine like a curious mechanic walks around a car for the first time.

The tone for this chapter is simple: **touch the real thing first, name the technical thing second, then ask what an engineer would do with it.** That is the Feynman-style ladder for hardware literacy.

By the end you'll be able to:

- Open up a PC tower and name every part on the motherboard
- Explain what happens between pressing the power button and seeing the login screen
- Point at any component and say what an engineer's design or performance choice would be around it

## Lessons

1. [[00-what-is-a-computer|0.1.1 What a computer actually is]]
2. [[01-bits-and-bytes|0.1.2 Bits and bytes — how machines count]]
3. [[02-hexadecimal|0.1.3 Hexadecimal and why engineers love it]]
4. [[03-tour-of-a-pc|0.1.4 Tour of a PC tower]]
5. [[04-cpu-the-worker|0.1.5 The CPU — the worker]]
6. [[05-fetch-decode-execute|0.1.6 How a CPU runs one instruction]]
7. [[06-registers-and-cache|0.1.7 Registers and cache]]
8. [[07-ram-the-desk|0.1.8 RAM — the desk]]
9. [[08-storage|0.1.9 Storage — HDD vs SSD vs NVMe]]
10. [[09-motherboard-and-buses|0.1.10 Motherboard, chipset, buses]]
11. [[10-gpu|0.1.11 GPU — the artist and the parallel calculator]]
12. [[11-power-cooling-case|0.1.12 Power, cooling, the case]]
13. [[12-input-output|0.1.13 I/O — keyboard, mouse, USB, monitor]]
14. [[13-bios-uefi|0.1.14 BIOS / UEFI — the pre-OS whisper]]
15. [[14-boot-sequence|0.1.15 The full boot sequence]]
16. 🧪 [[15-lab-open-the-box|0.1.L1 Lab — open the box]]

## Image credit

- [Computer_from_inside_018.jpg](https://commons.wikimedia.org/wiki/File:Computer_from_in