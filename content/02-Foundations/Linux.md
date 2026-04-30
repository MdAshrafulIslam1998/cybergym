---
title: Linux command line — daily-driver level
module: 02-Foundations
status: seedling
created: 2026-04-30
updated: 2026-04-30
tags: [linux, foundations]
---

# Linux command line — daily-driver level

## TL;DR
*To be filled in: enough Linux fluency that I'm productive without a GUI, with reflexive knowledge of files/permissions/processes/networking.*

## Why this matters
Most security tooling is Linux-first. Most servers are Linux. Reading log files, writing detection rules, exploiting boxes, running labs — all happens on a terminal. The bar isn't "I know `ls`," it's "I'm faster on a Linux shell than in a GUI for routine tasks."

## Concept

### Core areas to master
1. **Filesystem layout** — `/etc`, `/var`, `/usr`, `/proc`, `/sys`, `~`. Why each exists.
2. **File operations** — `ls`, `cp`, `mv`, `rm`, `find`, `xargs`, `chmod`, `chown`, hard vs symbolic links.
3. **Text processing** — `grep`, `sed`, `awk`, `cut`, `sort`, `uniq`, `tr`, `wc`, `tee`.
4. **Process management** — `ps`, `top`, `htop`, `kill`, `nice`, signals, `jobs`, `bg/fg`, `nohup`, `tmux/screen`.
5. **Permissions** — Unix permission bits, special bits (suid/sgid/sticky), ACLs, capabilities, sudo.
6. **Networking** — `ip`, `ss`, `dig`, `nslookup`, `curl`, `wget`, `nc`, `tcpdump`, `nmap`, `traceroute`.
7. **Package management** — apt, yum/dnf, pacman, snap, flatpak (per distro).
8. **Systemd basics** — units, services, journalctl, timers.
9. **Shell scripting** — variables, conditionals, loops, functions, traps, arrays.
10. **Pipes, redirection, subshells** — `|`, `>`, `>>`, `<`, `2>&1`, `$(...)`.

## Hands-on
- Install a Linux distro as a daily driver (or a comfortable VM).
- [OverTheWire Bandit](https://overthewire.org/wargames/bandit/) — work through all levels. *Each level becomes one short note here.*
- Daily: do at least one task today on Linux that I'd normally do in a GUI.

## Common mistakes / misconceptions
- Confusing `chmod 777` for "the fix" instead of "the bandage that becomes a finding in an audit."
- Not understanding the difference between `>` and `>>`.
- Forgetting `chmod +x` on a script and blaming the script.

## Cert relevance
- Linux+ — entire exam
- Security+ — Domain 4 (Operations) implicitly assumes Linux fluency
- CySA+ — log analysis is mostly Linux

## Connections
- See also: [[Bash-Scripting]], [[Linux-Networking-Tools]], [[Linux-Process-Tools]]
- Builds toward: [[../03-Cybersecurity-Core/Linux-Hardening|Linux hardening]] *(to write)*, [[../04-Hands-On/_overview|Hands-on labs]]

## Sources
- *The Linux Command Line* — William Shotts (free PDF)
- *How Linux Works* — Brian Ward
- *Linux Bible* — Christopher Negus
- Add as I read.

## Open questions
- *Add as I learn.*
