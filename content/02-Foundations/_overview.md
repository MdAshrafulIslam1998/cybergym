---
title: 02 — Foundations
module: foundations
status: in-progress
created: 2026-04-30
tags: [module, foundations]
---

# Module 02 — Foundations

> *"Cybersecurity is just operating systems and networking, taken seriously."* — paraphrased, every senior I've read.

## What this module is

Everything below the security stack — how computers, networks, and operating systems actually work. I'm not skipping a single layer. The point is that when something gets attacked later, I can reason about *why* the attack works at the level it works at, not just memorize the name.

## Why this matters for AI-security specifically

ML and AI systems live on top of these same layers. A poisoned dataset hits a filesystem. A model-extraction attack hits a network. A jailbreak-via-supply-chain hits a CI/CD pipeline. Knowing the foundation lets me reason about new attacks, not just retell old ones.

## Lessons in this module

### How computers actually work
- [[How-Computers-Work|How a computer boots and runs a program]] *(to write)*
- [[CPU-and-Memory|CPU, memory hierarchy, virtual memory]] *(to write)*
- [[Storage-and-Filesystems|Storage and filesystems]] *(to write)*

### Networking
- [[Networking|Networking — the big picture]] *(to write)*
- [[OSI-and-TCPIP|OSI vs TCP/IP, why we still teach OSI]] *(to write)*
- [[Ethernet-and-WiFi|Ethernet and Wi-Fi at layer 2]] *(to write)*
- [[IP-Routing|IP, routing, subnets, NAT]] *(to write)*
- [[TCP-UDP|TCP vs UDP, the three-way handshake, ports]] *(to write)*
- [[DNS|DNS — the directory of the internet]] *(to write)*
- [[HTTP-HTTPS|HTTP/HTTPS, request lifecycle, headers, cookies]] *(to write)*
- [[TLS|TLS handshake and certificates]] *(to write)*

### Operating systems
- [[Operating-Systems|What an OS does, kernel vs userspace]] *(to write)*
- [[Processes-and-Threads|Processes, threads, scheduling]] *(to write)*
- [[Permissions-and-Users|Users, permissions, the principle of least privilege]] *(to write)*
- [[Syscalls|Syscalls and how programs talk to the kernel]] *(to write)*

### Linux command line
- [[Linux|Linux command line — daily-driver level]] *(to write)*
- [[Bash-Scripting|Bash scripting basics]] *(to write)*
- [[Linux-Networking-Tools|Linux networking tools — ip, ss, tcpdump, netstat]] *(to write)*
- [[Linux-Process-Tools|Linux process tools — ps, top, lsof, strace]] *(to write)*

### Programming refresher
- [[Programming-Refresher|Programming — what I already have, what I need]] *(to write)*
- [[Python-for-Security|Python for security work]] *(to write)*
- [[Regex|Regular expressions — pattern matching for log analysis]] *(to write)*

## Recommended resources

Free / cheap, in the order I'll consume them:

| Topic | Resource |
|-------|----------|
| Networking | Professor Messer Network+ free YouTube series |
| Networking deeper | "Computer Networking: A Top-Down Approach" (Kurose & Ross) |
| Linux | OverTheWire Bandit (wargame) + The Linux Command Line (William Shotts, free PDF) |
| OS | "Operating Systems: Three Easy Pieces" (free online textbook) |
| Pre-security path | TryHackMe — Pre-Security path |
| Practical Linux + networking | TryHackMe — Complete Beginner path |

I do **not** consume all of these end-to-end. I consume them on demand: whenever I'm writing a note and hit a gap, I open the relevant chapter, learn just enough to write the note, then come back to where I was.

## Gate to leave this module

The "Gate 1 — I own the basics" checklist in [[../01-Roadmap/Career-Roadmap-2026|the roadmap]]. When all items are ticked, I move primary attention to module 03 — but foundations are a place I keep coming back to.
