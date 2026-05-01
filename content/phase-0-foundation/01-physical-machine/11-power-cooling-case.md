---
title: "0.1.12 Power, cooling, the case"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.12"
status: seedling
tags: [phase-0, physical-machine, hardware]
---

# 0.1.12 Power, cooling, the case

> **In one line:** every joule of electricity a computer drinks becomes either a calculation or *heat* — and unmanaged heat kills chips.

---

## A story — the data centre that drinks rivers

Google's data centres collectively consume about **20 TWh of electricity per year** — roughly the same as Switzerland. Most of that isn't computation. It's *cooling*. Server CPUs and GPUs convert almost all the energy they consume into heat — a modern AI training rack with eight H100 GPUs draws about 10 kW continuously, the same as a small house running every appliance flat-out.

Google's solution: build data centres next to cold rivers (Hamina, Finland — sea-water cooling), or in deserts at altitude (The Dalles, Oregon), and use evaporative cooling and outdoor air whenever ambient temperature allows. Microsoft has experimented with **submerging servers in the ocean** in sealed pods — the surrounding water is the perfect heat sink.

When cooling fails, the consequences are immediate. In 2017, British Airways suffered a worldwide outage when a UPS failure caused a power surge that fried critical servers — direct cost: **£80 million**. In 2021, OVHcloud's Strasbourg data centre **burned to the ground** in three hours when a UPS battery caught fire. Millions of websites went dark.

## What's actually going on

### Power Supply Unit (PSU)

The PSU takes wall AC (240V in Australia, 120V in the US) and converts it to the multiple DC voltages the motherboard needs (12V, 5V, 3.3V, and others for the CPU rail). Quality matters: a cheap PSU can fry a motherboard in a power surge. Modern PSUs are rated by efficiency (80 PLUS Bronze / Gold / Platinum / Titanium) and wattage (450W is plenty for an office PC; a gaming rig wants 750-1000W; a quad-GPU AI workstation wants 1500W+).

### Cooling

Three flavours:

1. **Air cooling** — heatsink (chunk of metal with fins) on the CPU, with a fan. Cheap, reliable, loud.
2. **Liquid (AIO) cooling** — sealed loop with a small radiator and a pump. Quieter, better for high-end CPUs.
3. **Custom water loop** — DIY hardline tubing, reservoirs. Beautiful and overkill for everything except enthusiast builds.

Heat flows from CPU → thermal paste → heatsink baseplate → fins → air. If any layer is bad (dried-out paste, dust-clogged fins, dead fan), the CPU **throttles** — slows itself to avoid damage — or eventually shuts down (Tjmax cutoff, usually around 100°C).

### Case

The metal box has three jobs: hold everything in place, channel airflow front-to-back, and keep electromagnetic interference contained. Good airflow goes intake (front, bottom) → over hot components → exhaust (rear, top).

## Why a hacker cares

- **Power-line attacks** — a motivated attacker with access to power infrastructure can extract data via *power consumption patterns* of a CPU performing crypto. Air-gapped systems aren't fully air-gapped if they're plugged in.
- **Fan-noise side channels** — researchers have demonstrated extracting CPU activity by recording fan noise (fans speed up under load).
- **Cold-boot attacks** rely on the physical property that RAM cells lose charge slowly when chilled. Spray a cold-air can on the RAM, pull the power, dump the bits in another machine before they fade.
- **Thermal attacks** — overheating a chip on purpose can cause **bit flips** that can be exploited. Some AI accelerators have been shown to misclassify under thermal stress — a concern for safety-critical systems.
- **Physical destruction** — the most reliable way to ensure data is gone is to physically destroy the storage. Drilling through the platters of a HDD, shredding an SSD's NAND chips. Major institutions have on-site shredders.

For *defenders*, the lesson is simpler: monitor temperature and power. Anomalies often signal compromise (cryptojacking spikes CPU and fan; a covert RAT may show unusual idle-time CPU usage).

## In one sketch

```
   AC wall ──→ PSU ──→ DC rails ──→ CPU, GPU, RAM, drives
                 │
                 │  power → heat
                 ▼
              ┌──────┐
              │ Cool │ ─── fans → out the back
              └──────┘
              air or liquid

   Heat path: chip → paste → heatsink → fins → fan → outside
```

## Memory peg

Watts in = computation + heat. Manage the heat or you have no computation.
