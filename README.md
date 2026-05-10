# _thewozniakfile

> A public computer-science knowledge base — built as a personal curriculum, not a study log.
> *From transistors to transformers — computer science for life.*

`_thewozniakfile` is a Quartz v4 static site that publishes a lifelong CS curriculum, structured as five phases (Foundation → Software Engineering Core → Cloud · Distributed · Production → AI / ML Engineering → Practitioner · Research) across six topic areas (Machine, OS, Networking, Languages + Paradigms, Cloud + DevOps + Distributed, AI / ML Engineering).

Named after Steve Wozniak — the engineer who designed the Apple I single-handedly because he understood the whole stack from transistor to OS to elegant code.

The content is written at the level of a curious, smart adult who hasn't necessarily done a CS degree. Analogies first, technical detail second. Every note is portfolio-quality and ties concepts back to "why this matters for software engineering, cloud, or AI work."

## Live site

https://mdashrafulislam1998.github.io/_thewozniakfile/

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
CYBERGYM_PULL.ps1               ← pull latest from GitHub into the local vault
SYNC_DRIVE.ps1                  ← mirror local folder onto Drive vault
SYNC_DRIVE.ahk                  ← AutoHotkey hotkey to run SYNC_DRIVE
```

See [PUBLISHING.md](PUBLISHING.md) for the full publish workflow.

## Status

- **Started:** 2026-04-30 (as CyberGym)
- **Pivoted to `_thewozniakfile`:** 2026-05-10
- **Current phase:** 0 (Foundation)
- **Currently writing:** chapters 0.0 and 0.1
