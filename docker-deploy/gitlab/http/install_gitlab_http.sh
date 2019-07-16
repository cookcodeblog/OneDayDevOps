#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi


# Open ports on Firewall
firewall-cmd --list-all

firewall-cmd --zone=public --add-port=30080/tcp
firewall-cmd --zone=public --add-port=30080/tcp --permanent

firewall-cmd --zone=public --add-port=30022/tcp
firewall-cmd --zone=public --add-port=30022/tcp --permanent

firewall-cmd --reload
firewall-cmd --list-all

# Run GitLab with Docker Comose
docker-compose up -d
