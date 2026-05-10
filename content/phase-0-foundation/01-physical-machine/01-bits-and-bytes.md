---
title: "0.1.2 Bits and bytes — how machines count"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.2"
status: seedling
tags: [phase-0, physical-machine, fundamentals]
---

# 0.1.2 Bits and bytes — how machines count

> **In one line:** computers only know two things — on and off — and *everything else* (text, photos, neural networks, your bank balance) is just a clever arrangement of those.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Transistor_switch_circuit_photo_on.jpg?width=900" alt="A simple transistor switch circuit on a breadboard." />
  <figcaption>A bit begins as a yes/no physical state. This simple transistor switch is the baby version of the same idea inside a chip. Image: Wikimedia Commons, Transistor switch circuit photo on.jpg.</figcaption>
</figure>

---

## A story — Claude Shannon and the marriage of math and electricity

In 1937 a 21-year-old MIT graduate student named **Claude Shannon** wrote what's been called the most important master's thesis of the 20th century. He noticed that the **on/off behaviour of an electrical switch** was identical to the **true/false behaviour of George Boole's algebra** — a system of logic invented in 1854 that nobody outside maths had bothered with for 80 years.

If a switch being closed = "true," and open = "false," then a circuit with two switches in *series* is a logical AND. Two switches in *parallel* is OR. A relay that flips its output is a NOT. Suddenly any logic problem in the universe could be wired up out of switches.

The switches got smaller (vacuum tubes → transistors → integrated circuits → chips with **5 billion transistors** on a thumbnail), but Shannon's insight is still the foundation. **Every modern processor is a giant pile of switches arranged to do logic.**

## What's actually going on

The single switch — on or off — is called a **bit**. Computers count using just two digits, **0 and 1**. This is **binary**.

Eight bits in a row make a **byte**. A byte can hold any number from 0 to 255 (because there are 2⁸ = 256 combinations). Why eight? Mostly historical accident — IBM standardised on it in the 1960s and it stuck.

Once you have bytes, you can encode anything by agreeing on a code:

| What | How it's stored |
|---|---|
| The letter 'A' | The byte `01000001` (= 65 in decimal, ASCII code for A) |
| The number 1000 | Two bytes: `00000011 11101000` |
| A red pixel | Three bytes: `11111111 00000000 00000000` (255 red, 0 green, 0 blue) |
| The word "hi" | Two bytes: `01101000 01101001` |

There is *no* deep meaning to a byte. It's just eight bits. Whether `01000001` means "the letter A," "the number 65," or "the colour value 65" depends entirely on what code the program is using to read it.

## Why an engineer cares

Bits and bytes show up the moment you leave the cosy world of high-level languages:

- **Endianness** bites every engineer who has to serialize data across machines (network protocols, file formats, GPUs talking to CPUs).
- **Numeric precision** — `0.1 + 0.2 != 0.3` in float math. Money should never be in float. ML training uses fp16 / bf16 / int8 to fit bigger models in the same memory.
- **Memory layout** — packing structs, alignment, cache lines. Performance work lives here.
- **Database column types** — `int` vs `bigint`, `varchar(255)` vs `text`, `timestamp` precision — every choice is bytes on disk.

The same bits can mean different things depending on how the program reads them. Most data bugs are interpretation bugs.

## In one sketch

```
1 bit   = 1 switch          (on / off)
1 byte  = 8 bits            (0 to 255)
1 KB    = 1,024 bytes
1 MB    = 1,024 KB          ≈ a small photo
1 GB    = 1,024 MB          ≈ a feature film
1 TB    = 1,024 GB          ≈ a small NVMe drive
```

## Reference and image credit

- [Transistor_switch_circuit_photo_on.jpg](https://commons.wikimedia.org/wiki/File:Transistor_switch_circuit_photo_on.jpg) — Filip Dominec, GFDL / CC BY-SA 3.0.

## Memory peg

A bit is a switch. A byte is eight switches. Everything else — every selfie, every kernel exploit, every weight in GPT-5 — is a stack of those switches with a code attached.
