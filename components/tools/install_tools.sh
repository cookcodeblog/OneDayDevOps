#!/usr/bin/env bash

# Skip failed install tools

yum install wget -y
yum install vim -y
# netstat
yum install net-tools -y
# host
yum install bind-utils -y
# telnet
yum install telnet -y
# unizp
yum install unzip -y
# htop instead of top
yum install htop -y
# mtr
yum install mtr -y
# tree
yum install tree -y
