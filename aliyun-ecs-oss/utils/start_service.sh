#!/usr/bin/env bash

set -e

SERVICE=$1

systemctl enable $SERVICE
systemctl start $SERVICE
systemctl status $SERVICE
