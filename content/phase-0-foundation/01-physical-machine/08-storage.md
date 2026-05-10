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

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Samsung_NVMe_M.2_970_EVO_Plus_18540.jpg?width=1100" alt="An NVMe M.2 SSD installed on a motherboard." />
  <figcaption>Modern storage can be a tiny M.2 stick on the motherboard, but forensics still asks the old question: what did this machine remember? Image: Wikimedia Commons, Samsung NVMe M.2 970 EVO Plus 18540.jpg.</figcaption>
</figure>

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

## Why an engineer cares

Storage is where data lives between requests, and the choice shapes everything downstream:

- **IOPS and throughput** — NVMe pushes 500k+ IOPS; a spinning HDD pushes 100. That's a 5000x difference. Database performance is bound here.
- **Sequential vs random access** — log files love sequential, key-value stores love random. Pick the wrong storage and you pay 100x.
- **Latency budgets** — RAM is ns, NVMe is µs, SSD is µs–ms, HDD is ms, network is ms. Each layer is roughly 1000x slower. Caches exist because of this gap.
- **Database choice** — Postgres on NVMe is a beast. The same Postgres on HDD is a tortoise. Cloud RDS pricing reflects this; choosing the wrong tier is a real cost.
- **Cold storage / object storage** — S3 isn't disk, it's API-fronted blobs with very different latency characteristics. Knowing when to use S3 vs RDS vs DynamoDB is system design 101.

Storage isn't just "where the bytes go." It's a performance decision with cost attached.

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

## Reference and image credit

- [Samsung_NVMe_M.2_970_EVO_Plus_18540.jpg](https://commons.wikimedia.org/wiki/File:Samsung_NVMe_M.2_970_EVO_Plus_18540.jpg) — Michael Wolf, CC BY-SA 3.0.

## Memory peg

HDD = spinning platters, cheap and slow. SSD = flash chips, fast. NVMe = flash chips wired directly to the CPU. Deleted files aren't gone — they're just *unmarked*.
