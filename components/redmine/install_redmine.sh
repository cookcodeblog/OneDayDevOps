#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

../../components/utils/open_firewall_port.sh 10083

mkdir -p /opt/redmine

cp docker-compose.yml /opt/redmine

cd /opt/redmine
docker-compose up -d
