#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi


tar xvf /downloads/packages/harbor/harbor-offline-installer-*.tgz
mv /downloads/packages/harbor /opt



HOST_NAME=$(../../components/utils/get_ip.sh)
../../components/utils/replace_in_file.sh /opt/harbor/harbor.cfg "hostname = reg.mydomain.com" "hostname = ${HOST_NAME}"

cd /opt/harbor && sudo ./install.sh

echo "Harbor URL: http://${HOST_NAME}"

# Harbor will be auto restarted by docker-compose when reboot server
# So don't need add Harbor into `systemd` service
