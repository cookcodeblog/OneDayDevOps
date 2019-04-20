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

# Change as your GitLab URL
GITLAB_URL="http://gitlab.xdevops.cn"
EXTERNAL_URL="${GITLAB_URL}" yum install -y gitlab-ce

../utils/open_firewall_port.sh 80

echo "GitLab URL: ${GITLAB_URL}"
echo "Please open GitLab in browser and reset password to continue configuration"

