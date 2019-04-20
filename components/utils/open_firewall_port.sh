#!/usr/bin/env bash

PORT=$1

firewall-cmd --list-all

firewall-cmd --zone=public --add-port=$PORT/tcp
firewall-cmd --zone=public --add-port=$PORT/tcp --permanent

firewall-cmd --reload
