---
title: Networking — the big picture
module: 02-Foundations
status: seedling
created: 2026-04-30
updated: 2026-04-30
tags: [networking, foundations]
---

# Networking — the big picture

## TL;DR
*To be filled in: a one-paragraph plain-language explanation of how two computers anywhere in the world talk to each other.*

## Why this matters
Almost every cyberattack crosses a network at some point. If I can't sketch the path of a packet from my laptop to a server, on a whiteboard, with no notes, I'm not ready to reason about network attacks. This is the entry point to layers 1–7 of the OSI stack and everything in module 02-Foundations.

## Concept

### Core idea
*To fill in: layered protocol model, encapsulation, "every layer adds a header".*

### How it actually works
*To fill in. Use a packet-capture in Wireshark of opening a website as the running example.*

### Where it shows up in real systems
*To fill in: home Wi-Fi → ISP → backbone → datacenter → server → response back.*

## Hands-on
*Wireshark capture of `curl https://example.com` — annotated screenshot.*
*nmap scan of my own home network — what I see and why.*

## Common mistakes / misconceptions
- "OSI is just theory" — partially true; the model is dated, but the layered thinking is exactly how attacks are categorised.
- Confusing IP and MAC addresses, or layer 2 and layer 3 attacks.

## Cert relevance
- Network+ — every domain
- Security+ — Domain 3 (Implementation), Domain 4 (Operations)
- CySA+ — log analysis depends on understanding what each layer logs

## Connections
- See also: [[OSI-and-TCPIP|OSI vs TCP/IP]], [[IP-Routing|IP and routing]], [[TCP-UDP|TCP and UDP]], [[DNS|DNS]], [[HTTP-HTTPS|HTTP and HTTPS]]
- Builds toward: [[../03-Cybersecurity-Core/Network-Attacks|Network attacks]] *(to write)*

## Sources
- *Add as I read.*

## Open questions
- *Add as I learn.*

---

> **This is a seedling note.** It exists so the structure is in place. I will fill in the body as I work through the foundations track. The status field at the top (`seedling | growing | evergreen`) tracks how mature the note is.
