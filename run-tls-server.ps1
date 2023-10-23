## #!/usr/bin/env bash
## 
## set -o errexit
## set -o nounset
## 
## declare -r script_dir="$(realpath "$(dirname "$BASH_SOURCE")")"
## 
## erlc +debug "$script_dir/src/tls_server.erl"
## 
## erl -noinput -s tls_server start

param(
    [int]$OtpVersion = 26
)

$ProgressPreference = 'Continue'
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 'Tls12'


if ($OtpVersion -eq 25 -or $OtpVersion -eq 26)
{
    Write-Host "[INFO] using OTP version $OtpVersion"
}
else
{
    Write-Error "OtpVersion must be 25 or 26"
}

New-Variable -Name curdir  -Option Constant -Value $PSScriptRoot
New-Variable -Name src_dir  -Option Constant -Value (Join-Path -Path $curdir -ChildPath 'src')
New-Variable -Name otp_dir  -Option Constant -Value (Join-Path -Path $curdir -ChildPath 'otp')
New-Variable -Name otp_bin_dir  -Option Constant -Value (Join-Path -Path $otp_dir -ChildPath $OtpVersion | Join-Path -ChildPath 'bin')
New-Variable -Name erlc_exe  -Option Constant -Value (Join-Path -Path $otp_bin_dir -ChildPath 'erlc.exe')
New-Variable -Name erl_exe  -Option Constant -Value (Join-Path -Path $otp_bin_dir -ChildPath 'erl.exe')

Write-Host "[INFO] using erl.exe at $erl_exe"

& $erlc_exe +debug $(Join-Path -Path $src_dir -ChildPath 'tls_server.erl')
& $erl_exe -noinput -s tls_server start
