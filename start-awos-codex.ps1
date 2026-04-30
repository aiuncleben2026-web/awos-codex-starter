# AWOS Codex Starter - PowerShell launcher
# This file should be placed in the same folder as start-awos-codex.bat

$ErrorActionPreference = "Stop"

$awosRuleFile = "C:\AWOS_WORKSPACE\AWOS.md"

if (-not (Test-Path -LiteralPath $awosRuleFile)) {
    Write-Host ""
    Write-Host "ERROR: AWOS.md was not found."
    Write-Host "Expected path:"
    Write-Host $awosRuleFile
    Write-Host ""
    Write-Host "Please create C:\AWOS_WORKSPACE and place AWOS.md inside it."
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Add-Type -AssemblyName System.Windows.Forms

$dialog = New-Object System.Windows.Forms.FolderBrowserDialog
$dialog.Description = "Select the task folder for Codex CLI"
$dialog.ShowNewFolderButton = $true

$result = $dialog.ShowDialog()

if ($result -ne [System.Windows.Forms.DialogResult]::OK) {
    Write-Host "No folder selected. Exiting."
    exit 0
}

$taskFolder = $dialog.SelectedPath

if (-not (Test-Path -LiteralPath $taskFolder)) {
    Write-Host ""
    Write-Host "ERROR: Selected folder does not exist."
    Write-Host $taskFolder
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Set-Location -LiteralPath $taskFolder

Write-Host ""
Write-Host "Selected task folder:"
Write-Host $taskFolder
Write-Host ""
Write-Host "Starting Codex CLI..."
Write-Host ""

$startupPrompt = @"
Please read C:\AWOS_WORKSPACE\AWOS.md first.

After reading it, reply only with:
1. That AWOS.md was read successfully.
2. The three core rules you understood.
3. The current working directory.
4. That you are ready for the next task.

Do not modify any files after reading AWOS.md unless the user explicitly asks you to.
"@

codex $startupPrompt
