# Environment

## Windows

![`winver` screenshot](windows-version.png)

## Setup

To set up a fresh Windows 2016 server, do the following:

* Run all Windows Updates on the server
* Install `git`. This can be done using Scoop. Open a powershell console and run:
    ```
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    irm get.scoop.sh | iex
    scoop install git
    ```
* Clone this repository
* Open an administrative powershell console, and run `import-ca-certificate.ps1`
* Open a regular powershell console, and run:
    ```
    .\setup.ps1 -InstallOtp25 -InstallOtp26 -InstallDotnetSdk
    ```
