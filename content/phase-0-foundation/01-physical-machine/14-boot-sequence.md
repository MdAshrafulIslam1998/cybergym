---
title: "0.1.15 The full boot sequence"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.15"
status: seedling
tags: [phase-0, physical-machine, boot]
---

# 0.1.15 The full boot sequence

> **In one line:** between you pressing the power button and seeing the login screen, *seven* distinct programs run in a chain — and a foothold at any one of them owns the rest.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/UEFI_boot_process.png?width=1200" alt="UEFI boot process block diagram." />
  <figcaption>Boot is a chain of trust. Every step loads or trusts the next one, so early compromise becomes very powerful. Image: Wikimedia Commons, UEFI boot process.png.</figcaption>
</figure>

---

## A story — Stuxnet, the worm that walked the chain

In 2010, security researchers found something extraordinary on a USB stick from an Iranian nuclear facility. The malware — **Stuxnet** — had been written by a national security agency (later confirmed: a joint US/Israeli operation called Olympic Games). Its target was specific: industrial PLCs controlling uranium-enrichment centrifuges at Natanz.

But the part that stunned researchers was the *boot chain* attack. Stuxnet exploited **four zero-day Windows vulnerabilities at once** — unprecedented for in-the-wild malware — and used **two stolen code-signing certificates** from Realtek and JMicron so its drivers loaded as trusted, in the early Windows boot phase. It hooked into the OS so deep that it could spoof the centrifuge sensor readings to operators while quietly destroying the centrifuges.

The lesson: each step in the boot sequence trusts the step before it. Compromise step 2 and steps 3, 4, 5, 6, 7 all blindly trust your malicious payload. Stuxnet showed nation-states had figured this out a decade ago.

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

## Why a hacker cares

Each stage is a different attack surface:

| Stage | Famous attack | Defence |
|---|---|---|
| Firmware | LoJax, BlackLotus, MoonBounce | Secure Boot, TPM measured boot, vendor firmware updates |
| Bootloader | Bootkits before Secure Boot | Secure Boot, signed bootloaders |
| Kernel | Stuxnet's stolen-cert drivers | Driver signing enforcement, HVCI |
| Init / services | Persistence via scheduled tasks, services | EDR, Sysmon, audit policies |
| Login | Keystroke loggers, fake login screens | Kerberos, PAM hardening, MFA |

The earlier in the chain you compromise, the harder it is for downstream defences to detect you. Bootkits are gold standard. That's why mature defences (BitLocker + TPM + Secure Boot + HVCI + Defender) try to enforce trust *all the way down*.

For a defender investigating a compromised machine, the boot chain is your forensic timeline: anything that runs at stage 5 or 6 leaves logs in the kernel's event tracing, scheduled tasks, services, registry run keys. Anything at stage 2-4 is much harder to see — you may need to dump and analyse the firmware itself.

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
   [ Welcome, Trupples ]

   ↑ each step trusts the previous. Compromise step N → own steps N+1 to 7.
```

## Reference and image credit

- [UEFI_boot_process.png](https://commons.wikimedia.org/wiki/File:UEFI_boot_process.png) — Amila Ruwan 20, CC BY-SA 4.0.

## Memory peg

Power → firmware → bootloader → kernel → init → login. Seven hops. Each one trusts the previous. Earliest foothold wins.
