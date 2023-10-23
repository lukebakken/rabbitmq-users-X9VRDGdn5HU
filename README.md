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

[OTP 26 failure - packet capture](failure-otp-26.pcapng)

### Erlang TLS Server Output

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

### .NET Client Output

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

[OTP 25 success - packet capture](success-otp-25.pcapng)

### Erlang TLS Server Output

```
[INFO] tls_server working directory:{ok,
                                     "c:/Users/vagrant/rabbitmq-users-X9VRDGdn5HU"}
[INFO] before ssl:listen(4433, Opts)
[INFO] after ssl:listen(4433, Opts)
[INFO] before ssl:transport_accept
[INFO] after ssl:transport_accept
[INFO] before ssl:handshake
reading (179 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 ae 01 00 00  aa 03 03 65 36 d1 9e c4    ...........e6...
0010 - ff c1 50 3f 3f 50 89 ff  ad 60 c3 ee 00 46 e0 5e    ..P??P...`...F.^
0020 - a1 27 7d 08 d7 57 18 c4  d2 1b 57 00 00 38 c0 2c    .'}..W....W..8.,
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
 {random,<<101,54,209,158,196,255,193,80,63,63,80,137,255,173,96,195,238,0,70,
           224,94,161,39,125,8,215,87,24,196,210,27,87>>},
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
 {extensions,#{alpn => undefined,
               ec_point_formats => {ec_point_formats,[0]},
               elliptic_curves =>
                   {elliptic_curves,[{1,3,101,110},
                                     {1,2,840,10045,3,1,7},
                                     {1,3,132,0,34}]},
               next_protocol_negotiation => undefined,
               renegotiation_info => {renegotiation_info,<<0>>},
               signature_algs =>
                   {hash_sign_algos,[{sha256,rsa},
                                     {sha384,rsa},
                                     {sha,rsa},
                                     {sha256,ecdsa},
                                     {sha384,ecdsa},
                                     {sha,ecdsa},
                                     {sha,dsa},
                                     {sha512,rsa},
                                     {sha512,ecdsa}]},
               sni => {sni,"localhost"},
               srp => undefined}}]
>>> TLS 1.2 Handshake, ServerHello
[{server_version,{3,3}},
 {random,<<250,84,88,173,119,9,136,193,240,44,220,35,48,107,206,169,28,225,
           138,0,145,201,210,234,68,79,87,78,71,82,68,1>>},
 {session_id,<<20,145,63,178,197,169,147,204,147,71,202,244,116,49,254,82,191,
               131,52,193,157,203,118,224,46,106,182,95,215,216,197,184>>},
 {cipher_suite,"TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"},
 {compression_method,0},
 {extensions,#{alpn => undefined,
               ec_point_formats => {ec_point_formats,[0]},
               max_frag_enum => undefined,
               next_protocol_negotiation => undefined,
               renegotiation_info => {renegotiation_info,<<0>>},
               sni => {sni,[]}}}]
writing (96 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 5b 02 00 00  57 03 03 fa 54 58 ad 77    ....[...W...TX.w
0010 - 09 88 c1 f0 2c dc 23 30  6b ce a9 1c e1 8a 00 91    ....,.#0k.......
0020 - c9 d2 ea 44 4f 57 4e 47  52 44 01 20 14 91 3f b2    ...DOWNGRD. ..?.
0030 - c5 a9 93 cc 93 47 ca f4  74 31 fe 52 bf 83 34 c1    .....G..t1.R..4.
0040 - 9d cb 76 e0 2e 6a b6 5f  d7 d8 c5 b8 c0 30 00 00    ..v..j._.....0..
0050 - 0f 00 00 00 00 ff 01 00  01 00 00 0b 00 02 01 00    ................
>>> Handshake, Certificate
[{asn1_certificates,[<<48,130,3,188,48,130,2,164,160,3,2,1,2,2,1,1,48,13,6,9,
                       42,134,72,134,247,13,1,1,11,5,0,48,76,49,59,48,57,6,3,
                       85,4,3,12,50,84,76,83,71,101,110,83,101,108,102,83,105,
                       103,110,101,100,116,82,111,111,116,67,65,32,50,48,50,51,
                       45,49,48,45,49,57,84,48,55,58,52,48,58,53,55,46,49,54,
                       56,51,49,54,49,13,48,11,6,3,85,4,7,12,4,36,36,36,36,48,
                       30,23,13,50,51,49,48,49,57,49,52,52,48,53,55,90,23,13,
                       51,51,49,48,49,54,49,52,52,48,53,55,90,48,37,49,18,48,
                       16,6,3,85,4,3,12,9,108,111,99,97,108,104,111,115,116,49,
                       15,48,13,6,3,85,4,10,12,6,115,101,114,118,101,114,48,
                       130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,3,130,
                       1,15,0,48,130,1,10,2,130,1,1,0,222,8,102,91,100,217,85,
                       196,78,167,186,64,99,159,10,197,159,93,119,147,76,239,
                       115,199,124,67,142,87,5,43,19,108,108,15,164,33,1,85,85,
                       149,77,58,152,52,241,11,162,23,127,198,175,124,131,33,
                       52,78,47,7,219,28,20,38,178,76,208,49,6,21,97,181,195,
                       176,191,44,46,46,245,131,116,5,92,15,95,193,50,180,114,
                       73,245,108,2,112,238,172,117,74,114,100,194,211,183,155,
                       244,119,68,242,84,180,52,74,69,169,40,54,219,92,231,141,
                       240,113,244,254,14,136,131,157,238,159,217,242,108,59,
                       215,40,62,59,63,109,28,149,184,120,57,230,169,192,5,163,
                       63,46,209,180,68,65,194,138,165,111,200,238,73,133,111,
                       53,150,180,217,7,195,226,73,64,219,23,210,10,194,69,220,
                       246,29,184,104,67,150,148,213,42,122,24,185,122,194,16,
                       53,197,195,111,51,107,83,36,61,156,62,4,239,18,34,181,
                       89,164,181,229,30,23,50,196,95,245,192,208,123,214,36,
                       231,142,196,174,41,189,203,161,56,23,52,243,26,130,44,
                       168,46,104,47,55,76,249,83,38,181,125,104,191,159,135,
                       169,2,3,1,0,1,163,129,207,48,129,204,48,9,6,3,85,29,19,
                       4,2,48,0,48,11,6,3,85,29,15,4,4,3,2,5,160,48,19,6,3,85,
                       29,37,4,12,48,10,6,8,43,6,1,5,5,7,3,1,48,42,6,3,85,29,
                       17,4,35,48,33,130,9,108,111,99,97,108,104,111,115,116,
                       130,9,80,82,79,75,79,70,73,69,86,130,9,108,111,99,97,
                       108,104,111,115,116,48,29,6,3,85,29,14,4,22,4,20,131,
                       244,135,73,80,47,7,67,53,60,194,143,168,129,214,132,161,
                       216,99,252,48,31,6,3,85,29,35,4,24,48,22,128,20,26,216,
                       209,116,185,181,226,224,235,65,17,117,87,170,119,192,
                       233,75,168,197,48,49,6,3,85,29,31,4,42,48,40,48,38,160,
                       36,160,34,134,32,104,116,116,112,58,47,47,99,114,108,45,
                       115,101,114,118,101,114,58,56,48,48,48,47,98,97,115,105,
                       99,46,99,114,108,48,13,6,9,42,134,72,134,247,13,1,1,11,
                       5,0,3,130,1,1,0,43,254,233,179,119,61,2,94,213,98,176,
                       33,106,143,205,189,39,233,244,232,63,59,7,145,88,47,119,
                       170,202,203,99,52,22,2,255,191,250,210,38,75,176,188,7,
                       80,124,121,64,24,1,142,170,113,242,75,40,201,225,20,37,
                       175,222,64,95,71,20,48,140,244,157,22,221,217,154,14,
                       156,46,153,106,30,26,45,195,223,32,18,246,14,215,95,71,
                       33,179,156,50,164,53,134,91,129,250,204,20,241,187,143,
                       84,44,49,202,93,224,47,212,249,105,220,90,234,35,57,218,
                       133,196,222,82,23,237,159,30,47,193,229,37,239,69,63,65,
                       102,130,19,71,1,95,102,253,69,103,206,37,70,101,176,236,
                       151,94,208,106,163,145,188,10,146,100,105,193,113,3,189,
                       123,19,164,32,51,45,5,50,11,163,20,41,105,124,155,74,
                       218,59,121,84,17,96,254,50,56,184,111,192,142,250,225,
                       86,201,11,59,142,141,36,83,90,49,163,216,239,147,24,71,
                       217,106,235,198,30,151,87,72,50,199,199,174,17,49,180,
                       123,143,175,178,7,163,21,110,50,193,221,211,42,1,48,39,
                       80,126,231,249,47,33,101,51,70,93>>,
                     <<48,130,3,134,48,130,2,110,160,3,2,1,2,2,20,37,92,26,
                       14,160,116,25,253,255,246,93,70,43,64,78,203,221,148,
                       148,157,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,48,
                       76,49,59,48,57,6,3,85,4,3,12,50,84,76,83,71,101,110,
                       83,101,108,102,83,105,103,110,101,100,116,82,111,111,
                       116,67,65,32,50,48,50,51,45,49,48,45,49,57,84,48,55,
                       58,52,48,58,53,55,46,49,54,56,51,49,54,49,13,48,11,6,
                       3,85,4,7,12,4,36,36,36,36,48,30,23,13,50,51,49,48,49,
                       57,49,52,52,48,53,55,90,23,13,51,51,49,48,49,54,49,
                       52,52,48,53,55,90,48,76,49,59,48,57,6,3,85,4,3,12,50,
                       84,76,83,71,101,110,83,101,108,102,83,105,103,110,
                       101,100,116,82,111,111,116,67,65,32,50,48,50,51,45,
                       49,48,45,49,57,84,48,55,58,52,48,58,53,55,46,49,54,
                       56,51,49,54,49,13,48,11,6,3,85,4,7,12,4,36,36,36,36,
                       48,130,1,34,48,13,6,9,42,134,72,134,247,13,1,1,1,5,0,
                       3,130,1,15,0,48,130,1,10,2,130,1,1,0,146,7,211,219,
                       172,47,36,198,122,239,198,65,234,4,178,213,78,97,93,
                       14,153,54,207,79,155,83,208,201,1,67,184,19,92,184,
                       21,64,241,45,201,201,161,128,19,137,132,206,99,9,162,
                       68,183,236,89,49,129,23,248,189,20,110,105,47,230,
                       227,87,105,89,200,46,81,137,11,158,120,169,49,117,
                       207,113,186,153,132,171,93,230,156,77,156,192,200,17,
                       46,108,181,70,56,155,154,8,23,195,147,188,178,117,
                       212,198,84,198,119,7,236,83,78,87,254,246,59,102,191,
                       0,24,219,51,250,67,8,38,189,0,179,12,128,105,67,122,
                       250,155,204,15,59,224,255,60,43,117,124,32,245,219,
                       148,68,208,24,5,231,247,68,70,156,231,192,14,144,55,
                       46,135,70,87,242,158,226,31,17,137,90,18,198,150,193,
                       174,193,237,41,196,220,82,86,199,195,40,253,105,27,
                       186,244,24,227,179,169,38,188,172,165,129,23,238,151,
                       194,194,253,41,27,185,72,134,2,6,202,177,224,83,149,
                       113,170,5,2,29,189,30,9,135,123,6,143,98,227,251,166,
                       82,246,135,34,250,80,244,248,142,87,211,45,233,235,
                       139,76,147,2,3,1,0,1,163,96,48,94,48,15,6,3,85,29,19,
                       1,1,255,4,5,48,3,1,1,255,48,11,6,3,85,29,15,4,4,3,2,
                       1,6,48,29,6,3,85,29,14,4,22,4,20,26,216,209,116,185,
                       181,226,224,235,65,17,117,87,170,119,192,233,75,168,
                       197,48,31,6,3,85,29,35,4,24,48,22,128,20,26,216,209,
                       116,185,181,226,224,235,65,17,117,87,170,119,192,233,
                       75,168,197,48,13,6,9,42,134,72,134,247,13,1,1,11,5,0,
                       3,130,1,1,0,10,161,39,218,146,238,29,251,129,19,195,
                       99,26,140,141,87,251,16,132,172,112,237,47,137,236,
                       140,55,221,203,244,22,116,93,112,130,25,176,119,175,
                       127,27,7,140,191,160,17,25,156,77,182,178,140,116,
                       224,227,157,84,109,161,227,13,204,124,144,227,143,62,
                       44,83,81,142,179,112,230,46,199,156,139,105,195,254,
                       246,208,9,16,161,27,175,188,119,226,152,88,170,203,
                       124,143,227,251,48,251,107,95,252,90,227,233,245,55,
                       17,255,1,86,191,252,228,84,168,72,57,200,138,133,156,
                       227,15,226,103,4,130,147,71,254,56,139,122,236,91,
                       208,245,15,23,156,165,10,60,146,234,222,90,184,0,52,
                       10,2,211,144,238,218,78,220,82,115,176,162,9,237,20,
                       54,175,211,174,142,62,77,219,165,6,239,251,151,76,61,
                       126,178,49,49,85,2,148,24,242,234,58,89,49,24,98,125,
                       40,243,91,246,199,176,251,125,212,159,14,188,229,183,
                       68,232,136,16,110,238,242,180,227,147,183,219,169,70,
                       112,58,177,142,106,88,210,141,126,148,241,30,91,60,
                       165,228,178,176,204,217,96,140,100,222,204,254,126,
                       244,58>>]}]
writing (1884 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 07 57 0b 00 07  53 00 07 50 00 03 c0 30    ....W...S..P...0
0010 - 82 03 bc 30 82 02 a4 a0  03 02 01 02 02 01 01 30    ...0...........0
0020 - 0d 06 09 2a 86 48 86 f7  0d 01 01 0b 05 00 30 4c    ...*.H........0L
0030 - 31 3b 30 39 06 03 55 04  03 0c 32 54 4c 53 47 65    1;09..U...2TLSGe
0040 - 6e 53 65 6c 66 53 69 67  6e 65 64 74 52 6f 6f 74    nSelfSignedtRoot
0050 - 43 41 20 32 30 32 33 2d  31 30 2d 31 39 54 30 37    CA 2023-10-19T07
0060 - 3a 34 30 3a 35 37 2e 31  36 38 33 31 36 31 0d 30    :40:57.1683161.0
0070 - 0b 06 03 55 04 07 0c 04  24 24 24 24 30 1e 17 0d    ...U....$$$$0...
0080 - 32 33 31 30 31 39 31 34  34 30 35 37 5a 17 0d 33    231019144057Z..3
0090 - 33 31 30 31 36 31 34 34  30 35 37 5a 30 25 31 12    31016144057Z0%1.
00a0 - 30 10 06 03 55 04 03 0c  09 6c 6f 63 61 6c 68 6f    0...U....localho
00b0 - 73 74 31 0f 30 0d 06 03  55 04 0a 0c 06 73 65 72    st1.0...U....ser
00c0 - 76 65 72 30 82 01 22 30  0d 06 09 2a 86 48 86 f7    ver0.."0...*.H..
00d0 - 0d 01 01 01 05 00 03 82  01 0f 00 30 82 01 0a 02    ...........0....
00e0 - 82 01 01 00 de 08 66 5b  64 d9 55 c4 4e a7 ba 40    ......f[d.U.N..@
00f0 - 63 9f 0a c5 9f 5d 77 93  4c ef 73 c7 7c 43 8e 57    c....]w.L.s.|C.W
0100 - 05 2b 13 6c 6c 0f a4 21  01 55 55 95 4d 3a 98 34    .+.ll..!.UU.M:.4
0110 - f1 0b a2 17 7f c6 af 7c  83 21 34 4e 2f 07 db 1c    .......|.!4N/...
0120 - 14 26 b2 4c d0 31 06 15  61 b5 c3 b0 bf 2c 2e 2e    .&.L.1..a....,..
0130 - f5 83 74 05 5c 0f 5f c1  32 b4 72 49 f5 6c 02 70    ..t.\._.2.rI.l.p
0140 - ee ac 75 4a 72 64 c2 d3  b7 9b f4 77 44 f2 54 b4    ..uJrd.....wD.T.
0150 - 34 4a 45 a9 28 36 db 5c  e7 8d f0 71 f4 fe 0e 88    4JE.(6.\...q....
0160 - 83 9d ee 9f d9 f2 6c 3b  d7 28 3e 3b 3f 6d 1c 95    ......l;.(>;?m..
0170 - b8 78 39 e6 a9 c0 05 a3  3f 2e d1 b4 44 41 c2 8a    .x9.....?...DA..
0180 - a5 6f c8 ee 49 85 6f 35  96 b4 d9 07 c3 e2 49 40    .o..I.o5......I@
0190 - db 17 d2 0a c2 45 dc f6  1d b8 68 43 96 94 d5 2a    .....E....hC...*
01a0 - 7a 18 b9 7a c2 10 35 c5  c3 6f 33 6b 53 24 3d 9c    z..z..5..o3kS$=.
01b0 - 3e 04 ef 12 22 b5 59 a4  b5 e5 1e 17 32 c4 5f f5    >...".Y.....2._.
01c0 - c0 d0 7b d6 24 e7 8e c4  ae 29 bd cb a1 38 17 34    ..{.$....)...8.4
01d0 - f3 1a 82 2c a8 2e 68 2f  37 4c f9 53 26 b5 7d 68    ...,..h/7L.S&.}h
01e0 - bf 9f 87 a9 02 03 01 00  01 a3 81 cf 30 81 cc 30    ............0..0
01f0 - 09 06 03 55 1d 13 04 02  30 00 30 0b 06 03 55 1d    ...U....0.0...U.
0200 - 0f 04 04 03 02 05 a0 30  13 06 03 55 1d 25 04 0c    .......0...U.%..
0210 - 30 0a 06 08 2b 06 01 05  05 07 03 01 30 2a 06 03    0...+.......0*..
0220 - 55 1d 11 04 23 30 21 82  09 6c 6f 63 61 6c 68 6f    U...#0!..localho
0230 - 73 74 82 09 50 52 4f 4b  4f 46 49 45 56 82 09 6c    st..PROKOFIEV..l
0240 - 6f 63 61 6c 68 6f 73 74  30 1d 06 03 55 1d 0e 04    ocalhost0...U...
0250 - 16 04 14 83 f4 87 49 50  2f 07 43 35 3c c2 8f a8    ......IP/.C5<...
0260 - 81 d6 84 a1 d8 63 fc 30  1f 06 03 55 1d 23 04 18    .....c.0...U.#..
0270 - 30 16 80 14 1a d8 d1 74  b9 b5 e2 e0 eb 41 11 75    0......t.....A.u
0280 - 57 aa 77 c0 e9 4b a8 c5  30 31 06 03 55 1d 1f 04    W.w..K..01..U...
0290 - 2a 30 28 30 26 a0 24 a0  22 86 20 68 74 74 70 3a    *0(0&.$.". http:
02a0 - 2f 2f 63 72 6c 2d 73 65  72 76 65 72 3a 38 30 30    //crl-server:800
02b0 - 30 2f 62 61 73 69 63 2e  63 72 6c 30 0d 06 09 2a    0/basic.crl0...*
02c0 - 86 48 86 f7 0d 01 01 0b  05 00 03 82 01 01 00 2b    .H.............+
02d0 - fe e9 b3 77 3d 02 5e d5  62 b0 21 6a 8f cd bd 27    ...w=.^.b.!j...'
02e0 - e9 f4 e8 3f 3b 07 91 58  2f 77 aa ca cb 63 34 16    ...?;..X/w...c4.
02f0 - 02 ff bf fa d2 26 4b b0  bc 07 50 7c 79 40 18 01    .....&K...P|y@..
0300 - 8e aa 71 f2 4b 28 c9 e1  14 25 af de 40 5f 47 14    ..q.K(...%..@_G.
0310 - 30 8c f4 9d 16 dd d9 9a  0e 9c 2e 99 6a 1e 1a 2d    0...........j..-
0320 - c3 df 20 12 f6 0e d7 5f  47 21 b3 9c 32 a4 35 86    .. ...._G!..2.5.
0330 - 5b 81 fa cc 14 f1 bb 8f  54 2c 31 ca 5d e0 2f d4    [.......T,1.]./.
0340 - f9 69 dc 5a ea 23 39 da  85 c4 de 52 17 ed 9f 1e    .i.Z.#9....R....
0350 - 2f c1 e5 25 ef 45 3f 41  66 82 13 47 01 5f 66 fd    /..%.E?Af..G._f.
0360 - 45 67 ce 25 46 65 b0 ec  97 5e d0 6a a3 91 bc 0a    Eg.%Fe...^.j....
0370 - 92 64 69 c1 71 03 bd 7b  13 a4 20 33 2d 05 32 0b    .di.q..{.. 3-.2.
0380 - a3 14 29 69 7c 9b 4a da  3b 79 54 11 60 fe 32 38    ..)i|.J.;yT.`.28
0390 - b8 6f c0 8e fa e1 56 c9  0b 3b 8e 8d 24 53 5a 31    .o....V..;..$SZ1
03a0 - a3 d8 ef 93 18 47 d9 6a  eb c6 1e 97 57 48 32 c7    .....G.j....WH2.
03b0 - c7 ae 11 31 b4 7b 8f af  b2 07 a3 15 6e 32 c1 dd    ...1.{......n2..
03c0 - d3 2a 01 30 27 50 7e e7  f9 2f 21 65 33 46 5d 00    .*.0'P~../!e3F].
03d0 - 03 8a 30 82 03 86 30 82  02 6e a0 03 02 01 02 02    ..0...0..n......
03e0 - 14 25 5c 1a 0e a0 74 19  fd ff f6 5d 46 2b 40 4e    .%\...t....]F+@N
03f0 - cb dd 94 94 9d 30 0d 06  09 2a 86 48 86 f7 0d 01    .....0...*.H....
0400 - 01 0b 05 00 30 4c 31 3b  30 39 06 03 55 04 03 0c    ....0L1;09..U...
0410 - 32 54 4c 53 47 65 6e 53  65 6c 66 53 69 67 6e 65    2TLSGenSelfSigne
0420 - 64 74 52 6f 6f 74 43 41  20 32 30 32 33 2d 31 30    dtRootCA 2023-10
0430 - 2d 31 39 54 30 37 3a 34  30 3a 35 37 2e 31 36 38    -19T07:40:57.168
0440 - 33 31 36 31 0d 30 0b 06  03 55 04 07 0c 04 24 24    3161.0...U....$$
0450 - 24 24 30 1e 17 0d 32 33  31 30 31 39 31 34 34 30    $$0...2310191440
0460 - 35 37 5a 17 0d 33 33 31  30 31 36 31 34 34 30 35    57Z..33101614405
0470 - 37 5a 30 4c 31 3b 30 39  06 03 55 04 03 0c 32 54    7Z0L1;09..U...2T
0480 - 4c 53 47 65 6e 53 65 6c  66 53 69 67 6e 65 64 74    LSGenSelfSignedt
0490 - 52 6f 6f 74 43 41 20 32  30 32 33 2d 31 30 2d 31    RootCA 2023-10-1
04a0 - 39 54 30 37 3a 34 30 3a  35 37 2e 31 36 38 33 31    9T07:40:57.16831
04b0 - 36 31 0d 30 0b 06 03 55  04 07 0c 04 24 24 24 24    61.0...U....$$$$
04c0 - 30 82 01 22 30 0d 06 09  2a 86 48 86 f7 0d 01 01    0.."0...*.H.....
04d0 - 01 05 00 03 82 01 0f 00  30 82 01 0a 02 82 01 01    ........0.......
04e0 - 00 92 07 d3 db ac 2f 24  c6 7a ef c6 41 ea 04 b2    ....../$.z..A...
04f0 - d5 4e 61 5d 0e 99 36 cf  4f 9b 53 d0 c9 01 43 b8    .Na]..6.O.S...C.
0500 - 13 5c b8 15 40 f1 2d c9  c9 a1 80 13 89 84 ce 63    .\..@.-........c
0510 - 09 a2 44 b7 ec 59 31 81  17 f8 bd 14 6e 69 2f e6    ..D..Y1.....ni/.
0520 - e3 57 69 59 c8 2e 51 89  0b 9e 78 a9 31 75 cf 71    .WiY..Q...x.1u.q
0530 - ba 99 84 ab 5d e6 9c 4d  9c c0 c8 11 2e 6c b5 46    ....]..M.....l.F
0540 - 38 9b 9a 08 17 c3 93 bc  b2 75 d4 c6 54 c6 77 07    8........u..T.w.
0550 - ec 53 4e 57 fe f6 3b 66  bf 00 18 db 33 fa 43 08    .SNW..;f....3.C.
0560 - 26 bd 00 b3 0c 80 69 43  7a fa 9b cc 0f 3b e0 ff    &.....iCz....;..
0570 - 3c 2b 75 7c 20 f5 db 94  44 d0 18 05 e7 f7 44 46    <+u| ...D.....DF
0580 - 9c e7 c0 0e 90 37 2e 87  46 57 f2 9e e2 1f 11 89    .....7..FW......
0590 - 5a 12 c6 96 c1 ae c1 ed  29 c4 dc 52 56 c7 c3 28    Z.......)..RV..(
05a0 - fd 69 1b ba f4 18 e3 b3  a9 26 bc ac a5 81 17 ee    .i.......&......
05b0 - 97 c2 c2 fd 29 1b b9 48  86 02 06 ca b1 e0 53 95    ....)..H......S.
05c0 - 71 aa 05 02 1d bd 1e 09  87 7b 06 8f 62 e3 fb a6    q........{..b...
05d0 - 52 f6 87 22 fa 50 f4 f8  8e 57 d3 2d e9 eb 8b 4c    R..".P...W.-...L
05e0 - 93 02 03 01 00 01 a3 60  30 5e 30 0f 06 03 55 1d    .......`0^0...U.
05f0 - 13 01 01 ff 04 05 30 03  01 01 ff 30 0b 06 03 55    ......0....0...U
0600 - 1d 0f 04 04 03 02 01 06  30 1d 06 03 55 1d 0e 04    ........0...U...
0610 - 16 04 14 1a d8 d1 74 b9  b5 e2 e0 eb 41 11 75 57    ......t.....A.uW
0620 - aa 77 c0 e9 4b a8 c5 30  1f 06 03 55 1d 23 04 18    .w..K..0...U.#..
0630 - 30 16 80 14 1a d8 d1 74  b9 b5 e2 e0 eb 41 11 75    0......t.....A.u
0640 - 57 aa 77 c0 e9 4b a8 c5  30 0d 06 09 2a 86 48 86    W.w..K..0...*.H.
0650 - f7 0d 01 01 0b 05 00 03  82 01 01 00 0a a1 27 da    ..............'.
0660 - 92 ee 1d fb 81 13 c3 63  1a 8c 8d 57 fb 10 84 ac    .......c...W....
0670 - 70 ed 2f 89 ec 8c 37 dd  cb f4 16 74 5d 70 82 19    p./...7....t]p..
0680 - b0 77 af 7f 1b 07 8c bf  a0 11 19 9c 4d b6 b2 8c    .w..........M...
0690 - 74 e0 e3 9d 54 6d a1 e3  0d cc 7c 90 e3 8f 3e 2c    t...Tm....|...>,
06a0 - 53 51 8e b3 70 e6 2e c7  9c 8b 69 c3 fe f6 d0 09    SQ..p.....i.....
06b0 - 10 a1 1b af bc 77 e2 98  58 aa cb 7c 8f e3 fb 30    .....w..X..|...0
06c0 - fb 6b 5f fc 5a e3 e9 f5  37 11 ff 01 56 bf fc e4    .k_.Z...7...V...
06d0 - 54 a8 48 39 c8 8a 85 9c  e3 0f e2 67 04 82 93 47    T.H9.......g...G
06e0 - fe 38 8b 7a ec 5b d0 f5  0f 17 9c a5 0a 3c 92 ea    .8.z.[.......<..
06f0 - de 5a b8 00 34 0a 02 d3  90 ee da 4e dc 52 73 b0    .Z..4......N.Rs.
0700 - a2 09 ed 14 36 af d3 ae  8e 3e 4d db a5 06 ef fb    ....6....>M.....
0710 - 97 4c 3d 7e b2 31 31 55  02 94 18 f2 ea 3a 59 31    .L=~.11U.....:Y1
0720 - 18 62 7d 28 f3 5b f6 c7  b0 fb 7d d4 9f 0e bc e5    .b}(.[....}.....
0730 - b7 44 e8 88 10 6e ee f2  b4 e3 93 b7 db a9 46 70    .D...n........Fp
0740 - 3a b1 8e 6a 58 d2 8d 7e  94 f1 1e 5b 3c a5 e4 b2    :..jX..~...[<...
0750 - b0 cc d9 60 8c 64 de cc  fe 7e f4 3a                  ...`.d...~.:
[INFO] after ssl:handshake, Socket: {sslsocket,
                                     {gen_tcp,#Port<0.4>,tls_connection,
                                      [{option_tracker,<0.106.0>},
                                       {session_tickets_tracker,disabled},
                                       {session_id_tracker,<0.107.0>}]},
                                     [<0.110.0>,<0.109.0>]}
>>> Handshake, ServerKeyExchange
[{params,{server_ecdh_params,{namedCurve,{1,2,840,10045,3,1,7}},
                             <<4,73,39,6,192,224,54,120,116,40,9,202,152,36,
                               159,161,36,11,151,132,160,56,223,246,33,181,
                               60,72,36,141,82,208,158,216,22,205,103,51,55,
                               94,43,46,224,69,126,118,191,217,188,5,208,120,
                               223,126,214,167,44,135,139,183,161,130,155,
                               225,66>>}},
 {params_bin,<<3,0,23,65,4,73,39,6,192,224,54,120,116,40,9,202,152,36,159,161,
               36,11,151,132,160,56,223,246,33,181,60,72,36,141,82,208,158,
               216,22,205,103,51,55,94,43,46,224,69,126,118,191,217,188,5,208,
               120,223,126,214,167,44,135,139,183,161,130,155,225,66>>},
 {hashsign,{sha256,rsa}},
 {signature,<<176,208,8,150,126,73,191,54,108,239,26,76,229,172,200,250,135,
              201,194,244,142,221,49,169,130,196,169,44,17,235,208,55,227,
              125,81,137,84,67,139,4,203,222,164,137,42,149,63,236,250,75,7,
              219,52,163,48,125,67,108,215,118,237,52,107,93,172,159,91,3,
              114,213,168,206,9,175,39,139,43,150,252,240,124,243,59,87,131,
              38,221,242,245,184,56,56,255,56,165,222,196,138,78,180,226,253,
              105,131,10,127,199,145,88,109,146,141,103,4,177,51,82,61,100,
              163,51,118,46,142,202,118,83,160,141,85,156,43,96,169,222,105,
              148,210,243,72,211,120,68,34,16,58,220,207,117,122,131,194,248,
              118,84,96,171,151,74,211,223,25,70,102,191,155,120,88,59,60,
              228,70,103,11,20,1,33,145,178,56,37,96,109,176,128,254,233,147,
              252,160,253,7,219,70,38,251,222,155,188,239,123,105,141,88,72,
              188,24,104,3,8,23,8,160,135,144,186,19,88,67,52,44,110,86,47,
              179,78,152,134,9,150,206,154,122,62,90,117,111,84,156,78,162,
              242,67,127,210,94,146,181,213,12,206,250,133,8,5,62>>}]
[INFO] ssl:handshake sni_hostname: "localhost"
[INFO] writing keylog data to keylog.bin
writing (338 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 01 4d 0c 00 01  49 03 00 17 41 04 49 27    ....M...I...A.I'
0010 - 06 c0 e0 36 78 74 28 09  ca 98 24 9f a1 24 0b 97    ...6xt(...$..$..
0020 - 84 a0 38 df f6 21 b5 3c  48 24 8d 52 d0 9e d8 16    ..8..!.<H$.R....
0030 - cd 67 33 37 5e 2b 2e e0  45 7e 76 bf d9 bc 05 d0    .g37^+..E~v.....
0040 - 78 df 7e d6 a7 2c 87 8b  b7 a1 82 9b e1 42 04 01    x.~..,.......B..
0050 - 01 00 b0 d0 08 96 7e 49  bf 36 6c ef 1a 4c e5 ac    ......~I.6l..L..
0060 - c8 fa 87 c9 c2 f4 8e dd  31 a9 82 c4 a9 2c 11 eb    ........1....,..
0070 - d0 37 e3 7d 51 89 54 43  8b 04 cb de a4 89 2a 95    .7.}Q.TC......*.
0080 - 3f ec fa 4b 07 db 34 a3  30 7d 43 6c d7 76 ed 34    ?..K..4.0}Cl.v.4
0090 - 6b 5d ac 9f 5b 03 72 d5  a8 ce 09 af 27 8b 2b 96    k]..[.r.....'.+.
00a0 - fc f0 7c f3 3b 57 83 26  dd f2 f5 b8 38 38 ff 38    ..|.;W.&....88.8
00b0 - a5 de c4 8a 4e b4 e2 fd  69 83 0a 7f c7 91 58 6d    ....N...i.....Xm
00c0 - 92 8d 67 04 b1 33 52 3d  64 a3 33 76 2e 8e ca 76    ..g..3R=d.3v...v
00d0 - 53 a0 8d 55 9c 2b 60 a9  de 69 94 d2 f3 48 d3 78    S..U.+`..i...H.x
00e0 - 44 22 10 3a dc cf 75 7a  83 c2 f8 76 54 60 ab 97    D".:..uz...vT`..
00f0 - 4a d3 df 19 46 66 bf 9b  78 58 3b 3c e4 46 67 0b    J...Ff..xX;<.Fg.
0100 - 14 01 21 91 b2 38 25 60  6d b0 80 fe e9 93 fc a0    ..!..8%`m.......
0110 - fd 07 db 46 26 fb de 9b  bc ef 7b 69 8d 58 48 bc    ...F&.....{i.XH.
0120 - 18 68 03 08 17 08 a0 87  90 ba 13 58 43 34 2c 6e    .h.........XC4,n
0130 - 56 2f b3 4e 98 86 09 96  ce 9a 7a 3e 5a 75 6f 54    V/.N......z>ZuoT
0140 - 9c 4e a2 f2 43 7f d2 5e  92 b5 d5 0c ce fa 85 08    .N..C..^........
0150 - 05 3e                                               .>
>>> Handshake, CertificateRequest
[{certificate_types,<<64,1,2>>},
 {hashsign_algorithms,
     {hash_sign_algos,
         [{sha512,rsa_pss_pss},
          {sha384,rsa_pss_pss},
          {sha256,rsa_pss_pss},
          {sha512,rsa_pss_rsae},
          {sha384,rsa_pss_rsae},
          {sha256,rsa_pss_rsae},
          {sha512,ecdsa},
          {sha512,rsa},
          {sha384,ecdsa},
          {sha384,rsa},
          {sha256,ecdsa},
          {sha256,rsa},
          {sha224,ecdsa},
          {sha224,rsa},
          {sha,ecdsa},
          {sha,rsa},
          {sha,dsa}]}},
 {certificate_authorities,
     [{rdnSequence,
          [[{'AttributeTypeAndValue',
                {2,5,4,3},
                {utf8String,
                    <<"TLSGenSelfSignedtRootCA 2023-10-19T07:40:57.168316">>}}],
           [{'AttributeTypeAndValue',{2,5,4,7},{utf8String,<<"$$$$">>}}]]}]}]
writing (131 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 7e 0d 00 00  7a 03 40 01 02 00 22 08    ....~...z.@...".
0010 - 0b 08 0a 08 09 08 06 08  05 08 04 06 03 06 01 05    ................
0020 - 03 05 01 04 03 04 01 03  03 03 01 02 03 02 01 02    ................
0030 - 02 00 50 00 4e 30 4c 31  3b 30 39 06 03 55 04 03    ..P.N0L1;09..U..
0040 - 0c 32 54 4c 53 47 65 6e  53 65 6c 66 53 69 67 6e    .2TLSGenSelfSign
0050 - 65 64 74 52 6f 6f 74 43  41 20 32 30 32 33 2d 31    edtRootCA 2023-1
0060 - 30 2d 31 39 54 30 37 3a  34 30 3a 35 37 2e 31 36    0-19T07:40:57.16
0070 - 38 33 31 36 31 0d 30 0b  06 03 55 04 07 0c 04 24    83161.0...U....$
0080 - 24 24 24                                            $$$
>>> Handshake, ServerHelloDone
[]
writing (9 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 04 0e 00 00  00                         .........
reading (82 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 4d 0b 00 00  03 00 00 00 10 00 00 42    ....M..........B
0010 - 41 04 2e b9 1f ae a7 b1  ce d9 c5 90 be 2e d2 a5    A...............
0020 - ca 3a ec 38 69 3c 94 b3  13 f1 d9 93 54 a7 dc 3c    .:.8i<......T..<
0030 - 77 67 dd 1a 98 39 00 24  02 02 9b 1d 5c b8 0d 3c    wg...9.$....\..<
0040 - 70 c2 53 9d ce f1 10 73  cf f7 4b fc ff 0b 35 0d    p.S....s..K...5.
0050 - fd 06                                               ..
reading (6 bytes) TLS 1.2 Record Protocol, change_cipher_spec
0000 - 14 03 03 00 01 01                                   ......
reading (45 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 28 00 00 00  00 00 00 00 00 93 c9 1f    ....(...........
0010 - e0 7d 92 82 de 50 5c 41  d9 55 c3 78 b8 35 ff db    .}...P\A.U.x.5..
0020 - cc 33 84 81 13 2f df 35  e1 35 e9 e2 e3             .3.../.5.5...
<<< Handshake, Certificate
[{asn1_certificates,[]}]
<<< Handshake, ClientKeyExchange
[{exchange_keys,<<65,4,46,185,31,174,167,177,206,217,197,144,190,46,210,165,
                  202,58,236,56,105,60,148,179,19,241,217,147,84,167,220,60,
                  119,103,221,26,152,57,0,36,2,2,155,29,92,184,13,60,112,194,
                  83,157,206,241,16,115,207,247,75,252,255,11,53,13,253,6>>}]
<<< Handshake, Finished
[{verify_data,<<144,189,99,116,20,128,62,43,210,254,26,107>>}]
writing (6 bytes) TLS 1.2 Record Protocol, change_cipher_spec
0000 - 14 03 03 00 01 01                                   ......
>>> Handshake, Finished
[{verify_data,<<123,209,11,61,190,117,3,50,172,102,198,80>>}]
writing (45 bytes) TLS 1.2 Record Protocol, handshake
0000 - 16 03 03 00 28 43 2a ca  d0 6a 29 56 18 3c 14 7d    ....(C*..j)V.<.}
0010 - cd 1a df 1f 8f c1 90 99  9c bd 33 34 ed 49 d9 bb    ..........34.I..
0020 - fa b5 18 23 bb dd f8 61  62 3c 9b 47 4f             ...#...ab<.GO
reading (56 bytes) TLS 1.2 Record Protocol, application_data
0000 - 17 03 03 00 33 00 00 00  00 00 00 00 01 a8 9b be    ....3...........
0010 - 39 64 e6 f2 75 98 03 7a  1f 47 5d 86 07 66 d4 72    9d..u..z.G]..f.r
0020 - bc 15 18 29 3a 1e 66 ef  6e ec 8d 4d 8f c9 81 36    ...):.f.n..M...6
0030 - b3 24 67 47 e2 23 1a ce                             .$gG.#..
[INFO] top of loop/2
[INFO] Data: {ssl,{sslsocket,{gen_tcp,#Port<0.4>,tls_connection,
                                      [{option_tracker,<0.106.0>},
                                       {session_tickets_tracker,disabled},
                                       {session_id_tracker,<0.107.0>}]},
                             [<0.110.0>,<0.109.0>]},
                  "Hello from the client.<EOF>"}
[INFO] top of loop/2
[INFO] shutdown/close socket
[INFO] before ssl:transport_accept

```


### .NET Client Output

```
PS C:\Users\vagrant\rabbitmq-users-X9VRDGdn5HU\cs> dotnet run
[INFO] servername: localhost
[INFO] client connected to 'localhost:4433'
PS C:\Users\vagrant\rabbitmq-users-X9VRDGdn5HU\cs>
```

# Windows Version

![`winver` screenshot](windows-version.png)
