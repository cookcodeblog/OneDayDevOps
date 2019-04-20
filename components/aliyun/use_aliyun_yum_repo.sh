#!/usr/bin/env bash

curl -o /etc/yum.repos.d/CentOS7-Aliyun.repo https://raw.githubusercontent.com/cookcodeblog/OneDayDevOps/master/components/aliyun/CentOS7-Aliyun.repo

yum clean all
yum makecache

yum repolist all
