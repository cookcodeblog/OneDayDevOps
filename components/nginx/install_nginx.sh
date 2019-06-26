#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# install nginx
yum install nginx -y

../utils/start_service.sh nginx

../utils/open_firewall_service.sh http
../utils/open_firewall_service.sh https







