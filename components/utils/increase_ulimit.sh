#!/usr/bin/env bash

set -e

# https://access.redhat.com/solutions/61334
# https://blog.csdn.net/duanbiren123/article/details/80190750

ulimit -u unlimited
ulimit -n 65535

cp -p /etc/security/limits.conf /etc/security/limits.conf.bak$(date '+%Y%m%d%H%M%S')

cat <<EOF >> /etc/security/limits.conf
root soft nofile 65535
root hard nofile 65535
* soft nofile 65535
* hard nofile 65535
EOF

