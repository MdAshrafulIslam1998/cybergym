# CYBERGYM_PUSH.ps1  —  PUBLISH PROCESS
# 1. Commit + push everything in Ampara to GitHub (triggers GitHub Pages deploy).
# 2. Mirror the Ampara folder onto the G:\ Drive vault so Obsidian sees the same files.
#
# Usage:
#   .\CYBERGYM_PUSH.ps1
#   .\CYBERGYM_PUSH.ps1 "your commit message"

param([string]$Message = "docs: update vault content")

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"
$DRIVE  = "G:\My Drive\Third Brain\CyberGym"

Write-Host "`n=== PUBLISH (Ampara -> GitHub -> Drive mirror) ===" -ForegroundColor Cyan

# --- Step 1: commit + push ---
Set-Location $AMPARA
$status = git status --short
if (-not $status) {
    Write-Host "  No changes to commit." -ForegroundColor Gray
} else {
    Write-Host "Changed files:" -ForegroundColor Gray
    git status --short
    git add -A ":!_local"
    git commit -m $Message
    git push origin v4
    if ($LASTEXITCODE -ne 0) {
        Write-Host "`n  Push failed. Check auth / network." -ForegroundColor Red
        exit 1
    }
    Write-Host "  Pushed to GitHub. Pages deploy in ~2 min." -ForegroundColor Green
}

# --- Step 2: mirror Ampara -> Drive (no git on Drive side) ---
if (Test-Path $DRIVE) {
    Write-Host "`nMirroring Ampara -> Drive..." -ForegroundColor Yellow
    robocopy $AMPARA $DRIVE /MIR `
        /XD _local node_modules .quartz-cache public .obsidian _backup_pre_migration `
        /XF *.tmp `
        /R:2 /W:2 /NFL /NDL /NJH /NJS | Out-Null
    Write-Host "  Drive vault mirrored from Ampara." -ForegroundColor Green
} else {
    Write-Host "`n  Drive path not found - skipping mirror." -ForegroundColor Yellow
}

Write-Host "`nLive: https://mdashrafulislam1998.github.io/cybergym/`n" -ForegroundColor Cyan
