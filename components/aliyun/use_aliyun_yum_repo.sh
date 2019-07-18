#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

#curl -o /etc/yum.repos.d/CentOS7-Aliyun.repo https://raw.githubusercontent.com/cookcodeblog/OneDayDevOps/master/components/aliyun/CentOS7-Aliyun.repo
#curl -o /etc/yum.repos.d/epel-7-Aliyun.repo https://raw.githubusercontent.com/cookcodeblog/OneDayDevOps/master/components/aliyun/epel-7-Aliyun.repo

cp CentOS7-Aliyun.repo /etc/yum.repos.d/
cp epel-7-Aliyun.repo /etc/yum.repos.d/

yum clean all
yum makecache

yum repolist all
