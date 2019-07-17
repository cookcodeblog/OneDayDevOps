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
../../components/utils/open_firewall_port.sh 10080
../../components/utils/open_firewall_port.sh 10022

# Run GitLab with Docker Compose
mkdir -p /opt/gitlab

cp docker-compose.yml /opt/gitlab

cd /opt/gitlab
docker-compose up -d

