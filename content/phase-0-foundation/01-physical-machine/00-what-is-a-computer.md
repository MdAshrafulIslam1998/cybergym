---
title: "0.1.1 What a computer actually is"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.1"
status: seedling
tags: [phase-0, physical-machine, history]
---

# 0.1.1 What a computer actually is

> **In one line:** a computer is a machine that takes input, follows instructions, and produces output — and it has been that since long before electricity.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/ENIAC_Penn1.jpg?width=1100" alt="Two panels of ENIAC, an early electronic general-purpose computer." />
  <figcaption>ENIAC looks ancient now, but the deep idea is modern: input comes in, instructions run, output comes out. Image: Wikimedia Commons, ENIAC Penn1.jpg.</figcaption>
</figure>

---

## A story — the loom that tried to think

In 1804, a French weaver named **Joseph Marie Jacquard** built a loom that could weave any pattern you wanted by reading **punched cards** strung together like a player-piano roll. Each hole in the card lifted a thread; each blank held it down. Change the cards, change the cloth. The loom didn't "know" anything — it just *followed instructions on a card*.

A few decades later, Ada Lovelace looked at Charles Babbage's mechanical "Analytical Engine" and realised the same trick worked for *numbers*. If you could feed a machine a deck of cards, the machine could compute anything you could express as a sequence of steps. She wrote the first algorithm in 1843 — for a machine that was never finished.

In 1936, **Alan Turing** stripped the idea down to its skeleton. He imagined a tape, a head that reads symbols, and a tiny rulebook telling the head what to do next. He proved that this absurdly simple device — the Turing Machine — could compute *anything any computer can ever compute*. Every laptop, phone, and cloud server you'll ever defend is, mathematically, a Turing Machine wearing fancier clothes.

A decade later, the first electronic computer — **ENIAC** (1945) — filled a room at the University of Pennsylvania, weighed 27 tonnes, and was programmed by women rewiring it by hand. It did the same thing Jacquard's loom did: read instructions, follow them, produce output. Just faster.

## What's actually going on

Strip away the screen and keyboard. A computer is **three things in a loop**:

1. **Input** — something comes in (a key press, a network packet, a file).
2. **Processing** — the machine follows pre-written instructions to transform it.
3. **Output** — something comes out (a pixel, a packet, a file).

That's it. The "thinking" is an illusion produced by doing this loop billions of times per second on data that came from somewhere and is going somewhere else.

## Why a hacker cares

Every cyber attack happens at one of those three points. **Input attacks** are the biggest family — SQL injection, prompt injection, buffer overflows, malformed packets — all of them are "I gave the machine input it didn't expect, and made it do something the programmer didn't plan for." **Processing attacks** are rarer and uglier — Spectre, Meltdown, side-channel attacks on the CPU itself. **Output attacks** are how data leaks — reading log files, screenshots, network exfiltration.

If you remember nothing else from this lesson, remember: **a computer is a thing that follows instructions on input it was given.** When something goes wrong in security, the bug is almost always in *what the input was* or *what the instruction said*.

## In one sketch

```
INPUT  →  [ instructions ]  →  OUTPUT
            ▲       │
            └───────┘  (state — what it remembers between steps)
```

## Reference and image credit

- [ENIAC_Penn1.jpg](https://commons.wikimedia.org/wiki/File:ENIAC_Penn1.jpg) — Paul W. Shaffer / University of Pennsylvania, GFDL / CC BY-SA 3.0.

## Memory peg

Jacquard's loom in 1804 was already a computer. The only thing that changed since is speed.
