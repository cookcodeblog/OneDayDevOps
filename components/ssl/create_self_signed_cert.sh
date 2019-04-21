#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Generate RSA private key
openssl genrsa -des3 -passout pass:x -out server.pass.key 2048

# Remove password in the private key
openssl rsa -passin pass:x -in server.pass.key -out server.key
rm -f server.pass.key

# Generate CSR sign request
SUBJ="$1"
openssl req -new -key server.key -out server.csr -subj "$SUBJ"

# Generate CRT signed cert
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
