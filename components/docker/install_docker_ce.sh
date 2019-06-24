#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum makecache fast

VERSION="$1"
if [ -n "$VERSION" ] ; then
    yum -y install docker-ce-"${VERSION}.ce"
else
    yum -y install docker-ce
fi

./post_install_docker.sh

../utils/start_service.sh docker

docker version
