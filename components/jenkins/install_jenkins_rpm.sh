#!/usr/bin/env bash

RPM_PACKAGE=jenkins-2.164.2-1.1.noarch.rpm
JENKINS_MIRROR_URL=https://mirrors.tuna.tsinghua.edu.cn

wget $JENKINS_MIRROR_URL/jenkins/redhat-stable/$RPM_PACKAGE
rpm -ivh $RPM_PACKAGE

./utils/start_service.sh jenkins

./utils/open_firewall.sh 8080

echo "Jenkins URL: http://$(./utils/get_ip.sh):8080"

echo "Jenkins initial admin password: $(more /var/lib/jenkins/secrets/initialAdminPassword)"

echo "Please open Jenkins in browser and input initial password to continue configuration"
