; SYNC_DRIVE.ahk
; CyberGym manual Drive sync — hotkey: Ctrl + Alt + G
;
; Setup (one-time):
;   1. Double-click this file to start it (lives in the system tray)
;   2. Optional: drop a shortcut into shell:startup so it auto-runs at login
;
; Use:
;   Press Ctrl + Alt + G anytime → mirrors Ampara to G:\ Drive
;   Tray notification when done

#SingleInstance Force
#NoEnv
SendMode Input

PS1 := "C:\Users\Ashraful\Documents\Claude\Projects\Ampara\SYNC_DRIVE.ps1"

Menu, Tray, NoStandard
Menu, Tray, Add, Sync Drive now (Ctrl+Alt+G), SyncNow
Menu, Tray, Add
Menu, Tray, Add, Exit, MenuExit
Menu, Tray, Default, Sync Drive now (Ctrl+Alt+G)
Menu, Tray, Tip, CyberGym Drive Sync — Ctrl+Alt+G
Menu, Tray, Icon, shell32.dll, 278

return

^!g::
SyncNow:
TrayTip, CyberGym Sync, Mirroring Ampara to G:\..., 1, 1
RunWait, powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%PS1%",, Hide
TrayTip, CyberGym Sync, Drive vault refreshed., 1, 1
return

MenuExit:
ExitApp
