---
title: "0.1.10 Motherboard, chipset, buses"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.10"
status: seedling
tags: [phase-0, physical-machine, hardware]
---

# 0.1.10 Motherboard, chipset, buses

> **In one line:** the motherboard is the city — the CPU is downtown, RAM and SSD are the suburbs, and the buses are the highways carrying bytes between them.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer-motherboard.jpg?width=1100" alt="A desktop motherboard showing sockets, slots, chips, and connectors." />
  <figcaption>The motherboard is the physical map of the machine: sockets, slots, copper traces, firmware chip, and roads for bytes. Image: Wikimedia Commons, Computer-motherboard.jpg.</figcaption>
</figure>

---

## A story — the city that grew an open standard

Early PCs had a problem: every expansion card spoke its own language. Adding a sound card meant praying it was compatible. In 1992 Intel released **PCI** (Peripheral Component Interconnect) — a standard "highway" any vendor could plug into. Suddenly you could mix-and-match cards from different makers without driver drama.

PCI got faster (PCI-X), then was replaced by **PCI Express** (PCIe) in 2004. PCIe is what the long slot under your GPU is. It's also what the M.2 NVMe slot is. It's also what the chipset uses to talk to the CPU. PCIe is the *backbone bus* of every modern PC — it scales by adding "lanes" (a graphics card uses 16 lanes, an NVMe drive uses 4, a Wi-Fi card uses 1).

USB has a similar history — Intel/Microsoft/Compaq pushed it as an open standard in 1996 to replace the dozen weird ports a PC used to have (PS/2, serial, parallel, game port). It worked. USB is now the universal answer to "how do I plug X into a PC?"

## What's actually going on

The **motherboard** is a printed circuit board (PCB) — multiple layers of copper traces sandwiched in fibreglass — that physically connects every component and provides the wires they communicate over.

Key parts of a modern motherboard:

| Component | What it is |
|---|---|
| **CPU socket** | Where the CPU sits. Intel uses LGA (pins on the socket); AMD uses PGA (pins on the chip). |
| **RAM slots** | Usually 2 or 4 long slots for DIMM sticks. |
| **PCIe slots** | Long slots for GPUs and expansion cards (×16, ×8, ×4, ×1). |
| **M.2 slots** | Tiny slots for NVMe SSDs and Wi-Fi cards. |
| **SATA ports** | Older flat connectors for HDDs and SATA SSDs. |
| **Chipset** | A second chip (usually under a heatsink) that handles slower I/O — USB, audio, SATA, network. |
| **VRMs** | Voltage Regulator Modules — convert PSU power to clean voltage the CPU/RAM can use. |
| **BIOS/UEFI chip** | A small flash chip that holds the firmware that boots before the OS. |
| **CMOS battery** | Coin-sized battery keeping clock and BIOS settings alive when unplugged. |

A **bus** is just a set of wires that multiple components share. The CPU has a high-speed bus to the chipset. The chipset has slower buses to USB, SATA, audio. PCIe is a packet-switched bus — more like a network than a wire.

## Why an engineer cares

The motherboard is the city, and bus capacity dictates how much can move at once:

- **PCIe lanes** — modern CPUs have 16–28 PCIe lanes. Each NVMe drive eats 4. Each high-end GPU eats 16. Multi-GPU ML rigs need motherboards with enough lanes (or PCIe switches), or they bottleneck.
- **NVMe is just PCIe** — that's why NVMe is so much faster than SATA. SATA tops out at ~600 MB/s; NVMe (Gen 4) hits 7,000 MB/s.
- **Memory channels** — dual-channel vs quad-channel changes RAM bandwidth by 2x. Workstations and servers often have more channels.
- **Bus saturation as bottleneck** — sometimes "the disk is fast but the system is slow" comes down to a saturated PCIe bus or a chipset limit nobody documented.
- **Chipset features** — features like ECC RAM, PCIe Resizable BAR, and TPM live in the chipset. Server boards have features desktop boards don't.

Buses are the highways of the box. When traffic jams up, code waits.

## In one sketch

```
   ┌──────────────── Motherboard ─────────────────┐
   │                                              │
   │   ┌─────┐    ┌────┐ ┌────┐                  │
   │   │ CPU │ ── │RAM │ │RAM │                  │
   │   └──┬──┘    └────┘ └────┘                  │
   │      │ high-speed bus                        │
   │   ┌──┴───┐                                   │
   │   │Chips │── USB, SATA, audio, network       │
   │   └──┬───┘                                   │
   │      │                                       │
   │   ┌──┴────────┐  ┌──────┐  ┌─────┐           │
   │   │ PCIe ×16  │  │ M.2  │  │BIOS │           │
   │   │  (GPU)    │  │NVMe  │  │chip │           │
   │   └───────────┘  └──────┘  └─────┘           │
   └──────────────────────────────────────────────┘
```

## Reference and image credit

- [Computer-motherboard.jpg](https://commons.wikimedia.org/wiki/File:Computer-motherboard.jpg) — Marcin Wieclaw, CC BY-SA 4.0.

## Memory peg

Motherboard = city. Buses = highways. The chipset is a second mayor handling slow boring traffic so the CPU can focus on the fast stuff.
