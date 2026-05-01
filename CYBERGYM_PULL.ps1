# CYBERGYM_PULL.ps1  —  EDIT PROCESS step 1
# Pull latest from GitHub into Ampara before editing.
# (Drive side is updated only via PUBLISH after edits are done.)
#
# Usage:
#   .\CYBERGYM_PULL.ps1

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"

Write-Host "`n=== EDIT PREP (GitHub -> Ampara) ===" -ForegroundColor Cyan

if (-not (Test-Path "$AMPARA\.git")) {
    Write-Host "  Ampara is not a git repo. Run CYBERGYM_INIT.ps1 first." -ForegroundColor Red
    exit 1
}

Set-Location $AMPARA
git fetch origin v4
git reset --hard origin/v4
if ($LASTEXITCODE -eq 0) {
    Write-Host "  Ampara synced to origin/v4. Ready to edit." -ForegroundColor Green
} else {
    Write-Host "  Pull failed." -ForegroundColor Red
    exit 1
}

Write-Host ""
