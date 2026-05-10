---
title: "0.1.15 The full boot sequence"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.15"
status: seedling
tags: [phase-0, physical-machine, boot]
---

# 0.1.15 The full boot sequence

> **In one line:** between you pressing the power button and seeing the login screen, *seven* distinct programs run in a chain — and understanding all seven is what separates the engineers who can debug a stuck server from the ones who reach for the help desk.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/UEFI_boot_process.png?width=1200" alt="UEFI boot process block diagram." />
  <figcaption>Boot is a chain of trust. Every step loads or trusts the next one, so early compromise becomes very powerful. Image: Wikimedia Commons, UEFI boot process.png.</figcaption>
</figure>

---

## A story — the server that wouldn't come up

3 a.m. A datacenter rack of production web servers reboots after a power blip. Six come back fine. One sits there with a black screen and a blinking cursor.

The on-call engineer SSHs in remotely — nothing, the box is offline. They open IPMI (the out-of-band management console) and see something almost no app developer ever sees: the actual *boot* output. The server is stuck on a single line — `error: file '/boot/grub/i386-pc/normal.mod' not found`.

It's not the kernel. It's not the OS. It's not the app. It's *the bootloader* — GRUB couldn't find one of its own modules, because a recent update wrote files to a partition that was almost full and one ended up corrupted on disk.

The fix wasn't software-level. The engineer had to boot from a recovery image, mount the broken disk, and reinstall GRUB by hand.

The lesson: when production breaks, the bug isn't always in the code. Sometimes it's in step 4 of a chain that has seven steps, and you can't debug what you don't know exists.

## What's actually going on

The boot chain, simplified:

| Step | What runs | Where it lives |
|---|---|---|
| 1 | **Power-on** — voltages stabilise, CPU resets to a fixed address | Hardware |
| 2 | **UEFI / BIOS firmware** — POST hardware, find boot device | SPI flash chip on motherboard |
| 3 | **UEFI Secure Boot check** — verify the bootloader signature | UEFI itself |
| 4 | **Bootloader** (Windows Boot Manager, GRUB, systemd-boot) — pick a kernel, load it | EFI System Partition on disk |
| 5 | **Kernel loads** (`ntoskrnl.exe`, `vmlinuz`) — initialise drivers, mount root filesystem | Disk |
| 6 | **Init system** (`smss.exe` on Windows, `systemd` on Linux) — start services | Disk |
| 7 | **Login prompt / display manager** — you see the screen | Disk |

On a fast NVMe machine this entire chain runs in under 10 seconds. On a slow HDD desktop it can take a minute.

Each step **measures and trusts the next**. Modern systems use the **TPM** (Trusted Platform Module — a tiny crypto chip on the motherboard) to record the cryptographic hash of each step into special registers (PCRs). Later, an OS or remote server can ask the TPM "are these PCR values what we expect?" — and detect tampering.

## Why an engineer cares

The boot sequence is what production failures dance through. Each stage is a place where things can go wrong, and engineers debug all of them:

| Stage | What can break | Debug move |
|---|---|---|
| Firmware (UEFI/BIOS) | Boot order wrong, firmware out of date | UEFI settings, IPMI / iDRAC console |
| Bootloader (GRUB / Windows Boot Manager) | Corrupted, wrong partition selected | Recovery boot, reinstall bootloader |
| Kernel | Wrong kernel for hardware, missing drivers | Try previous kernel, single-user mode |
| Init / systemd | Service hangs at boot | `systemd-analyze`, look at journal logs |
| User services | App fails to start | Logs, dependency check, port conflicts |

The same idea applies to **container images** — a container's "boot" is the same chain in miniature: image layers → entrypoint → init → app. When a container won't start in production, you're debugging this same sequence at a different layer.

## In one sketch

```
   [ Power button ]
          │
          ▼
   1. CPU reset                 ─── fixed reset vector
          │
   2. UEFI firmware             ─── SPI flash on mobo
          │
   3. Secure Boot check         ─── verify bootloader signature
          │
   4. Bootloader                ─── EFI System Partition
          │
   5. Kernel load               ─── on disk
          │
   6. Init / systemd            ─── start services
          │
   7. Login / display manager   ─── you see the screen
          │
          ▼
   [ Welcome screen ]

   ↑ each step loads the next. Break step N → steps N+1 to 7 never run.
```

## Reference and image credit

- [UEFI_boot_process.png](https://commons.wikimedia.org/wiki/File:UEFI_boot_process.png) — Amila Ruwan 20, CC BY-SA 4.0.

## Memory peg

Power → firmware → bootloader → kernel → init → login. Seven hops. Each one loads th