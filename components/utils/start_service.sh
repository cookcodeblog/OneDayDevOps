#!/usr/bin/env bash

SERVICE=$1

systemctl enable $SERVICE
systemctl start $SERVICE
systemctl status $SERVICE
