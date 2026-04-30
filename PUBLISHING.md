# Publishing — Obsidian → GitHub → Quartz → Trupples VPS

This guide turns the vault into a public website on the trupples VPS. End state:

- I edit notes in Obsidian on my laptop.
- I `git push` to GitHub.
- A GitHub Action (or a webhook on the VPS) builds the Quartz static site and deploys it to the VPS.
- The site is reachable at `https://notes.trupples.<tld>` (or whatever subdomain I pick) with full-text search built in.
- The repo is the source of truth; the VPS is just a publish target.

> Confirm exact commands against the [Quartz docs](https://quartz.jzhao.xyz) when you set this up — the project moves fast.

---

## Phase 1 — Make the vault a Git repo

```bash
cd /path/to/Ampara
git init
git add .
git commit -m "Initial vault: structure + roadmap + foundations"
```

Create a new repo on GitHub (private at first if it feels safer; public later when there's content I'm proud of). Then:

```bash
git remote add origin git@github.com:<github-username>/ampara.git
git branch -M main
git push -u origin main
```

## Phase 2 — Open the vault in Obsidian

1. Install [Obsidian](https://obsidian.md) (free).
2. Open the `Ampara` folder as a vault.
3. Recommended core plugins to enable: Backlinks, Outgoing Links, Tag Pane, Templates (point at `99-Templates/`), Quick Switcher, Daily Notes (optional), Graph View.
4. Recommended community plugins (later, once I'm comfortable):
   - **Dataview** — query notes like a database (e.g., "show all certs with status `studying`").
   - **Excalidraw** — diagrams that live in the vault.
   - **Templater** — smarter templating for the lesson template.
   - **Git** — commit/push directly from Obsidian.

## Phase 3 — Set up Quartz (locally first)

Quartz is a Node project. Install it as a separate folder, point it at this vault as a content source:

```bash
# in a separate working directory, NOT inside the Ampara repo
git clone https://github.com/jackyzha0/quartz.git ampara-quartz
cd ampara-quartz
npm install
npx quartz create
```

When asked, point `--directory` (or the prompt) at the path to `Ampara/`. Run locally:

```bash
npx quartz build --serve
```

Open `http://localhost:8080`. Confirm full-text search works, dark mode toggles, internal `[[wikilinks]]` resolve, and the graph view renders.

Configure look/feel in `quartz.config.ts`:
- `pageTitle` — "Ampara — trupples notes" (or whatever)
- `analytics` — Plausible or GoatCounter (privacy-friendly, self-hostable)
- `baseUrl` — eventually `notes.trupples.<tld>`
- Theme — pick the colour palette and fonts that match the trupples brand.

## Phase 4 — Choose a deploy strategy for the VPS

Two clean patterns, pick one:

### Pattern A — GitHub Actions builds, VPS serves static files (recommended)
- A GitHub Action runs `npx quartz build` on each push to `main`.
- The action `rsync`s the resulting `public/` directory to a folder on the VPS over SSH.
- Nginx on the VPS serves that folder.
- Pros: VPS doesn't need Node installed; build environment is reproducible; small attack surface on the VPS.
- Cons: needs an SSH deploy key configured as a GitHub secret.

### Pattern B — VPS pulls and builds itself
- Cron job or `git pull` webhook on the VPS pulls the repo, runs `npx quartz build`, restarts nginx (or reload).
- Pros: simpler ops loop, no GitHub Actions needed.
- Cons: VPS now needs Node + build deps; longer deploys; more attack surface.

**Recommendation:** Pattern A. GitHub Actions does the heavy lifting; the VPS is just a static file server. That's also the more secure pattern for a security-themed site (irony otherwise).

## Phase 5 — Nginx config (sketch)

```nginx
server {
    listen 80;
    listen [::]:80;
    server_name notes.trupples.<tld>;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name notes.trupples.<tld>;

    # Let's Encrypt-managed cert paths
    ssl_certificate     /etc/letsencrypt/live/notes.trupples.<tld>/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/notes.trupples.<tld>/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;

    root /var/www/ampara;
    index index.html;

    location / {
        try_files $uri $uri/ $uri.html =404;
    }

    # Cache static assets aggressively, HTML never
    location ~* \.(js|css|png|jpg|jpeg|svg|woff2)$ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
    location ~* \.html$ {
        expires -1;
        add_header Cache-Control "no-store";
    }
}
```

Set the DNS A/AAAA record for `notes.trupples.<tld>` to the VPS, then issue a Let's Encrypt cert with `certbot --nginx -d notes.trupples.<tld>`.

## Phase 6 — Wire up the GitHub Action

`/.github/workflows/deploy.yml` (template — adjust paths and secrets):

```yaml
name: Build & Deploy Ampara
on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with: { fetch-depth: 0 }

      - uses: actions/setup-node@v4
        with: { node-version: 20 }

      - name: Clone Quartz
        run: |
          git clone --depth=1 https://github.com/jackyzha0/quartz.git quartz
          cp -r ./* quartz/content/ 2>/dev/null || true
          # Adjust the line above to match Quartz v4's expected content path.

      - name: Install Quartz deps
        working-directory: quartz
        run: npm ci || npm install

      - name: Build site
        working-directory: quartz
        run: npx quartz build

      - name: Deploy via rsync over SSH
        uses: easingthemes/ssh-deploy@main
        env:
          SSH_PRIVATE_KEY: ${{ secrets.VPS_SSH_KEY }}
          ARGS: "-rltvz --delete"
          SOURCE: "quartz/public/"
          REMOTE_HOST: ${{ secrets.VPS_HOST }}
          REMOTE_USER: ${{ secrets.VPS_USER }}
          TARGET: "/var/www/ampara"
```

Required GitHub secrets:
- `VPS_SSH_KEY` — private key whose public half is in the deploy user's `authorized_keys`
- `VPS_HOST` — `vps.trupples.<tld>` or IP
- `VPS_USER` — a deploy-only user with write access to `/var/www/ampara` and nothing else

## Phase 7 — Optional: AI search on the public site

Quartz already has full-text search built in (Lunr-based). For AI-style Q&A on the public site:

1. **Phase 1 (now):** Use Claude in Cowork against the local vault. No public infra needed.
2. **Phase 2 (later, if I want it public):** Add a small chat widget on the site that hits an LLM API with retrieval over the vault content. Pattern: pre-compute embeddings on each build (in the GitHub Action), serve them from a tiny endpoint on the VPS, answer queries with retrieval-augmented generation. *This itself is a great portfolio project — building an AI search tool for my own security knowledge base is on-brand for an AI-security candidate.*

## Phase 8 — Ongoing hygiene

- **Don't commit secrets.** `.gitignore` excludes `.env`, `secrets/`, and `*.key` already. Audit before each push.
- **Mark drafts.** Use `_draft_` prefix on filenames (already in `.gitignore`) for notes I don't want public yet.
- **Backup.** GitHub is one copy; the VPS is another. A monthly clone of the repo onto a personal external drive is a third.
- **Indexing.** Add `<meta name="robots" content="noindex">` to any draft / private-leaning pages until they're polished, via Quartz frontmatter (`draft: true`).

---

## Status checklist

- [ ] Init git in `Ampara/`
- [ ] Create GitHub repo
- [ ] Open vault in Obsidian
- [ ] Set up Quartz locally, confirm build works
- [ ] Pick deploy pattern (A or B)
- [ ] DNS + Nginx + Let's Encrypt on VPS
- [ ] GitHub Action working end-to-end
- [ ] First public post live
