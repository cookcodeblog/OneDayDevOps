#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi



cd ../downloads/harbor
tar xvf harbor-offline-installer-*.tgz
mv harbor /opt

cd /opt/harbor

echo "Please edit harbor.cfg and then install Harbor"
