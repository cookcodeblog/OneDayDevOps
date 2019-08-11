#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

DOCKER_GROUP="$(grep docker /etc/group)"
if [ -z "$DOCKER_GROUP" ] ; then
    sudo groupadd docker
fi


systemctl restart docker

USERNAME=$1
gpasswd -a $USERNAME docker

grep docker /etc/group


