#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Check if JDK is installed
../../components/utils/determine_java.sh

rpm -ivh /downloads/packages/jenkins/jenkins*.rpm

./post_install_jenkins.sh