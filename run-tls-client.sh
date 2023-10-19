#!/bin/sh

set -e
set -u

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
readonly script_dir

readonly arg_tls_version="${1:--tls1_3}"
readonly arg_tls_port="${2:-4433}"

openssl s_client $arg_tls_version -ign_eof -connect "localhost:$arg_tls_port" \
    -CAfile "$script_dir/certs/ca_certificate.pem" \
    -cert "$script_dir/certs/client_localhost_certificate.pem" \
    -key "$script_dir/certs/client_localhost_key.pem" -servername 'localhost'
