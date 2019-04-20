#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

GITLAB_DOMAIN="$1"
CERT_RENEW_NOTIFY_EMAIL="$2"

./install_gitlab_ce_http.sh "${GITLAB_DOMAIN}"

./configure_gitlab_ce_https.sh "${CERT_RENEW_NOTIFY_EMAIL}"
