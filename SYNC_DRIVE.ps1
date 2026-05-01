# SYNC_DRIVE.ps1  —  one-liner to mirror Ampara -> G:\ Drive vault.
# Run this anytime you want Obsidian on G:\ to reflect the latest Ampara state.
# (You don't have to run this if you only browse via the live site.)

$AMPARA = "C:\Users\Ashraful\Documents\Claude\Projects\Ampara"
$DRIVE  = "G:\My Drive\Third Brain\CyberGym"

if (-not (Test-Path $DRIVE)) {
    Write-Host "  Drive path not found: $DRIVE" -ForegroundColor Red
    exit 1
}

Write-Host "`nMirroring Ampara -> Drive..." -ForegroundColor Yellow
robocopy $AMPARA $DRIVE /MIR `
    /XD _local node_modules .quartz-cache public .obsidian _backup_pre_migration `
    /XF *.tmp `
    /R:2 /W:2 /NFL /NDL /NJH /NJS | Out-Null
Write-Host "  Drive vault refreshed.`n" -ForegroundColor Green
