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

## Why a hacker cares

The motherboard is the city — and there are corners attackers love:

- **Firmware / BIOS / UEFI chip** runs **before the OS does**, so malware that lives there ("bootkits" like LoJax, BlackLotus) survives a full Windows reinstall and is invisible to OS-level antivirus.
- **Chipset firmware** has its own attack surface. Intel's Management Engine (ME) and AMD's PSP are tiny computers inside the chipset that run independent of the main CPU and can do scary things (out-of-band access). Researchers have found vulnerabilities in both.
- **DMA attacks** — devices on PCIe / Thunderbolt / FireWire can read main memory directly without asking the CPU. A malicious Thunderbolt dock can dump RAM. (Modern protections: IOMMU, kernel DMA protection.)
- **Evil maid attacks** — an attacker with brief physical access plugs a malicious USB or PCIe device and reflashes the BIOS. Now the laptop is theirs forever.
- **Supply chain** — backdoored motherboards out of factory. The Bloomberg "Big Hack" story (2018) claimed Chinese spies had planted rice-grain-sized chips on Supermicro server boards. Disputed, but the *threat model* is taken seriously.

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

## Memory peg

Motherboard = city. Buses = highways. The chipset is a second mayor handling slow boring traffic so the CPU can focus on the fast stuff.
