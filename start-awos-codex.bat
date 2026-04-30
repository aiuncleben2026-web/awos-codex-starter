@echo off
setlocal EnableExtensions

rem AWOS Codex Starter - Traditional Chinese launcher.
rem This file uses UTF-8 so Chinese text can display correctly.
chcp 65001 >nul
title AWOS Codex Launcher

set "AWOS_RULE_FILE=C:\AWOS_WORKSPACE\AWOS.md"
set "PS_SCRIPT=%TEMP%\awos-codex-launcher-%RANDOM%-%RANDOM%.ps1"

rem Create a temporary PowerShell script to keep this .bat readable.
> "%PS_SCRIPT%" (
    echo $ErrorActionPreference = 'Stop'
    echo [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    echo $OutputEncoding = [System.Text.Encoding]::UTF8
    echo $host.UI.RawUI.WindowTitle = 'AWOS Codex Launcher'
    echo.
    echo Add-Type -AssemblyName System.Windows.Forms
    echo Add-Type -AssemblyName System.Drawing
    echo.
    echo $ruleFile = 'C:\AWOS_WORKSPACE\AWOS.md'
    echo.
    echo if ^(-not ^(Test-Path -LiteralPath $ruleFile -PathType Leaf^)^) {
    echo     [System.Windows.Forms.MessageBox]::Show^(
    echo         "找不到 AWOS 規則檔：`n$ruleFile`n`n請先建立 C:\AWOS_WORKSPACE，並把 AWOS.md 放進去。",
    echo         'AWOS Codex Launcher',
    echo         [System.Windows.Forms.MessageBoxButtons]::OK,
    echo         [System.Windows.Forms.MessageBoxIcon]::Error
    echo     ^) ^| Out-Null
    echo     exit 1
    echo }
    echo.
    echo $owner = New-Object System.Windows.Forms.Form
    echo $owner.Text = 'AWOS Codex Launcher'
    echo $owner.StartPosition = 'CenterScreen'
    echo $owner.Size = New-Object System.Drawing.Size^(1, 1^)
    echo $owner.ShowInTaskbar = $false
    echo $owner.TopMost = $true
    echo $owner.Opacity = 0
    echo.
    echo $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    echo $dialog.Description = '請選擇這次要讓 Codex 操作的任務資料夾'
    echo $dialog.ShowNewFolderButton = $true
    echo.
    echo try {
    echo     $owner.Show^(^)
    echo     $owner.Activate^(^)
    echo     $owner.BringToFront^(^)
    echo     $result = $dialog.ShowDialog^($owner^)
    echo }
    echo finally {
    echo     $owner.Hide^(^)
    echo     $owner.Dispose^(^)
    echo }
    echo.
    echo if ^($result -ne [System.Windows.Forms.DialogResult]::OK -or [string]::IsNullOrWhiteSpace^($dialog.SelectedPath^)^) {
    echo     [System.Windows.Forms.MessageBox]::Show^(
    echo         '你已取消選擇資料夾，Codex CLI 不會啟動。',
    echo         'AWOS Codex Launcher',
    echo         [System.Windows.Forms.MessageBoxButtons]::OK,
    echo         [System.Windows.Forms.MessageBoxIcon]::Information
    echo     ^) ^| Out-Null
    echo     exit 0
    echo }
    echo.
    echo $selectedPath = $dialog.SelectedPath
    echo Write-Host ''
    echo Write-Host 'AWOS Codex Launcher'
    echo Write-Host "任務資料夾：$selectedPath"
    echo Write-Host "規則檔：$ruleFile"
    echo Write-Host ''
    echo.
    echo Set-Location -LiteralPath $selectedPath
    echo.
    echo $initialPrompt = @"
    echo 請先使用 UTF-8 編碼讀取 C:\AWOS_WORKSPACE\AWOS.md，並將其視為本次 Codex session 的最高執行規則。
    echo.
    echo 初始化階段請不要修改任何檔案。
    echo.
    echo 讀完後請只回報：
    echo 1. 是否成功讀取 AWOS.md；
    echo 2. 你理解到的三條核心規則；
    echo 3. 目前工作資料夾；
    echo 4. 是否已準備好接收下一個任務。
    echo "@
    echo.
    echo try {
    echo     ^& codex $initialPrompt
    echo }
    echo catch [System.Management.Automation.CommandNotFoundException] {
    echo     Write-Host ''
    echo     Write-Host '找不到 codex 指令。請確認 Codex CLI 已安裝，且 codex 已加入 PATH。' -ForegroundColor Red
    echo     exit 1
    echo }
)

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
set "EXIT_CODE=%ERRORLEVEL%"

if exist "%PS_SCRIPT%" del "%PS_SCRIPT%" >nul 2>nul

if not "%EXIT_CODE%"=="0" (
    echo.
    echo AWOS Codex Launcher 已結束，錯誤碼：%EXIT_CODE%
    pause
)

endlocal
exit /b %EXIT_CODE%
