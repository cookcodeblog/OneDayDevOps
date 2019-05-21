#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

../../components/utils/open_firewall_port.sh 9000

mkdir -p /opt/sonarqube

cp docker-compose.yml /opt/sonarqube

cd /opt/sonarqube
docker-compose up -d
