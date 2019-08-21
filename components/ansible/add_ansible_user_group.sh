#!/usr/bin/env bash

set -e

# create ansible user and group
useradd ansible -U -s /bin/bash  -m

cat /etc/passwd | grep ansible
cat /etc/group | grep ansible

# change passwd
passwd ansible

