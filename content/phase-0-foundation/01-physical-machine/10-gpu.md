---
title: "0.1.11 GPU — the artist and the parallel calculator"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.11"
status: seedling
tags: [phase-0, physical-machine, gpu]
---

# 0.1.11 GPU — the artist and the parallel calculator

> **In one line:** the GPU started as a chip for drawing triangles fast — and accidentally became the engine of the AI revolution.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Nvidia_Geforce_6600GT_GPU_2009-01-27.jpg?width=1100" alt="An Nvidia graphics card with the heatsink removed, exposing the GPU chip." />
  <figcaption>A GPU is not just a display part anymore. It is a parallel calculator, which is why password cracking, crypto mining, simulation, and AI all care about it. Image: Wikimedia Commons, Nvidia Geforce 6600GT GPU 2009-01-27.jpg.</figcaption>
</figure>

---

## A story — from Quake to ChatGPT

In 1993, three engineers in a Denny's restaurant in California sketched a chip that would do 3D graphics so fast that PC games could finally look like arcade games. They called the company **NVIDIA**. The name comes from "invidia" — Latin for envy.

For a decade, GPUs (Graphics Processing Units) had one job: take a list of triangles, calculate where each pixel of each triangle should be drawn, and shade them. They were narrow but brutally good at it — hundreds of tiny processors all doing the same simple math in parallel.

In 2006 NVIDIA released **CUDA** — a way to write *general-purpose code* that ran on the GPU. Researchers started realising: "wait, neural networks are mostly just multiplying huge matrices, and that's the *exact same shape* as drawing triangles." A 2012 paper called **AlexNet** trained a neural network on two GeForce GTX 580s — and obliterated every previous image-recognition record. The deep-learning era began.

By 2024, NVIDIA was the most valuable company in the world. Not because of games. Because every AI lab on Earth was queueing for H100 chips at $30,000 each. The GPU went from "thing that draws Doom" to "thing that runs civilisation" in 30 years.

## What's actually going on

A **CPU** has a few powerful cores (4-32) optimised for *latency* — finishing one complex task as fast as possible. A **GPU** has *thousands* of simple cores optimised for *throughput* — doing the same simple operation on millions of pieces of data simultaneously.

| | CPU | GPU |
|---|---|---|
| Cores | 4-64 | 1,000-20,000 |
| Per-core speed | Very fast | Slow |
| Best at | Branchy, sequential code | Parallel arithmetic on huge data |
| Memory | Shares RAM | Has its own dedicated VRAM (8-80 GB) |

Modern GPUs sit in a PCIe slot with their own fans. They have their own VRAM (Video RAM, very fast — typically GDDR6 or HBM3) and their own driver. Programs explicitly upload data to the GPU, ask the GPU to compute, and download the result.

If you're not doing graphics, scientific simulation, crypto mining, or AI — your GPU is mostly idle. But for those workloads it's 10-100× faster than a CPU.

## Why an engineer cares

The GPU is the most important piece of silicon for AI engineers:

- **The entire AI/ML stack lives on GPU.** Training, inference, fine-tuning — if it touches a transformer, it's on a GPU. CPUs are too slow for serious matmul.
- **VRAM determines model size.** A 24 GB GPU (RTX 4090) holds different models than an 80 GB GPU (H100). Quantisation (fp16, int8, int4) is how engineers fit big models on small GPUs.
- **CUDA vs ROCm vs Metal** — NVIDIA dominates ML because of CUDA's maturity. AMD (ROCm) and Apple (Metal) are catching up. Engineering choices follow.
- **Cloud GPU economics** — an H100 on AWS is ~$2–4/hour. A multi-GPU training run is real money. Knowing how to maximise GPU utilisation (mixed precision, gradient checkpointing, batching) is an engineering skill that saves serious cost.
- **Inference vs training** — training needs raw FLOPs and big VRAM. Inference often cares more about latency, throughput, and cost-per-token. Different hardware optimises for each.
- **Beyond ML** — GPUs are also the workhorse of graphics, video encoding, scientific computing, and crypto mining (in less salubrious times).

## In one sketch

```
   CPU                            GPU
   ┌────┐                         ┌──────────────────────┐
   │ 4  │  big cores              │ ░░░░░░░░░░░░░░░░░░░░ │
   │ to │  good at one thing      │ ░ thousands of tiny ░ │
   │ 64 │  at a time              │ ░ cores all doing   ░ │
   │cores│                        │ ░ the same simple   ░ │
   └────┘                         │ ░ thing in parallel ░ │
                                  │ ░░░░░░░░░░░░░░░░░░░░ │
                                  └──────────────────────┘
   sequential, low-latency        parallel, high-throughput
```

## Reference and image credit

- [Nvidia_Geforce_6600GT_GPU_2009-01-27.jpg](https://commons.wikimedia.org/wiki/File:Nvidia_Geforce_6600GT_GPU_2009-01-27.jpg) — Henry Muehlpfordt, CC BY-SA 3.0.

## Memory peg

CPU is one chef cooking ten different dishes. GPU is a thousand line cooks all making the same omelette. AI is a lot of omelettes.
