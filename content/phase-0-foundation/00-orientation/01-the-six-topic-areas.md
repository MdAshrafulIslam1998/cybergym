---
title: "0.0.2 The 6 topic areas"
description: "The six lenses CyberGym uses to teach cybersecurity: machine, OS, networking, security, cloud, and AI/ML security."
phase: 0
chapter: "0.0 Start Here"
lesson: "0.0.2"
status: seedling
tags:
  - phase-0
  - orientation
  - map
---

# 0.0.2 The 6 topic areas

> **In one line:** CyberGym teaches cybersecurity through six repeating lenses: machine, OS, networking, security, cloud, and AI/ML security.

---

Cybersecurity is not one subject. It is more like standing around a machine with six different torches. Each torch lights up a different truth.

One person sees the hardware. One sees the operating system. One sees the network. One sees the security weakness. One sees the cloud account. One sees the AI model quietly making decisions in the corner.

Same system. Six views. That is the whole trick.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer-motherboard.jpg?width=1100" alt="A desktop computer motherboard." />
  <figcaption>A real machine is not abstract. It is silicon, copper, firmware, ports, heat, and stored secrets. Image: Wikimedia Commons, Computer-motherboard.jpg.</figcaption>
</figure>

---

## A story — the outage nobody could explain

Imagine a company wakes up to a broken app.

Customers cannot log in. The dashboard says "service unavailable." Slack starts glowing. Everyone has a theory.

The hardware person checks the server: maybe the disk is full, the RAM is exhausted, or the CPU is melting under load.

The operating-system person checks processes, services, permissions, logs, scheduled tasks, and whether the app is even running.

The networking person checks DNS, firewalls, TLS certificates, ports, routes, and whether packets are reaching the server.

The security person asks a different question: did someone abuse a weakness? Was a password stolen? Did a malicious request crash the app? Is this a denial-of-service attack?

The cloud person opens AWS or Azure and checks load balancers, IAM roles, security groups, S3 buckets, managed databases, costs, regions, and service health.

The AI security person asks the newest question: is the app using an LLM or ML model somewhere? Did a prompt injection leak data? Did a model API get abused? Did an agent do something it should not have been allowed to do?

Nobody is wrong. They are all looking at a different layer of the same machine.

That is why CyberGym does not begin with "memorise these acronyms." It begins by teaching you how to look.

## What's actually going on

CyberGym uses a **spiral curriculum**. That means we touch the main areas early, then come back to each one later with more depth.

The six topic areas are the six lenses you will keep reusing:

| Area | Plain-English meaning | What it teaches you to ask |
|---|---|---|
| **Machine** | The physical computer: CPU, RAM, storage, firmware, GPU, power, I/O | What is this system made of, and where can physical reality betray it? |
| **Operating System** | The manager between hardware and apps: Windows, Linux, macOS, processes, files, users, permissions | What is running, who is allowed to do what, and where are the logs? |
| **Networking** | How machines talk: IP, ports, DNS, HTTP, TLS, Wi-Fi, routing | Where did this traffic come from, where is it going, and can we trust the path? |
| **Security Foundations** | The defender's vocabulary: risk, CIA triad, auth, crypto, malware, web attacks, MITRE, OWASP | What can go wrong, how would an attacker abuse it, and how do we reduce damage? |
| **Cloud** | Rented infrastructure and managed services: AWS, Azure, GCP, IAM, S3, EC2, VPCs | Who owns which responsibility, and did we configure the cloud boundary correctly? |
| **AI/ML Security** | The security of models, prompts, agents, training data, inference APIs, and AI supply chains | What new attack surface appears when software starts making decisions from model output? |

There is also a **bridge area** in Phase 0: **Programming Literacy**.

It is not treated as a final niche by itself, because the goal here is not to become a software engineer. But you need enough code literacy to read Python, Bash, PowerShell, JavaScript, SQL, YAML, JSON, and a little C without panic.

Security work is full of code fragments, logs, config files, scripts, payloads, and API responses. If those look like magic, every investigation feels haunted. If you can read them slowly, they become evidence.

So the Phase 0 shape is really:

```text
Machine -> OS -> Networking -> Programming Literacy -> Security -> Cloud -> AI/ML Security
```

Programming Literacy is the bridge that lets the other six areas talk to each other.

## Why a hacker cares

Attackers do not respect curriculum boundaries. They chain things.

A real attack might start with a phishing email, run PowerShell, download malware over HTTPS, persist through a scheduled task, steal browser cookies from disk, call a cloud API with an overpowered IAM token, then use an internal LLM tool to search company documents.

That one chain crosses almost every area:

- **Machine** — where secrets sit in RAM and on disk
- **OS** — where processes, services, and permissions live
- **Networking** — how the payload and stolen data move
- **Programming Literacy** — what the script actually does
- **Security Foundations** — why the attack works and how to detect it
- **Cloud** — where modern company data and identity live
- **AI/ML Security** — where new tools can leak or amplify the damage

This is why CyberGym does not teach "networking for twelve weeks, then security later." A defender needs a rough map of the whole territory early. The map gets sharper every time we return.

## The six lenses

Phase 0 is not trying to make you an expert. It is trying to make you **dangerously understandable**: able to follow a conversation, ask the next good question, and know where to dig.

### 1. Machine

You learn what a computer is before you try to secure one. CPU, RAM, storage, motherboard, GPU, BIOS/UEFI, boot sequence, physical access.

Security payoff: buffer overflows, memory forensics, disk encryption, firmware attacks, side channels, hardware implants, and why "pull the SSD" is still a threat.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Computer-motherboard.jpg?width=900" alt="A computer motherboard with CPU socket, memory slots, expansion slots, chipset, and connectors." />
  <figcaption><strong>Machine lens:</strong> the box is not a metaphor. Attackers can abuse RAM, disks, firmware, USB ports, and physical access.</figcaption>
</figure>

### 2. Operating System

You learn how Windows and Linux manage running programs, users, permissions, files, services, logs, and terminals.

Security payoff: malware persistence, privilege escalation, suspicious processes, log investigation, endpoint defence, and why admin/root access is such a big deal.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Operating_system_architecture.svg?width=900" alt="Operating system architecture diagram showing applications above the operating system and hardware beneath it." />
  <figcaption><strong>OS lens:</strong> the operating system is the manager between messy human software and strict physical hardware.</figcaption>
</figure>

### 3. Networking

You learn how computers find each other and move data: IP addresses, subnets, ports, DNS, TCP, UDP, HTTP, HTTPS, TLS, firewalls, VPNs.

Security payoff: phishing infrastructure, command-and-control traffic, packet captures, firewall rules, web attacks, TLS mistakes, and cloud network boundaries.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/OSI_Model_v1.svg?width=650" alt="OSI model diagram with seven layers from physical to application." />
  <figcaption><strong>Network lens:</strong> packets are not magic. They climb and descend layers, and each layer gives defenders a different place to inspect.</figcaption>
</figure>

### 4. Security Foundations

You learn the language of the field: CIA triad, risk, vulnerabilities, exploits, authentication, authorization, hashing, encryption, malware, web attacks, MITRE ATT&CK, OWASP Top 10.

Security payoff: this is the shared vocabulary. Without it, every job ad, incident report, cert question, and security tool reads like a foreign language.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/CIAJMK1209-en.svg?width=700" alt="CIA triad diagram showing confidentiality, integrity, and availability." />
  <figcaption><strong>Security lens:</strong> almost every defensive conversation eventually comes back to confidentiality, integrity, and availability.</figcaption>
</figure>

### 5. Cloud

You learn what the cloud really is: someone else's computers, wrapped in APIs, billing, identity, and managed services.

Security payoff: IAM mistakes, public S3 buckets, exposed keys, insecure security groups, logging gaps, shared responsibility, and the cloud patterns companies actually hire for.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Cloud_computing.svg?width=900" alt="Cloud computing diagram showing clients and services connected through cloud infrastructure." />
  <figcaption><strong>Cloud lens:</strong> cloud security is mostly identity, configuration, logging, network boundaries, and knowing who is responsible for what.</figcaption>
</figure>

### 6. AI/ML Security

You learn how models enter the security picture: training vs inference, LLMs, RAG, agents, prompt injection, model extraction, data poisoning, OWASP LLM Top 10.

Security payoff: AI systems are becoming part of normal business infrastructure. A defender who understands both cloud and AI attack surfaces has a sharper story than someone who only memorised old categories.

<figure>
  <img src="https://commons.wikimedia.org/wiki/Special:FilePath/Artificial_neural_network.svg?width=800" alt="Artificial neural network diagram with input, hidden, and output nodes." />
  <figcaption><strong>AI/ML lens:</strong> models are software components now. They have inputs, outputs, hidden assumptions, and attack surfaces.</figcaption>
</figure>

## The Feynman test

Here is the test for every CyberGym note:

> If you cannot explain the concept to a curious beginner without hiding behind jargon, you do not understand it well enough yet.

That does not mean the lesson should be shallow. It means the ladder should have small rungs.

For each topic, the pattern is:

1. Start with the ordinary thing: a desk, a road, a locked room, a receptionist, a filing cabinet.
2. Map the ordinary thing to the technical thing.
3. Name the real term.
4. Show why an attacker cares.
5. Show what a defender would inspect.

That is the tone we want: easy to enter, deep enough to matter.

## In one sketch

```text
                         CyberGym
                            |
        ------------------------------------------------
        |        |          |          |        |       |
     Machine     OS     Networking  Security  Cloud   AI/ML
        |        |          |          |        |       |
        ------------------------------------------------
                            |
                  Programming Literacy
                  (the bridge language)
```

Every phase walks around the same map again. Phase 0 gives the street names. Phase 1 adds detail. Phase 2 makes cloud security practical. Phase 3 takes the AI/ML security lane seriously.

## References and image credits

- [Computer-motherboard.jpg](https://commons.wikimedia.org/wiki/File:Computer-motherboard.jpg) — Marcin Wieclaw, CC BY-SA 4.0.
- [Operating_system_architecture.svg](https://commons.wikimedia.org/wiki/File:Operating_system_architecture.svg) — Skjackey tse, public domain.
- [OSI_Model_v1.svg](https://commons.wikimedia.org/wiki/File:OSI_Model_v1.svg) — Offnfopt, public domain / CC0.
- [CIAJMK1209-en.svg](https://commons.wikimedia.org/wiki/File:CIAJMK1209-en.svg) — Michel Bakni, CC BY-SA 4.0.
- [Cloud_computing.svg](https://commons.wikimedia.org/wiki/File:Cloud_computing.svg) — Sam Johnston, CC BY-SA 3.0.
- [Artificial_neural_network.svg](https://commons.wikimedia.org/wiki/File:Artificial_neural_network.svg) — Cburnett, GFDL / CC BY-SA 3.0.

## Memory peg

Cybersecurity is not one subject. It is six lenses pointed at the same machine. Learn the lenses early; deepen them for the rest of your career.
