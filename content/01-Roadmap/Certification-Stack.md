---
title: Certification Stack
status: living
created: 2026-04-30
updated: 2026-04-30
tags: [roadmap, certifications]
---

# Certification Stack

> Ordered, opinionated, PR-aware. Cert names and providers are stable as of 2026-04. Always confirm exam codes, prices, and current versions on the **official provider page** before booking — vendors revise exams every few years.

## Strategy

I'm not chasing the cheapest CV; I'm stacking certs that **(a) prove progressively deeper skill**, **(b) are recognised by Australian employers and ACS for ANZSCO 262112**, and **(c) form a coherent narrative: data scientist → security generalist → AI-security specialist**. Order matters more than speed. I will not skip foundations.

Three tiers:

1. **Tier 1 — Foundations (free or cheap, 0–9 months).** Prove I'm not faking the basics.
2. **Tier 2 — Industry baseline (6–14 months).** The certs job posts actually ask for.
3. **Tier 3 — Specialization (12–24 months).** What makes me hireable into AI-security.

I treat Tier 1+2 as table-stakes, Tier 3 as the differentiator. Hands-on (TryHackMe / HackTheBox / Hack The Box Academy) runs continuously alongside all tiers — labs > theory.

---

## Tier 1 — Foundations (free / cheap, 0–9 months)

### ☐ ISC2 Certified in Cybersecurity (CC)
- **Why first:** Free voucher via ISC2 "One Million Certified in Cybersecurity" program (verify it's still active). Vendor-neutral, recognised globally, gentle on a true beginner.
- **What it proves:** Vocabulary, the CIA triad, basic risk concepts, foundational security operations.
- **Provider:** [ISC2](https://www.isc2.org/Certifications/CC)
- **Notes folder:** [[07-Certifications/ISC2-CC/_overview|ISC2 CC]]

### ☐ CompTIA Network+ (or equivalent self-study)
- **Why second:** No security without networking. TCP/IP, DNS, routing, switching, subnetting must be reflexes, not Google-aways.
- **What it proves:** Network plumbing literacy.
- **Provider:** [CompTIA](https://www.comptia.org/certifications/network)
- **Cheap alternative:** Self-study Professor Messer's free Network+ course; sit the exam only if I want the paper credential. ACS recognises it but does not require it.
- **Notes folder:** [[07-Certifications/Network-Plus/_overview|Network+]]

### ☐ Linux fundamentals (LPI Linux Essentials *or* CompTIA Linux+)
- **Why:** Real security work happens on Linux. Daily-driver fluency, not tourist mode.
- **What it proves:** Filesystem, permissions, processes, package management, shell scripting.
- **Provider:** [LPI](https://www.lpi.org/our-certifications/linux-essentials-overview/) or [CompTIA](https://www.comptia.org/certifications/linux)
- **Cheap alternative:** OverTheWire Bandit + Linux Journey + everyday daily driver use.
- **Notes folder:** [[07-Certifications/Linux/_overview|Linux fundamentals]]

---

## Tier 2 — Industry baseline (6–14 months)

### ☐ CompTIA Security+
- **Why:** The single most-asked-for entry security cert in Australian job descriptions. Often a gating requirement for SOC analyst and government-aligned roles.
- **What it proves:** Threats, attacks, vulnerabilities, architecture, governance, incident response — the universal vocabulary.
- **Provider:** [CompTIA Security+](https://www.comptia.org/certifications/security)
- **Notes folder:** [[07-Certifications/Security-Plus/_overview|Security+]]
- **PR/ACS note:** Strengthens ANZSCO 262112 ICT Security Specialist case but does not by itself satisfy ACS skills assessment. Pair with degree + experience.

### ☐ CompTIA CySA+ *(blue-team route)* OR ☐ TCM Security PNPT *(red-team route)*
- **Branch point.** Pick based on whether I lean defender (CySA+) or attacker (PNPT).
- **CySA+:** SOC analyst toolkit — log analysis, threat hunting, SIEM. Pairs well with my data-science background (anomaly detection in logs is literally an ML problem).
- **PNPT:** Hands-on practical pentest exam, well-respected, much cheaper than OSCP, fully practical (no multiple choice). Strong portfolio piece.
- **My lean:** **CySA+ first** — defensive AI/ML detection is the cleaner crossover with my ML background and Sydney has more blue-team junior roles than red-team. PNPT optional after.

### ☐ Microsoft SC-200 *(Security Operations Analyst)*
- **Why:** Microsoft Sentinel + Defender stack dominates Australian enterprise. Government and big-corp SOCs run on it. SC-200 directly qualifies you to operate the toolset.
- **What it proves:** KQL, Sentinel rule writing, Defender for Endpoint/Cloud/Identity, incident response in MS stack.
- **Provider:** [Microsoft Learn — SC-200](https://learn.microsoft.com/en-us/credentials/certifications/security-operations-analyst/)
- **Pairs with:** CySA+ (vendor-neutral) → SC-200 (vendor-specific). One-two punch.

### ☐ One cloud security cert — AWS Security Specialty *or* Azure AZ-500
- **Why:** Cloud is where attacks happen now. Pick the cloud my target employers use.
- **My lean:** **AZ-500** if I'm going Microsoft-shop / government, **AWS Security Specialty** if I'm going startup / fintech. Likely AZ-500 first given SC-200 alignment.
- **Pre-req:** AZ-900 (Azure Fundamentals) → AZ-500, or SAA-C03 → SCS-C02.

---

## Tier 3 — Specialization (12–24 months) — AI-Security

This is the moat. Few candidates have all of [ML rigor + security fundamentals + AI-security specifics]. These programs are still maturing as of 2026 — re-check official sites before committing money.

### ☐ HackTheBox AI Red Team / AI security paths
- **Why:** Hands-on adversarial-ML and LLM red-teaming labs. Output: writeups for the [[06-Portfolio/_overview|portfolio]].
- **Format:** Subscription, self-paced.

### ☐ SANS — Machine Learning for Security Pros (SEC595) *or* Cyberdefense + AI track
- **Why:** Industry gold-standard, expensive, but the cert (GIAC) is heavyweight on a CV. Likely employer-sponsored after first role rather than self-paid.
- **Caveat:** Course names and codes change. Confirm current SANS catalog.

### ☐ OWASP Top 10 for LLM Applications — study + write a public series
- **Why:** No exam, but writing a public series mapping each OWASP LLM risk to a real attack/defense is the kind of artifact that gets retweeted by security folks and noticed by recruiters.

### ☐ Original research — pick **one** of:
- ML-based intrusion detection on network traffic (publishable)
- LLM jailbreak detection / classifier
- Adversarial evasion against an open-source malware classifier
- Federated learning for privacy-preserving security analytics

This is the "research master" output that completes the narrative for an employer or a Master-by-Research application.

---

## Things I will *not* chase

- **CISSP** — gold standard, but requires 5 years paid security experience. Not a fit until 2029+.
- **CEH** — declining reputation; brand-name only. PNPT or OSCP are stronger signals.
- **Vendor cert spam** — every cloud has 20 certs. One per cloud is enough until I'm specialized.

---

## Tracking

Status updated as I complete each cert. Each `☐` becomes `☑` with a date and a link to the post-mortem note in `07-Certifications/<cert>/`.

Connections: [[01-Roadmap/Career-Roadmap-2026|Career Roadmap]] · [[01-Roadmap/PR-Pathway|PR Pathway]] · [[07-Certifications/_overview|Certification notes]]
