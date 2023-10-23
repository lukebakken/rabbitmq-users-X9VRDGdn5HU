$ProgressPreference = 'Continue'
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 'Tls12'

New-Variable -Name curdir  -Option Constant -Value $PSScriptRoot
Write-Host "[INFO] curdir: $curdir"

New-Variable -Name otp_25_version  -Option Constant -Value '25.3.2.7'
New-Variable -Name otp_26_version  -Option Constant -Value '26.1.2'

New-Variable -Name otp_25_exe_name  -Option Constant -Value "otp_win64_$otp_25_version.exe"
New-Variable -Name otp_26_exe_name  -Option Constant -Value "otp_win64_$otp_26_version.exe"

New-Variable -Name otp_25_exe  -Option Constant -Value (Join-Path -Path $curdir -ChildPath $otp_25_exe_name)
New-Variable -Name otp_26_exe  -Option Constant -Value (Join-Path -Path $curdir -ChildPath $otp_26_exe_name)

New-Variable -Name opt_dir  -Option Constant -Value (Join-Path -Path $curdir -ChildPath 'opt')
New-Variable -Name otp_25_dir  -Option Constant -Value (Join-Path -Path $opt_dir -ChildPath '25')
New-Variable -Name otp_26_dir  -Option Constant -Value (Join-Path -Path $opt_dir -ChildPath '26')

if (Test-Path -LiteralPath $otp_25_exe)
{
    Write-Host "[INFO] found OTP 25 exe at $otp_25_exe_name"
}
else
{
    Invoke-RestMethod -Verbose -Uri "https://github.com/erlang/otp/releases/download/OTP-$otp_25_version/$otp_25_exe_name" -OutFile $otp_25_exe
}

if (Test-Path -LiteralPath $otp_26_exe)
{
    Write-Host "[INFO] found OTP 26 exe at $otp_26_exe_name"
}
else
{
    Invoke-RestMethod -Verbose -Uri "https://github.com/erlang/otp/releases/download/OTP-$otp_26_version/$otp_26_exe_name" -OutFile $otp_26_exe
}

& $otp_25_exe /S /D=$otp_25_dir
& $otp_26_exe /S /D=$otp_26_dir
