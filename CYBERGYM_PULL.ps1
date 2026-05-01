# CYBERGYM_PULL.ps1  —  AFTER-DEPLOY SYNC
# Brings the local Ampara folder and the G:\ Drive vault into sync with whatever
# is currently on the GitHub `v4` branch.
#
# Use this whenever a publish has happened (Cowork pushed, or in future a mobile
# edit pushed) and you want your local clone + Obsidian vault to reflect it.
#
# Steps:
#   1. git fetch + reset --hard origin/v4   (Ampara catches up to GitHub)
#   2. robocopy Ampara -> G:\ Drive         (Drive vault catches up to Ampara)
#
# Usage:
#   .\CYBERGYM_PULL.ps1

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"
$DRIVE  = "G:\My Drive\Third Brain\CyberGym"

Write-Host "`n=== AFTER-DEPLOY SYNC (GitHub -> Ampara -> Drive) ===" -ForegroundColor Cyan

if (-not (Test-Path "$AMPARA\.git")) {
    Write-Host "  Ampara is not a git repo. Run CYBERGYM_INIT.ps1 first." -ForegroundColor Red
    exit 1
}

# --- Step 1: GitHub -> Ampara ---
Set-Location $AMPARA
Write-Host "`n1. Pulling GitHub v4 -> Ampara..." -ForegroundColor Yellow
git fetch origin v4
git reset --hard origin/v4
if ($LASTEXITCODE -ne 0) {
    Write-Host "  Pull failed." -ForegroundColor Red
    exit 1
}
Write-Host "   Ampara now matches origin/v4." -ForegroundColor Green

# --- Step 2: Ampara -> G:\ Drive (mirror, no git) ---
if (Test-Path $DRIVE) {
    Write-Host "`n2. Mirroring Ampara -> Drive..." -ForegroundColor Yellow
    robocopy $AMPARA $DRIVE /MIR `
        /XD _local node_modules .quartz-cache public .obsidian _backup_pre_migration `
        /XF *.tmp `
        /R:2 /W:2 /NFL /NDL /NJH /NJS | Out-Null
    Write-Host "   Drive vault mirrored from Ampara." -ForegroundColor Green
} else {
    Write-Host "`n   Drive path not found - skipping Drive mirror." -ForegroundColor Yellow
}

Write-Host "`nLocal + Drive are now in sync with GitHub.`n" -ForegroundColor Cyan
