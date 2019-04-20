#!/usr/bin/env bash

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum clean all
yum makecache

yum install jenkins -y

../utils/start_service.sh jenkins

../utils/open_firewall.sh 8080

echo "Jenkins URL: http://$(../utils/get_ip.sh):8080"

echo "Jenkins initial admin password: $(more /var/lib/jenkins/secrets/initialAdminPassword)"

echo "Please open Jenkins in browser and input initial password to continue configuration"
