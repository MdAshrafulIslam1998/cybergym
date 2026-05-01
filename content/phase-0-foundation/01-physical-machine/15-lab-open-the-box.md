---
title: "0.1.L1 Lab — open the box"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.L1"
status: seedling
tags: [phase-0, physical-machine, lab, hands-on]
---

# 0.1.L1 Lab — open the box

> **The only Phase 0 lab that requires a screwdriver. Touch the parts you've been reading about for the last 15 lessons.**

---

## Why this lab exists

Reading about a CPU is one thing. Holding one in your hand and seeing how absurdly small it is — and how much heatsink it needs — is another. This lab makes the abstract concrete.

If you don't have a desktop tower, **substitute equivalents are fine** — a friend's PC, a workshop machine, an old salvage box from a recycling centre. **Do not open your only working laptop** unless you've done this before. Many laptops use proprietary ribbon cables that snap if you sneeze at them.

## What you'll need

- A **desktop PC tower** (any age, any condition — even a dead one is perfect for learning)
- A **Phillips #2 screwdriver**
- Optional: **anti-static wrist strap** (or just touch a metal radiator before handling parts)
- A camera/phone for photos

## Safety

- **Unplug the PSU from the wall.** Hold the power button for 5 seconds after unplugging to discharge capacitors.
- **Discharge static** by touching a grounded metal object before handling components.
- **Don't force anything.** Modern PCs are designed to come apart easily — if it's stuck, you missed a screw.

## The mission

Take 30 minutes. Do these in order:

### 1. Map the outside

Take a photo of the back panel. Identify:

- USB ports (count them — how many? what colours?)
- Display outputs (HDMI, DisplayPort)
- Ethernet jack
- Audio jacks
- Power input

### 2. Open the side panel

Most cases: two thumb screws at the back, slide the panel off. Photo of the inside.

### 3. Identify the eight parts from lesson 0.1.4

Without looking back at the lesson, point to:

1. Motherboard
2. CPU (under the heatsink)
3. RAM sticks
4. Storage (HDD, SSD, M.2)
5. GPU (if installed)
6. PSU
7. Cooling (fans, heatsink, possibly liquid loop)
8. Case + I/O panel

If you missed any, re-read 0.1.4 and try again.

### 4. Take one component out and put it back

Recommended: **a RAM stick**. Push the latches at both ends of the slot outward, the stick pops up. Gently pull it out. Look at the gold contacts. Look at the chips on it. Identify the brand printed on the chips.

To reseat: align the notch on the stick with the notch in the slot (they only go in one way), push down firmly until both latches click closed.

If you're brave, try **the SSD** — usually one or two screws. Don't unplug data cables yet, just unscrew it from its mount.

### 5. Boot it back up

Put the panel on, plug in, power up. If it doesn't boot, RAM is the most common culprit — open it back up, reseat the RAM, try again.

## What to write in your notes

Copy this template into a new note in `content/phase-0-foundation/01-physical-machine/lab-1-open-the-box-write-up.md` (or use the `99-Templates/lab-writeup-template.md`). Fill in:

- **Photo:** outside back panel, inside open case (mark the eight components)
- **CPU model:** (read from the heatsink or BIOS)
- **RAM:** size, type (DDR4 / DDR5), speed
- **Storage:** what's installed?
- **GPU:** dedicated or integrated?
- **PSU wattage:**
- **One thing that surprised you:**
- **One thing you'd want to look at deeper:**

## Why this matters for security

Physical access defeats most software defences. An attacker who can open your case can:

- **Reset the BIOS** by removing the CMOS battery for 30 seconds — wipes BIOS passwords.
- **Boot from a USB stick** to a live Linux that reads your disk (defeated by full-disk encryption).
- **Pull the SSD** and read it offline (defeated by full-disk encryption).
- **Plant a hardware keylogger** between keyboard and motherboard.
- **Reflash the firmware chip** with a malicious BIOS (LoJax-style implant).

Knowing the inside of a PC is the first step to thinking about physical-access threat models — which matter for laptops in cafes, BYOD policies, server-room security, and the "evil maid" scenario.

## Memory peg

Eight parts. You've now touched all of them. The machine is no longer a black box.
