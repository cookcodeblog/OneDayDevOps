#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

GITLAB_DOMAIN="$1"


yum install -y curl policycoreutils-python openssh-server

../../components/utils/start_service.sh sshd


# https://docs.gitlab.com/omnibus/manual_install.html

if [ -n "$GITLAB_DOMAIN" ] ; then
    GITLAB_URL="http://${GITLAB_DOMAIN}"
    EXTERNAL_URL="${GITLAB_URL}" rpm -ivh /downloads/packages/gitlab/gitlab*.rpm
else
    echo "Please input a Giltab domain,e.g. example.gitlab.com"
    exit 1
fi

../../components/utils/open_firewall_port.sh 80

./post_install_gitlab.sh "${GITLAB_URL}"
