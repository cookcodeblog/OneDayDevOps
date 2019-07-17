#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Increase ulimit
# ../../components/utils/increase_ulimit.sh

# Open ports on Firewall
../../components/utils/open_firewall_port.sh 8081

# Run Nexus with Docker Compose
# https://github.com/sonatype/docker-nexus3
mkdir -p /opt/nexus
cp docker-compose.yml /opt/nexus

# Create volumes
mkdir -p /srv/docker/nexus/nexus-data && chown -R 200 /srv/docker/nexus/nexus-data

cd /opt/nexus
docker-compose up -d

