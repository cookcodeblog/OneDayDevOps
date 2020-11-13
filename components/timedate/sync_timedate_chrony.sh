#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

./install_ntp.sh

# Current time
timedatectl

# Set time zone
timedatectl set-timezone Asia/Shanghai

# Enable ntp time sync
timedatectl set-ntp yes

# Use local RTC time
timedatectl set-local-rtc 1

# Enable and start chronyd service
yum install chrony -y
systemctl enable chronyd
systemctl start chronyd

# Verify ntp sync status
netstat -nupl | grep 323
chronyc sources
chronyc tracking

# Current time
date -R

timedatectl