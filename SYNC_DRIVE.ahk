; SYNC_DRIVE.ahk
; CyberGym manual Drive sync — hotkey: Ctrl + Alt + G
;
; Setup (one-time):
;   1. Install AutoHotkey v2 from https://www.autohotkey.com/
;   2. Double-click this file to start it (it lives in the system tray)
;   3. Optional: drop a shortcut into shell:startup so it auto-runs at login
;
; Use:
;   Press Ctrl + Alt + G anytime, anywhere → mirrors Ampara to G:\ Drive
;   You'll see a brief tray notification when it's done

#Requires AutoHotkey v2.0
#SingleInstance Force

PS1 := "C:\Users\Ashraful\Documents\Claude\Projects\Ampara\SYNC_DRIVE.ps1"

; Tray menu
A_TrayMenu.Delete()
A_TrayMenu.Add("Sync Drive now (Ctrl+Alt+G)", SyncNow)
A_TrayMenu.Add()
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Sync Drive now (Ctrl+Alt+G)"
TraySetIcon("shell32.dll", 277)
A_IconTip := "CyberGym Drive Sync — Ctrl+Alt+G"

; Hotkey: Ctrl + Alt + G
^!g::SyncNow()

SyncNow(*) {
    TrayTip("Mirroring Ampara → G:\…", "CyberGym Sync", 0x11)
    try {
        RunWait('powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "' PS1 '"',, "Hide")
        TrayTip("Drive vault refreshed.", "CyberGym Sync", 0x11)
    } catch as e {
        TrayTip("Sync failed: " e.Message, "CyberGym Sync", 0x12)
    }
}
