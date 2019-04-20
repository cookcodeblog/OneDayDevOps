#!/usr/bin/env bash

curl -o /etc/yum.repos.d/gitlab-ce-tsinghua.repo https://raw.githubusercontent.com/cookcodeblog/OneDayDevOps/master/components/tsinghua/gitlab-ce-tsinghua.repo

yum clean all
yum makecache

yum repolist all
