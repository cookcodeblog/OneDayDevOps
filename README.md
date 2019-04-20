[TOC]

# OneDayDevOps

Build a DevOps platform in one day using open source components



## Install Git

```bash
yum install git
git --version
```

## Clone OneDayDevOps
```bash
git clone https://github.com/cookcodeblog/OneDayDevOps.git
cd OneDayDevOps
chmod -R u+x *.sh
```



## Use Aliyun Yum repo

```bash
cd components/aliyun
./use_aliyun_yum_repo.sh
```



## Install OpenJDK8

```bash
cd components/openjdk8
./install_openjdk8.sh
```

## Install Jenkins

> Make sure OpenJDK8 is installed

Install Jenkins by Jenkins Yum repo:

```bash
cd components/jenkins
./install_jenkins.sh
```

Install Jenkins by Jenkins mirror:

```bash
cd components/jenkins
./install_jenkins_rpm.sh
```