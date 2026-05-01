---
title: "0.1.3 Hexadecimal and why hackers love it"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.3"
status: seedling
tags: [phase-0, physical-machine, fundamentals]
---

# 0.1.3 Hexadecimal and why hackers love it

> **In one line:** hex is a way of writing binary that's *just barely* readable by humans, which is why every memory address, hash, MAC address, and crash dump on the planet is in hex.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Hexadecimal_multiplication_table.svg?width=850" alt="A hexadecimal multiplication table." />
  <figcaption>Hex looks strange for about one week. Then it becomes the short, human-readable coat binary wears in debuggers, hashes, packets, and memory dumps. Image: Wikimedia Commons, Hexadecimal multiplication table.svg.</figcaption>
</figure>

---

## A story — IBM's "shorthand"

By the early 1960s engineers building IBM mainframes were tired. Reading machine state in binary — page after page of `01101100 11110000 …` — was slow and error-prone. They needed a way to write binary that fit in fewer characters but mapped *cleanly* back to bits.

**Octal** (base-8) was popular for older machines because 8 = 2³, so each octal digit equals exactly 3 bits. But IBM's new System/360 used 8-bit bytes, and 8 doesn't divide cleanly by 3.

**Hexadecimal** (base-16) does. 16 = 2⁴, so **each hex digit is exactly 4 bits** — half a byte (called a *nibble*, programmer humour). One byte fits in two hex digits. IBM picked hex for the System/360 in 1964, the rest of the industry copied them, and we've never looked back.

## What's actually going on

Hex uses sixteen digits. The first ten are 0–9. Then we run out of single digits, so we use letters A–F for 10–15.

| Decimal | Hex | Binary |
|---|---|---|
| 0 | 0 | 0000 |
| 9 | 9 | 1001 |
| 10 | A | 1010 |
| 15 | F | 1111 |
| 16 | 10 | 0001 0000 |
| 255 | FF | 1111 1111 |
| 256 | 100 | 0001 0000 0000 |

When you see `0x` at the start of a number, it means "this is hex" — `0xFF` = 255. The web colour `#FF0000` is hex for "255 red, 0 green, 0 blue."

## Why a hacker cares

You will see hex *constantly*:

- **Memory addresses** — `0x7ffd2a1c0010` says "this thing lives at this byte in RAM." Crash dumps, debuggers, and exploits speak in hex addresses all day.
- **Hashes** — an MD5 is 32 hex chars, a SHA-256 is 64. `5d41402abc4b2a76b9719d911017c592` is a hash, not a wifi password.
- **MAC addresses** — `00:1A:2B:3C:4D:5E` is six bytes in hex, identifying a network card.
- **Malware signatures** — antivirus rules often match on hex byte patterns inside files (`4D 5A` at offset 0 = a Windows executable).
- **Packet captures** — Wireshark shows raw bytes in hex columns next to their text interpretation.

When a memory-corruption exploit works, the attacker is overwriting data at hex address X with hex bytes Y to make the CPU jump to hex address Z. Reading hex fluently isn't optional — it's the language the low layers speak.

## In one sketch

```
1 byte = 2 hex digits
0xFF   = 255         = 1111 1111
0x10   = 16          = 0001 0000
0xCAFE = 51966       = 1100 1010 1111 1110     (programmers love this one)
0xDEAD = 57005       = 1101 1110 1010 1101
0xBEEF = 48879       = 1011 1110 1110 1111
```

`0xDEADBEEF` is a famous "obvious filler" value programmers stuff into uninitialised memory — if you see it in a crash dump, somebody's code forgot to set a variable.

## Reference and image credit

- [Hexadecimal_multiplication_table.svg](https://commons.wikimedia.org/wiki/File:Hexadecimal_multiplication_table.svg) — Bernard Ladenthin, CC0.

## Memory peg

Hex is just binary in shorter clothes. Two hex digits = one byte. Read enough crash dumps and you'll start *thinking* in it.
