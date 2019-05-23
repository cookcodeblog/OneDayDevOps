#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi



cd /opt/sonarqube

# Stop and remove containers
docker-compose down
docker-compose rm

# Remove volumes for clean install
rm -rf /srv/docker/sonarqube

# Install
docker-compose up -d