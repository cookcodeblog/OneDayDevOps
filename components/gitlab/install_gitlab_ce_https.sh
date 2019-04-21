#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

GITLAB_DOMAIN="$1"
SSL_CERT_SUBJ="$2"

yum install -y curl policycoreutils-python openssh-server

../utils/start_service.sh sshd

../tsinghua/use_tsinghua_gitlab_repo.sh

GITLAB_URL="https://${GITLAB_DOMAIN}"
EXTERNAL_URL="${GITLAB_URL}" yum install -y gitlab-ce

../utils/open_firewall_port.sh 80

echo "$(../utils/get_ip.sh) ${GITLAB_DOMAIN}" >> /etc/hosts

./configure_gitlab_ce_manual_ssl.sh "${GITLAB_DOMAIN}" "${SSL_CERT_SUBJ}"

./post_install_gitlab.sh "${GITLAB_URL}"
