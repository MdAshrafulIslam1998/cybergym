---
title: "0.1.14 BIOS / UEFI — the pre-OS whisper"
phase: 0
chapter: "0.1 Physical Machine"
lesson: "0.1.14"
status: seedling
tags: [phase-0, physical-machine, firmware, bios]
---

# 0.1.14 BIOS / UEFI — the pre-OS whisper

> **In one line:** BIOS / UEFI is the tiny firmware program that wakes up *before* Windows or Linux — and if an attacker owns *it*, your antivirus will never know.

---

## A story — the firmware that survived Stalin

In 1981 IBM put a small read-only chip on the original PC's motherboard. On power-on, the CPU's program counter started at a fixed address pointing into that chip — and the few KB of code stored there would do the absolute minimum needed to bring the machine to life: test RAM, find a boot disk, hand off control. They called it the **B**asic **I**nput/**O**utput **S**ystem — BIOS.

For 30 years, BIOS was almost unchanged. Then in the late 2000s, Intel pushed a replacement called **UEFI** (Unified Extensible Firmware Interface) — bigger, fancier, supports drives over 2 TB, has a proper interactive menu, and can run signed firmware to verify the OS hasn't been tampered with (Secure Boot).

Then in 2018, ESET researchers found **LoJax** — the first BIOS-resident malware *in the wild*. Russian state actors (Fancy Bear / APT28) had figured out how to write to the SPI flash chip that holds UEFI firmware. Reformatting the disk didn't help. Reinstalling Windows didn't help. Replacing the SSD didn't help. The malware was *in the motherboard's firmware chip*, surviving every wipe, ready to redeploy itself the moment a fresh OS booted. Welcome to the era of bootkits.

In 2023, **BlackLotus** went further — the first known bootkit that bypasses Secure Boot on fully-patched Windows 11. Once installed, it disables Defender, BitLocker, HVCI, and gives the attacker SYSTEM-level persistence that survives reinstalls.

## What's actually going on

The **firmware chip** on the motherboard (an SPI flash chip, typically 8-32 MB) holds the UEFI firmware. On power-on:

1. The CPU starts executing from a fixed reset vector — usually pointing into that firmware chip.
2. UEFI runs through **POST** (Power-On Self Test): test RAM, init chipset, init USB, init storage controllers.
3. UEFI loads a **bootloader** (Windows Boot Manager, GRUB, systemd-boot) from the EFI System Partition on the boot drive.
4. Bootloader loads the OS kernel.
5. Kernel takes over. UEFI stops being the conductor.

UEFI also offers a **setup menu** (the screen you get when you mash F2 / Del / F10 at boot). From there you set boot order, enable/disable Secure Boot, configure RAM speeds (XMP), enable virtualisation (VT-x / AMD-V).

**Secure Boot** is UEFI's signed-code feature: only bootloaders signed by trusted keys (Microsoft's, by default) are allowed to run. Designed to stop bootkits. Mostly works — until somebody finds a vulnerable signed loader, like BlackLotus did.

## Why a hacker cares

BIOS/UEFI is the **highest-value persistence in computing**, for both attackers and defenders:

- **Bootkits** (LoJax, BlackLotus, MosaicRegressor) survive disk wipes, OS reinstalls, even drive replacement. The only fix is **reflashing the firmware chip** — and many users don't know that's even possible.
- **Implants below the OS** can hide from every antivirus because antivirus runs *inside* the OS, and the OS doesn't know the firmware has been compromised.
- **Supply chain attacks** — compromise the manufacturer's firmware update server and you ship backdoored firmware to every customer. (See: ASUS Live Update incident, 2019.)
- **Intel ME / AMD PSP** — separate processors inside modern chipsets, running their own firmware. Out-of-band remote management. Vulnerabilities here let attackers control a machine even when it's "off."

Defences:

- **Secure Boot enabled** — block unsigned bootloaders.
- **Set a UEFI password** — stops the casual "press F2 and change boot order" attacker.
- **Keep firmware updated** — vendors release security patches. Most users never apply them.
- **Measure boot integrity** with the **TPM** chip — it can attest to remote servers that your firmware hashes are unchanged from a known-good state.

## In one sketch

```
   power on
      │
      ▼
   ┌─────────────┐
   │ UEFI / BIOS │ ← lives in SPI flash on motherboard
   └──────┬──────┘
          │ POST, init hardware, find boot device
          ▼
   ┌─────────────┐
   │ Bootloader  │ ← lives in EFI System Partition on disk
   └──────┬──────┘
          │ load kernel
          ▼
   ┌─────────────┐
   │   OS Kernel │ ← lives in OS partition
   └─────────────┘

   bootkit lives ↑↑↑ here ↑↑↑ — invisible to OS-level AV
```

## Memory peg

BIOS/UEFI runs before the OS. Whoever controls the firmware controls the machine before the OS gets a chance to defend itself.
