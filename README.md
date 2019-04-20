[TOC]

# OneDayDevOps

Build a DevOps platform in one day using open source components

Blog: [OneDayDevOps: One click deploy a DevOps platform](https://blog.csdn.net/nklinsirui/article/details/89416151)

## Get started

### Install Git

```bash
yum install git -y
git --version
```

### Clone OneDayDevOps

Run below commands on an empty directory:
```bash
git clone https://github.com/cookcodeblog/OneDayDevOps.git
cd OneDayDevOps
find . -name '*.sh' -exec chmod u+x {} \;
```



### Use Aliyun Yum repo

```bash
./components/aliyun/use_aliyun_yum_repo.sh
```



### Install tools

Install some basic tools, e.g. wget, vim, etc.

```bash
./components/tools/install_tools.sh
```

### Install OpenJDK8

```bash
./components/openjdk8/install_openjdk8.sh
```

## Install Jenkins

> Make sure OpenJDK8 is installed

Install Jenkins by Jenkins Yum repo:

```bash
./components/jenkins/install_jenkins.sh
```

Or install Jenkins by Jenkins mirror:

```bash
./components/jenkins/install_jenkins_rpm.sh
```



## Install GitLab CE

Install GitLab CE with HTTP:

```bash
./components/gitlab/install_gitlab_ce_http.sh
```

