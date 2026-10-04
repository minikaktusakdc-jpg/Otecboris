@echo off
setlocal

if not "%1"=="ADMIN" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command ^
    "Start-Process -FilePath '%~f0' -ArgumentList 'ADMIN' -Verb RunAs -WindowStyle Minimized"
    exit /b
)

cscript.exe //nologo "%windir%\System32\slmgr.vbs" /rearm

timeout /t 3 /nobreak >nul

exit /b