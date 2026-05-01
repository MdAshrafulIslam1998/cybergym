---
title: "0.1.9 Storage — HDD vs SSD vs NVMe"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.9"
status: seedling
tags: [phase-0, physical-machine, storage]
---

# 0.1.9 Storage — HDD vs SSD vs NVMe

> **In one line:** storage is the filing cabinet — slow compared to RAM, but it remembers everything when the power's off, which is exactly why forensics exists.

---

## A story — IBM's refrigerator with a needle on it

In 1956 IBM shipped the **RAMAC 305**, the world's first hard disk drive. It held **5 MB**. It weighed **a tonne**. Customers leased it for $3,200 a month (about $35,000 in today's money). The drive itself was the size of two refrigerators, with **fifty 24-inch aluminium platters** spinning at 1,200 RPM, and a single read/write head that physically moved between disks on a hydraulic arm.

The HDD's basic design — spinning magnetic platters, a head floating nanometres above the surface — has barely changed in 70 years. We just made the platters smaller, the head finer, the data denser. A modern 20 TB HDD fits four million times more data into a thousandth the volume.

Then in 1989 SanDisk shipped the first solid-state drive — no moving parts, just memory chips that *kept their state* without power. SSDs were thousands of times more expensive per byte. By 2010 they were merely tens of times more expensive. By 2020 they were close to parity for everyday sizes. Today, every laptop and phone uses an SSD. HDDs survive in the cheap-bulk-storage corner — your NAS, your backup drive, your data centre's cold archive.

## What's actually going on

| Type | How it stores bits | Typical speed | Typical price |
|---|---|---|---|
| **HDD** | Magnetised regions on a spinning platter, read by a moving head | 100-200 MB/s | ~$15/TB |
| **SATA SSD** | Charge trapped in NAND flash cells, no moving parts | 500 MB/s | ~$60/TB |
| **NVMe SSD** | Same NAND flash but plugged directly into PCIe lanes — bypasses the SATA bottleneck | 3,000-7,000 MB/s | ~$80/TB |

NVMe is the standard for any new build. The little M.2 stick on a modern motherboard isn't a cable — it's a direct slot into the CPU's high-speed bus. A top-tier NVMe drive is **30× faster** than a HDD for sequential reads, and **hundreds of times faster** for random access.

But "fast" hides a complication. NAND flash **wears out**. Each cell can only be written a limited number of times (a few thousand, for consumer drives). SSDs spread writes across the whole drive (**wear levelling**) to make this invisible — but if you're filling and clearing a drive constantly, you'll eventually exhaust it.

## Why a hacker cares

Storage is *the* forensic playground:

- **Deleted ≠ gone.** When you delete a file, the OS marks the bytes as "free" — it does not erase them. Forensic tools (FTK, EnCase, Autopsy) recover deleted files from the unallocated space. To actually erase: **secure delete** (overwrite, multi-pass) on HDDs, or the drive's built-in **Secure Erase** command (or full-disk encryption + key destroy) on SSDs.
- **SSD wear levelling makes secure deletion harder.** Overwriting "the file" doesn't help — the controller may have already moved the original blocks somewhere else and just remapped the pointer. The only reliable wipes for SSDs are the firmware-level Secure Erase or destruction.
- **Slack space and unallocated space** — every file that doesn't perfectly fill its allocated blocks leaves bytes of the previous file in the leftover. Forensics loves this.
- **Encrypted drives** — full-disk encryption (BitLocker, LUKS, FileVault) is the single best defence against an attacker who steals the laptop. Without the key, the drive is noise. With the key (i.e., while the user is logged in), it's transparent.
- **Disk imaging** is the first thing an incident responder does. Pull the disk, take a bit-for-bit copy, work on the copy. Never investigate the original.

## In one sketch

```
   HDD                      SSD (SATA)              NVMe SSD (M.2)
   ┌─────────┐             ┌─────────┐             ┌─────────┐
   │ ◐  ◐  ◐ │             │ ▦ ▦ ▦   │             │ ▦ ▦ ▦   │
   │ spinning│             │  flash  │             │  flash  │
   │ platters│             │  chips  │             │  chips  │
   └────┬────┘             └────┬────┘             └────┬────┘
        │ SATA cable           │ SATA cable           │ direct PCIe
        ▼                       ▼                       ▼
     150 MB/s                500 MB/s              5,000 MB/s
     $15/TB                  $60/TB                $80/TB
```

## Memory peg

HDD = spinning platters, cheap and slow. SSD = flash chips, fast. NVMe = flash chips wired directly to the CPU. Deleted files aren't gone — they're just *unmarked*.
