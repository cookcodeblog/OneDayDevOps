#!/usr/bin/env bash

set -e

./install_ntp.sh

# Current time
timedatectl

# Set time zone
timedatectl set-timezone Asia/Shanghai

# Enable ntp time sync
timedatectl set-ntp yes

# Use local RTC time
timedatectl set-local-rtc 1

# Enable and start ntpd service
yum install ntp -y
systemctl enable ntpd
systemctl start ntpd

# Verify ntp sync status
netstat -nupl | grep 123
ntpq -p
ntpstat

# Current time
date -R

timedatectl