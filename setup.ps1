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

New-Variable -Name dotnet_sdk_version  -Option Constant -Value '3.1.426'
New-Variable -Name dotnet_sdk_exe_name  -Option Constant -Value "dotnet-sdk-$dotnet_sdk_version-win-x64.exe"
New-Variable -Name dotnet_sdk_exe  -Option Constant -Value (Join-Path -Path $curdir -ChildPath $dotnet_sdk_exe_name)
New-Variable -Name dotnet_sdk_uri  -Option Constant -Value "https://download.visualstudio.microsoft.com/download/pr/b70ad520-0e60-43f5-aee2-d3965094a40d/667c122b3736dcbfa1beff08092dbfc3/dotnet-sdk-$dotnet_sdk_version-win-x64.exe"

if (Test-Path -LiteralPath $dotnet_sdk_exe)
{
    Write-Host "[INFO] found .NET SDK exe at $dotnet_sdk_exe"
}
else
{
    Invoke-RestMethod -Verbose -Uri $dotnet_sdk_uri -OutFile $dotnet_sdk_exe
}

& $dotnet_sdk_exe /install /silent /norestart
