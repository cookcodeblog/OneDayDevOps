#!/usr/bin/env bash

set -e

PORT=$1

firewall-cmd --list-all

firewall-cmd --zone=public --add-port=$PORT/tcp
firewall-cmd --zone=public --add-port=$PORT/tcp --permanent

firewall-cmd --reload
firewall-cmd --list-all
