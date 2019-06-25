#!/usr/bin/env bash

set -e

SERVICE=$1

firewall-cmd --list-all

firewall-cmd --zone=public --add-serive=$SERVICE
firewall-cmd --zone=public --add-port=$SERVICE --permanent

firewall-cmd --reload
firewall-cmd --list-all
