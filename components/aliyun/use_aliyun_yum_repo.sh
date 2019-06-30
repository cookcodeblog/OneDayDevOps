#!/usr/bin/env bash

set -e

curl -o /etc/yum.repos.d/CentOS7-Aliyun.repo https://raw.githubusercontent.com/cookcodeblog/OneDayDevOps/master/components/aliyun/CentOS7-Aliyun.repo
curl -o /etc/yum.repos.d/epel-7-Aliyun.repo https://raw.githubusercontent.com/cookcodeblog/OneDayDevOps/master/components/aliyun/epel-7-Aliyun.repo

yum clean all
yum makecache

yum repolist all
