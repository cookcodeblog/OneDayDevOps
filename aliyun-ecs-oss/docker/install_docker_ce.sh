#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi


yum install /downloads/packages/docker/docker*.rpm -y


../../components/utils/start_service.sh docker

docker version
