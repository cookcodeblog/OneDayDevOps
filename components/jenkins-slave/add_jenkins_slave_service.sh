#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

sudo useradd jenkins -U -s /bin/bash -d /var/lib/jenkins -m

cp ./jenkins_slave.sh /var/lib/jenkins

chown jenkins:jenkins -R /var/lib/jenkins

chmod +x /var/lib/jenkins/jenkins_slave.sh


cat > /etc/systemd/system/jenkins.service <<EOF
[Unit]
Description=jenkins service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/var/lib/jenkins/jenkins_slave.sh start
ExecStop=/var/lib/jenkins/jenkins_slave.sh stop
User=jenkins
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF


systemctl daemon-reload
