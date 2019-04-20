#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

./install_gitlab_ce_http.sh

GITLAB_DOMAIN="$1"
./configure_gitlab_ce_https.sh "${GITLAB_DOMAIN}"
