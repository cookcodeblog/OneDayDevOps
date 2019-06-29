#!/usr/bin/env bash

set -e

rpm -qa | grep ntp

yum install ntp -y

rpm -qa | grep ntp

systemctl enable ntpd
systemctl start ntpd
systemctl status ntpd

