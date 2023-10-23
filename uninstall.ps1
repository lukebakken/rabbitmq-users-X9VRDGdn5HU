$ProgressPreference = 'Continue'
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 'Tls12'

New-Variable -Name curdir  -Option Constant -Value $PSScriptRoot
Write-Host "[INFO] curdir: $curdir"

New-Variable -Name opt_dir  -Option Constant -Value (Join-Path -Path $curdir -ChildPath 'opt')
New-Variable -Name otp_25_dir  -Option Constant -Value (Join-Path -Path $opt_dir -ChildPath '25')
New-Variable -Name otp_26_dir  -Option Constant -Value (Join-Path -Path $opt_dir -ChildPath '26')

New-Variable -Name otp_25_uninstall_exe  -Option Constant -Value (Join-Path -Path $otp_25_dir -ChildPath 'uninstall.exe')
New-Variable -Name otp_26_uninstall_exe  -Option Constant -Value (Join-Path -Path $otp_26_dir -ChildPath 'uninstall.exe')

& $otp_25_uninstall_exe /S
& $otp_26_uninstall_exe /S
