#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Instll nodejs and npm
sudo yum install epel-release -y
sudo yum install nodejs
node -v
sudo yum install npm -y
npm -v



# Use Taobao npm registry
npm config set registry http://r.cnpmjs.org/
npm config get registry
