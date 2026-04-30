# CYBERGYM_PULL.ps1
# Pulls latest GitHub state into BOTH the Ampara working copy and the Drive vault.
# Use this when GitHub has been updated from another machine, OR when you want
# to be sure both local copies are at the same commit before starting work.

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"
$DRIVE  = "G:\My Drive\Third Brain\CyberGym"

Write-Host "`n=== CyberGym PULL (GitHub -> Ampara + Drive) ===" -ForegroundColor Cyan

if (Test-Path "$AMPARA\.git") {
    Set-Location $AMPARA
    git fetch origin v4 2>&1 | Out-Null
    git reset --hard origin/v4 2>&1 | Out-Null
    Write-Host "  Ampara synced to origin/v4." -ForegroundColor Green
} else {
    Write-Host "  Ampara is not a git repo. Run CYBERGYM_INIT.ps1 first." -ForegroundColor Red
}

if (Test-Path "$DRIVE\.git") {
    Set-Location $DRIVE
    git fetch origin v4 2>&1 | Out-Null
    git reset --hard origin/v4 2>&1 | Out-Null
    Write-Host "  Drive vault synced to origin/v4." -ForegroundColor Green
} else {
    Write-Host "  Drive vault not initialised. Skipping." -ForegroundColor Yellow
}

Write-Host "`nDone.`n" -ForegroundColor Cyan
