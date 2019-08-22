#!/usr/bin/env bash

set -e

# Run this script on target machine

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys

chmod -R 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Add public key
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys

more ~/.ssh/authorized_keys

rm -f ~/id_rsa.pub

