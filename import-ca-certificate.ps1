$ProgressPreference = 'Continue'
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2.0

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 'Tls12'

New-Variable -Name curdir  -Option Constant -Value $PSScriptRoot
Write-Host "[INFO] curdir: $curdir"

New-Variable -Name certs_dir -Option Constant -Value (Join-Path -Path $curdir -ChildPath 'certs')

New-Variable -Name ca_certificate_file -Option Constant -Value `
    (Resolve-Path -LiteralPath (Join-Path -Path $certs_dir -ChildPath 'ca_certificate.pem'))

Write-Host "[INFO] importing CA cert from '$ca_certificate_file'"
Import-Certificate -Verbose -CertStoreLocation Cert:\LocalMachine\Root -FilePath $ca_certificate_file
