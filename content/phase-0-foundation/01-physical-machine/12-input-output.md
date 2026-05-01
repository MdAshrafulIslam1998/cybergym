---
title: "0.1.13 I/O — keyboard, mouse, USB, monitor"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.13"
status: seedling
tags: [phase-0, physical-machine, io]
---

# 0.1.13 I/O — keyboard, mouse, USB, monitor

> **In one line:** the I/O is everything that crosses the line between the human world and the silicon — and that line is exactly where most attacks come in.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/USB_Type-C.jpg?width=900" alt="A USB Type-C plug on the end of a cable." />
  <figcaption>I/O ports are doorways. Some carry keystrokes, some carry storage, some carry displays, some carry power, and attackers love doorways. Image: Wikimedia Commons, USB Type-C.jpg.</figcaption>
</figure>

---

## A story — Doug Engelbart's "mother of all demos"

On December 9, 1968, in front of a thousand engineers in San Francisco, **Doug Engelbart** sat down at a wooden box he'd built and gave the most important software demo in history.

In ninety minutes he showed: the **mouse** (a wooden block with two perpendicular wheels), real-time **video conferencing**, **collaborative document editing**, **hyperlinks**, **windowed displays**, and **dynamic outlining**. Half the audience walked out thinking they'd seen science fiction. The other half went on to build everything that would become Apple and Microsoft.

The mouse alone — patented 1970, popularised by Apple in 1984 — completely changed how humans relate to computers. Before Engelbart, you talked to a computer by typing a command. After Engelbart, you *pointed*. Every UI you've ever used is downstream of that 1968 demo.

## What's actually going on

I/O (Input/Output) is the boundary between the computer's electrical insides and the messy outside world. Inputs:

- **Keyboard** — a matrix of switches; each keypress sends a scan code to the OS via USB or PS/2.
- **Mouse / trackpad** — sends X/Y delta + button state several hundred times a second.
- **Microphone, camera** — analog → digital → USB.
- **Network port** — Ethernet, Wi-Fi, Bluetooth, cellular.
- **Storage devices** — USB drives, SD cards.

Outputs:

- **Monitor** — pixel data over HDMI / DisplayPort / Thunderbolt.
- **Speakers / headphones** — analog audio over jack, or digital over USB / Bluetooth.
- **Printer** — USB or network.

Most modern peripherals speak **USB**, the universal hardware/software protocol. USB lets the host PC enumerate devices, install drivers automatically, and share power. USB-C added the ability to do display output, charging, and Thunderbolt-grade data over the same connector.

## Why a hacker cares

I/O is **the fattest attack surface on the box**:

- **BadUSB / RubberDucky** — a USB stick that pretends to be a *keyboard*. When plugged in, it instantly types out hundreds of commands ("open PowerShell, download payload, run, hide"). Your antivirus doesn't see it because it's just keyboard input. Defence: don't plug in random USB sticks. (Yes, people still do.)
- **Malicious cables** — USB cables with hidden chips inside that exfiltrate data, or do BadUSB. The "OMG Cable" looks identical to a normal Lightning cable.
- **Juice jacking** — public USB charging ports that try to pair as a host and steal data from your phone.
- **Keyboards / keystroke logging** — wireless keyboard signals can be sniffed (older Logitech receivers were notorious). Hardware keyloggers plug between keyboard and PC.
- **Display side channels** — TEMPEST attacks read screen content from the electromagnetic emanations of a monitor across a room.
- **DMA attacks via Thunderbolt / FireWire** — see lesson 0.1.10. A "charger" plugged into a Thunderbolt port can read RAM directly.
- **Camera / mic hijacking** — RATs that quietly enable webcam without the indicator LED. Tape over the camera; physical mic switches on privacy-focused laptops.

For defenders, **endpoint USB control** (block all USB except specific allow-listed device IDs) is a common enterprise control. Air-gapped systems often have USB ports physically epoxy-filled.

## In one sketch

```
        outside world                 inside the box
   ────────────────────────       ─────────────────────────
   keyboard, mouse, mic    ─USB─→ kernel input subsystem
   USB drive, BadUSB      ─USB─→ filesystem driver / device
   network packets        ─Eth─→ NIC → TCP/IP stack
   monitor               ←HDMI── GPU framebuffer
   speakers              ←jack── audio chip
   webcam                 ─USB─→ video driver
   ────────────────────────       ─────────────────────────
        ↑ attack surface
```

## Reference and image credit

- [USB_Type-C.jpg](https://commons.wikimedia.org/wiki/File:USB_Type-C.jpg) — Flanoz, CC0.

## Memory peg

I/O = the doorways. Most attacks walk in through them. "Don't plug it in if you can't trust it" is half of endpoint security.
