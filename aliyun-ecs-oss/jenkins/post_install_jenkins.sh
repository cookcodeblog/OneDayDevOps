#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi


../utils/start_service.sh jenkins

../utils/open_firewall_port.sh 8080

echo "Jenkins URL: http://$(../utils/get_ip.sh):8080"

# wait 1 minute until Jenkins is ready
sleep 60
echo "Jenkins initial admin password: $(more /var/lib/jenkins/secrets/initialAdminPassword)"

echo "Please open Jenkins in browser and input initial password to continue configuration"
