#!/usr/bin/python3

import argparse
import socket

import scapy.layers.tls.crypto.suites
import scapy.layers.tls.extensions
import scapy.layers.tls.handshake
import scapy.layers.tls.record

# Parse command-line arguments
parser = argparse.ArgumentParser(
    description="Send a TLS 1.2 ClientHello to a server and decode the response."
)
parser.add_argument("server", help="the server to connect to")
parser.add_argument("port", type=int, help="the port to connect to")
args = parser.parse_args()

# Create a TCP socket and connect to the server
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# The cipher that gets negotiated from Windows client's ClientHello to server with TLS 1.3 disabled
min_cipher = [scapy.layers.tls.crypto.suites.TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, 0x00FF]

extensions = [
    #    TLS_Ext_ServerName(servernames=ServerName(servername=args.server)),
    #    TLS_Ext_SupportedPointFormat(ecpl=[0,1,2]), # openssl sends 3
    #    TLS_Ext_SupportedEllipticCurves(groups=['x25519','secp256r1', 'x448', 'secp521r1', 'secp384r1']),
    #    TLS_Ext_SessionTicket(),
    #    TLS_Ext_EncryptThenMAC(),
    #    TLS_Ext_ExtendedMasterSecret(),# extended_master_secret
    scapy.layers.tls.extensions.TLS_Ext_SignatureAlgorithms(
        sig_algs=[
            "sha256+ecdsa",
            "sha384+ecdsa",
            "sha512+ecdsa",
            "ed25519",
            "ed448",
            0x0809, #"sha256+rsapss",
            0x080a, #"sha384+rsapss",
            0x080b, #"sha512+rsapss",
            # One of the next 3 must be present for the handshake to succeed on Erlang 26 with TLS 1.3 also enabled
            #"sha256+rsaepss",
            #"sha384+rsaepss",
            #"sha512+rsaepss",
            "sha256+rsa",
            "sha384+rsa",
            "sha512+rsa",
            "sha224+ecdsa",
            "sha224+rsa",
            "sha224+dsa",
            "sha256+dsa",
            "sha384+dsa",
            "sha512+dsa",
        ]
    )
]

sock.connect((args.server, args.port))

hello = scapy.layers.tls.handshake.TLSClientHello(version="TLS 1.2", ciphers=min_cipher, ext=extensions)

# Create a TLS ClientHello packet
ch = scapy.layers.tls.record.TLS(version="TLS 1.2", msg=hello)

ch.show()

# Send the packet to the server
sock.sendall(bytes(ch))

# Receive the response from the server
response = sock.recv(4096)
sock.close()

# Parse the response as a TLS packet
tls_packet = scapy.layers.tls.record.TLS(response)

# Print the parsed packet
tls_packet.show()

if scapy.layers.tls.record.TLSAlert in tls_packet:
    print("FAIL: Alert received")

elif scapy.layers.tls.handshake.TLSServerHello in tls_packet:
    print("SUCCESS: ServerHello")

input('Hit any key to exit...')

