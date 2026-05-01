---
title: "0.1.6 How a CPU runs one instruction"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.6"
status: seedling
tags: [phase-0, physical-machine, cpu]
---

# 0.1.6 How a CPU runs one instruction

> **In one line:** the CPU's life is a four-step loop — fetch, decode, execute, store — and once you see it, every line of code in every language collapses into the same picture.

---

## A story — von Neumann's napkin

In 1945, **John von Neumann** wrote a 101-page draft report on a machine called EDVAC. Buried in it was an idea so obvious in hindsight that it now bears his name: **store the program in memory, alongside the data.**

Before that, computers like ENIAC had to be physically *rewired* to run a different program. Six women — Kathleen McNulty, Frances Bilas, Betty Jean Jennings, Ruth Lichterman, Marlyn Wescoff, Frances Snyder — would spend days re-plugging cables for each new computation. von Neumann's insight: if instructions are just numbers, store them in the same memory as the data, and the CPU can read them like it reads anything else. To change the program, just load different numbers.

This is the **von Neumann architecture**. Every laptop, phone, server, and gaming console is built on it. The fetch-decode-execute loop is its heartbeat.

## What's actually going on

Inside the CPU there's a special register called the **program counter** (PC) — a number that says "the instruction I'm running next lives at this memory address." Then the loop:

1. **Fetch** — the CPU reads the instruction at the address in the PC. It's just bytes — say, `01` `8B` `45` `08`.
2. **Decode** — the CPU's circuitry looks at those bytes and figures out, "this is the `MOV` instruction; it copies the value at memory offset 8 into register EAX."
3. **Execute** — actually do it. Read the value, copy it into the register.
4. **Store / advance** — write any results back, increment the program counter to point at the next instruction.

Then back to step 1. Modern CPUs do this **billions of times per second** per core, and they cheat: they **pipeline** (start fetching the next instruction before the current one finishes), **predict branches** (guess which way an `if` will go and start running ahead), and **execute out of order** (do later instructions first if they don't depend on earlier ones).

## Why a hacker cares

This loop is the playground for the deepest exploits in security:

- **Spectre (2018)** abused **branch prediction**. The CPU was speculatively executing instructions down the wrong path of an `if` — and even though it threw the results away, the *cache state* leaked information about secrets. Attackers learned to read kernel memory from a JavaScript ad.
- **Return-oriented programming (ROP)** doesn't inject new code at all — it strings together tiny fragments of *existing* trusted code by overwriting return addresses on the stack. The CPU happily executes them because, to the CPU, they're just instructions at the address the PC points to.
- **Shellcode injection** is the old-school version: convince the CPU to set its program counter to data the attacker controls (your input buffer), and the CPU will execute that data as instructions.

Everything the CPU does, it does because the program counter pointed there. **Whoever controls the PC, controls the machine.**

## In one sketch

```
        ┌─────────────────────┐
        │   Program Counter   │ ← address of next instruction
        └──────────┬──────────┘
                   │
                   ▼
   ┌──────────  RAM  ──────────┐
   │  ... 8B 45 08 ...         │ ← bytes that say "MOV EAX, [EBP+8]"
   └────────┬──────────────────┘
            │  fetch
            ▼
   ┌─────────────────┐
   │     Decode      │ ← what does this byte sequence mean?
   └────────┬────────┘
            │
            ▼
   ┌─────────────────┐
   │     Execute     │ ← do the thing
   └────────┬────────┘
            │
            ▼
   ┌─────────────────┐
   │  Store + PC++   │ ← write result, advance to next instruction
   └─────────────────┘
            │
            └────► back to fetch
```

## Memory peg

Fetch, decode, execute, store. Whoever controls the program counter controls the CPU.
