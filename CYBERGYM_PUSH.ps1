# CYBERGYM_PUSH.ps1
# Run from anywhere. Commits + pushes the Ampara working copy to GitHub,
# then auto-pulls the Google Drive vault so Obsidian sees the latest.
#
# Usage:
#   .\CYBERGYM_PUSH.ps1
#   .\CYBERGYM_PUSH.ps1 "your commit message here"

param(
    [string]$Message = "docs: update vault content"
)

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"
$DRIVE  = "G:\My Drive\Third Brain\CyberGym"

Write-Host "`n=== CyberGym PUSH (Ampara -> GitHub -> Drive) ===" -ForegroundColor Cyan

# 1. Commit + push from Ampara
Set-Location $AMPARA

$status = git status --short
if (-not $status) {
    Write-Host "  Nothing to commit in Ampara." -ForegroundColor Gray
} else {
    Write-Host "`nChanged files in Ampara:" -ForegroundColor Gray
    git status --short
    git add -A ":!_local"
    git commit -m $Message
    git push origin v4
    if ($LASTEXITCODE -ne 0) {
        Write-Host "`n  Push failed. Check auth / network." -ForegroundColor Red
        exit 1
    }
    Write-Host "  Ampara pushed to GitHub. Actions will deploy in ~2 min." -ForegroundColor Green
}

# 2. Pull the same commit into Drive vault
if (Test-Path $DRIVE) {
    Write-Host "`nSyncing Drive vault..." -ForegroundColor Yellow
    Set-Location $DRIVE
    git fetch origin v4 2>&1 | Out-Null
    git reset --hard origin/v4 2>&1 | Out-Null
    Write-Host "  Drive vault synced to origin/v4." -ForegroundColor Green
} else {
    Write-Host "`n  Drive path not found - skipping Drive sync." -ForegroundColor Yellow
}

Write-Host "`nDone. Live: https://mdashrafulislam1998.github.io/cybergym/`n" -ForegroundColor Cyan
