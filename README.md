# CyberGym

> A public cybersecurity knowledge base — built as a personal curriculum, not a study log.

CyberGym is a Quartz v4 static site that publishes a lifelong cybersecurity curriculum, structured as four phases (Foundation → Security+ → AWS Security Specialty → GIAC GAIA) across six topic areas (Machine, OS, Networking, Security, Cloud, AI/ML Security).

The content is written at street-smart adult, non-CSE-background level. Analogies first, technical detail second. Every note is portfolio-quality and ties concepts back to "why this matters for security, cloud, or AI."

## Live site

https://mdashrafulislam1998.github.io/cybergym/

## Stack

- Editor: Obsidian (local Markdown)
- Versioning: Git (this repo)
- Publisher: Quartz v4
- Hosting: GitHub Pages (auto-deploy on push to `v4`)

## Local layout

```
content/                        ← published markdown
quartz/                         ← Quartz framework
quartz.config.ts                ← site config
CYBERGYM_PUSH.ps1               ← publish: commit + push + mirror Drive
CYBERGYM_PULL.ps1               ← pull latest from GitHub into Ampara
SYNC_DRIVE.ps1                  ← mirror Ampara folder onto Drive vault
SYNC_DRIVE.ahk                  ← AutoHotkey hotkey (Ctrl+Alt+G) to run SYNC_DRIVE
```

See [PUBLISHING.md](PUBLISHING.md) for the full publish workflow.

## Status

- **Started:** 2026-04-30
- **Current phase:** 0 (Foundation)
- **Currently writing:** chapters 0.0 and 0.1
