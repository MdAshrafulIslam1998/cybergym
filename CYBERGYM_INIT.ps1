# CYBERGYM_INIT.ps1
# ONE-TIME setup: makes the Ampara folder a full clone of the cybergym repo,
# preserving Cowork-only files in Ampara\_local\.
#
# Prereq: $env:GITHUB_PAT must be set in the current PowerShell session.
#   $env:GITHUB_PAT = "ghp_xxx..."

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"
$REPO   = "https://x-access-token:$($env:GITHUB_PAT)@github.com/MdAshrafulIslam1998/cybergym.git"
$BACKUP = "$env:USERPROFILE\Documents\Claude\Projects\Ampara_backup_pre_migration"

if (-not $env:GITHUB_PAT) {
    Write-Host "ERROR: `$env:GITHUB_PAT is not set. Run:" -ForegroundColor Red
    Write-Host '  $env:GITHUB_PAT = "ghp_..."' -ForegroundColor Yellow
    exit 1
}

Write-Host "`n=== CyberGym Ampara INIT ===" -ForegroundColor Cyan

# 1. Backup current Ampara
if (Test-Path "$AMPARA\.git") {
    Write-Host "`n  Ampara already has a .git folder. Aborting to avoid overwrite." -ForegroundColor Yellow
    Write-Host "  If you really want to redo init, move/delete $AMPARA\.git first." -ForegroundColor Yellow
    exit 0
}

Write-Host "`n1. Backing up current Ampara..." -ForegroundColor Yellow
if (Test-Path $BACKUP) { Remove-Item -Recurse -Force $BACKUP }
Copy-Item -Recurse -Path $AMPARA -Destination $BACKUP
Write-Host "   Backup at $BACKUP" -ForegroundColor Green

# 2. Stash _local files
$LOCAL_TEMP = "$env:TEMP\ampara_local_files"
if (Test-Path $LOCAL_TEMP) { Remove-Item -Recurse -Force $LOCAL_TEMP }
New-Item -ItemType Directory -Path $LOCAL_TEMP | Out-Null
if (Test-Path "$AMPARA\_local") {
    Copy-Item -Recurse -Path "$AMPARA\_local\*" -Destination $LOCAL_TEMP
    Write-Host "2. _local files preserved." -ForegroundColor Green
}

# 3. Empty Ampara (keep the directory itself)
Write-Host "`n3. Clearing Ampara..." -ForegroundColor Yellow
Get-ChildItem -Path $AMPARA -Force | Remove-Item -Recurse -Force

# 4. Clone repo into Ampara
Write-Host "`n4. Cloning v4 branch into Ampara..." -ForegroundColor Yellow
Set-Location (Split-Path $AMPARA -Parent)
git clone -b v4 $REPO (Split-Path $AMPARA -Leaf)
if ($LASTEXITCODE -ne 0) {
    Write-Host "   Clone failed!" -ForegroundColor Red
    exit 1
}
Write-Host "   Clone successful." -ForegroundColor Green

# 5. Restore _local files
Write-Host "`n5. Restoring _local files..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "$AMPARA\_local" -Force | Out-Null
if (Test-Path "$LOCAL_TEMP\*") {
    Copy-Item -Recurse -Path "$LOCAL_TEMP\*" -Destination "$AMPARA\_local\"
}
Write-Host "   _local restored." -ForegroundColor Green

# 6. Reset remote to remove PAT from URL (use credential helper instead)
Set-Location $AMPARA
git remote set-url origin "https://github.com/MdAshrafulIslam1998/cybergym.git"
Write-Host "`n6. Remote URL reset (no PAT embedded). Use git credential manager for future pushes." -ForegroundColor Green

Write-Host "`nDONE. Daily flow:" -ForegroundColor Cyan
Write-Host "  Edit in $AMPARA, then run .\CYBERGYM_PUSH.ps1 'your message'" -ForegroundColor Gray
Write-Host "  Backup of pre-init Ampara is at $BACKUP" -ForegroundColor Gray
