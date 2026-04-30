@echo off
setlocal EnableExtensions

rem AWOS Codex Starter launcher
rem This .bat only launches the PowerShell script in the same folder.

chcp 65001 >nul
title AWOS Codex Starter

set "SCRIPT_DIR=%~dp0"
set "PS_SCRIPT=%SCRIPT_DIR%start-awos-codex.ps1"

if not exist "%PS_SCRIPT%" (
    echo.
    echo [ERROR] start-awos-codex.ps1 was not found.
    echo.
    echo Expected location:
    echo "%PS_SCRIPT%"
    echo.
    echo Please make sure start-awos-codex.bat and start-awos-codex.ps1 are in the same folder.
    echo.
    pause
    exit /b 1
)

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"

set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
    echo.
    echo [ERROR] AWOS Codex Starter exited with code %EXIT_CODE%.
    echo.
    pause
    exit /b %EXIT_CODE%
)

endlocal
exit /b 0
