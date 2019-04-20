#!/usr/bin/env bash

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

yum install -y curl policycoreutils-python openssh-server

../utils/start_service.sh sshd

../tsinghua/use_tsinghua_gitlab_repo.sh

EXTERNAL_URL="http://gitlab.xdevops.cn" yum install -y gitlab-ce

../utils/open_firewall_port.sh 80
