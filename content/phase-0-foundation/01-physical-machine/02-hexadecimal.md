---
title: "0.1.3 Hexadecimal and why engineers love it"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.3"
status: seedling
tags: [phase-0, physical-machine, fundamentals]
---

# 0.1.3 Hexadecimal and why engineers love it

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

## Why an engineer cares

You will see hex *constantly*:

- **Memory addresses** — `0x7ffd2a1c0010` in a debugger, a stack trace, or a core dump.
- **Hashes** — git commit IDs (`5d41402a...`), file checksums, content-addressable storage.
- **Colour codes** — `#FF6B6B` on every web page you'll ever style.
- **MAC addresses, IPv6 addresses, UUIDs** — all hex.
- **Reading binary file formats** — magic numbers (`50 4B 03 04` = ZIP, `89 50 4E 47` = PNG).

Hex is the engineer's universal way of looking at raw bytes without going cross-eyed in binary.

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

Hex is just binary in shorter clothes. Two hex digits = one byte. Read enough crash dumps and you'll start *thinking* in 