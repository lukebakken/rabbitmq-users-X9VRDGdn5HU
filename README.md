# Setup

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

# Failure - Reproduction Steps

## TLS server

Open a powershell console, and run:

```
.\run-tls-server.ps1 -OtpVersion 26
```

## TLS client

Open a powershell console, and run:

```
cd cs
dotnet run
```

## Output (Failure)

```
PS C:\Users\vagrant\rabbitmq-users-X9VRDGdn5HU> .\run-tls-server.ps1 -OtpVersion 26
[INFO] using OTP version 26
[INFO] using erl.exe at C:\Users\vagrant\rabbitmq-users-X9VRDGdn5HU\otp\26\bin\erl.exe
[INFO] tls_server working directory:{ok,
                                     "c:/Users/vagrant/rabbitmq-users-X9VRDGdn5HU"}
[INFO] before ssl:listen(4433, Opts)
[INFO] after ssl:listen(4433, Opts)
[INFO] before ssl:transport_accept
[INFO] after ssl:transport_accept
[INFO] before ssl:handshake
reading (179 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 ae 01 00 00  aa 03 03 65 36 d0 5c a0    ...........e6.\.
0010 - 23 35 92 d3 18 db e3 04  bf 82 cd c4 44 88 73 4e    #5..........D.sN
0020 - 25 aa 7c 0b 98 94 bc 0e  dd f0 18 00 00 38 c0 2c    %.|..........8.,
0030 - c0 2b c0 30 c0 2f 00 9f  00 9e c0 24 c0 23 c0 28    .+.0./.....$.#.(
0040 - c0 27 c0 0a c0 09 c0 14  c0 13 00 39 00 33 00 9d    .'.........9.3..
0050 - 00 9c 00 3d 00 3c 00 35  00 2f 00 0a 00 6a 00 40    ...=.<.5./...j.@
0060 - 00 38 00 32 00 13 01 00  00 49 00 00 00 0e 00 0c    .8.2.....I......
0070 - 00 00 09 6c 6f 63 61 6c  68 6f 73 74 00 0a 00 08    ...localhost....
0080 - 00 06 00 1d 00 17 00 18  00 0b 00 02 01 00 00 0d    ................
0090 - 00 14 00 12 04 01 05 01  02 01 04 03 05 03 02 03    ................
00a0 - 02 02 06 01 06 03 00 23  00 00 00 17 00 00 ff 01    .......#........
00b0 - 00 01 00                                            ...
[INFO] sni_fun ServerName: "localhost"
<<< TLS 1.2 Handshake, ClientHello
[{client_version,{3,3}},
 {random,<<101,54,208,92,160,35,53,146,211,24,219,227,4,191,130,205,196,68,
           136,115,78,37,170,124,11,152,148,188,14,221,240,24>>},
 {session_id,<<>>},
 {cookie,undefined},
 {cipher_suites,["TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
                 "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
                 "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
                 "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
                 "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384",
                 "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256",
                 "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",
                 "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256",
                 "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384",
                 "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256",
                 "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
                 "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA",
                 "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
                 "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA",
                 "TLS_DHE_RSA_WITH_AES_256_CBC_SHA",
                 "TLS_DHE_RSA_WITH_AES_128_CBC_SHA",
                 "TLS_RSA_WITH_AES_256_GCM_SHA384",
                 "TLS_RSA_WITH_AES_128_GCM_SHA256",
                 "TLS_RSA_WITH_AES_256_CBC_SHA256",
                 "TLS_RSA_WITH_AES_128_CBC_SHA256",
                 "TLS_RSA_WITH_AES_256_CBC_SHA",
                 "TLS_RSA_WITH_AES_128_CBC_SHA",
                 "TLS_RSA_WITH_3DES_EDE_CBC_SHA",
                 "TLS_DHE_DSS_WITH_AES_256_CBC_SHA256",
                 "TLS_DHE_DSS_WITH_AES_128_CBC_SHA256",
                 "TLS_DHE_DSS_WITH_AES_256_CBC_SHA",
                 "TLS_DHE_DSS_WITH_AES_128_CBC_SHA",
                 "TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA"]},
 {compression_methods,[0]},
 {extensions,#{signature_algs =>
                   {hash_sign_algos,[{sha256,rsa},
                                     {sha384,rsa},
                                     {sha,rsa},
                                     {sha256,ecdsa},
                                     {sha384,ecdsa},
                                     {sha,ecdsa},
                                     {sha,dsa},
                                     {sha512,rsa},
                                     {sha512,ecdsa}]},
               elliptic_curves =>
                   {elliptic_curves,[{1,3,101,110},
                                     {1,2,840,10045,3,1,7},
                                     {1,3,132,0,34}]},
               srp => undefined,
               sni => {sni,"localhost"},
               alpn => undefined,
               ec_point_formats => {ec_point_formats,[0]},
               next_protocol_negotiation => undefined,
               renegotiation_info => {renegotiation_info,<<0>>}}}]
[INFO] sni_fun ServerName: "localhost"
writing (7 bytes) TLS 1.2 Record Protocol, alert
0000 - 15 03 03 00 02 02 47                                ......G
[ERROR] ssl:handshake Error: {error,
                              {tls_alert,
                               {insufficient_security,
                                "TLS server: In state hello at tls_handshake.erl:354 generated SERVER ALERT: Fatal - Insufficient Security\n no_suitable_ciphers"}}}
=NOTICE REPORT==== 23-Oct-2023::19:58:21.164000 ===
TLS server: In state hello at tls_handshake.erl:354 generated SERVER ALERT: Fatal - Insufficient Security
 - no_suitable_ciphers
```

```
PS C:\Users\vagrant\rabbitmq-users-X9VRDGdn5HU> cd cs
PS C:\Users\vagrant\rabbitmq-users-X9VRDGdn5HU\cs> dotnet run
[INFO] servername: localhost
[INFO] client connected to 'localhost:4433'
[ERROR] exception: Authentication failed, see inner exception.
[ERROR] inner exception: The message received was unexpected or badly formatted.
[ERROR] authentication failed - closing the connection.
```

# Success - Reproduction Steps

## TLS server

Open a powershell console, and run:

```
.\run-tls-server.ps1 -OtpVersion 25
```

## TLS client

Open a powershell console, and run:

```
cd cs
dotnet run
```

## Output (Success)

```
```

# Windows Version

![`winver` screenshot](windows-version.png)
