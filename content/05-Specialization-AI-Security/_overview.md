---
title: 05 — AI-Security Specialization
module: ai-security
status: planned
created: 2026-04-30
tags: [module, ai-security, specialization]
---

# Module 05 — AI-Security Specialization

This is the moat. Most cybersecurity entrants have a CS/networking background and have to learn ML from scratch. I have ML; I'm learning security. The intersection is rare and high-leverage.

## Sub-tracks

### Adversarial Machine Learning
- Evasion attacks (FGSM, PGD, C&W) on classifiers
- Poisoning attacks on training data
- Model extraction / membership inference
- Defenses — adversarial training, certified robustness, detection
- Tooling — CleverHans, ART (Adversarial Robustness Toolbox), Foolbox

### LLM Security
- OWASP LLM Top 10 (write the whole series here)
- Prompt injection — direct, indirect, multi-turn
- Jailbreak techniques and detection
- LLM red-teaming methodology
- Tooling — Garak, PromptFoo, Promptfoo, custom evals

### ML for Security
- Anomaly detection on network traffic / logs
- Malware classification — static features, dynamic features
- Phishing/URL classifiers
- Why ML detection often fails in production (adversarial drift, ground-truth scarcity, alert fatigue)

### Securing AI Systems (MLOps security)
- Supply-chain risks for ML — pickle, ONNX, model registries
- Securing training pipelines — data integrity, lineage
- Secrets management for ML
- Inference-time risks — DoS via expensive prompts, leakage via long contexts
- Frameworks — NIST AI RMF, MITRE ATLAS, OWASP ML Top 10

## Original projects (pick one, then a second)

| Project | Why |
|---------|-----|
| LLM jailbreak classifier | Hot topic, easy to demo, public datasets exist |
| Adversarial evasion vs an open-source malware detector | Combines my ML strength with security |
| Network anomaly detection on CICIDS2017 / similar | Resume-friendly, replicable, paper-cite-able |
| Federated learning for privacy-preserving log analytics | Niche, research-flavored, sets up Master-by-Research |

Each project ships as: GitHub repo + writeup in [[../06-Portfolio/_overview|Portfolio]] + thread/post linked from the trupples site.

## Resources to track
- AISec workshop proceedings (ACM CCS co-located)
- OWASP AI Security & Privacy Guide
- MITRE ATLAS framework
- Nicholas Carlini's blog & papers
- *Rethinking Trust* — book on trust in ML systems (read when published)

## Status
Planned. Starts being touched around Gate 2 (~9–12 months in). Active focus from Gate 3 onward.
