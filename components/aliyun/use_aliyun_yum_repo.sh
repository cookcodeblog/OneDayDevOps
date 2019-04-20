#!/usr/bin/env bash

curl -o /etc/yum.repos.d/CentOS7-Aliyun.repo https://github.com/cookcodeblog/OneDayDevOps/blob/master/CentOS7-Aliyun.repo

yum clean all
yum makecache

yum repolist all
