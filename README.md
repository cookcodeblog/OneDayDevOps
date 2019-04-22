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



## Install Build Tools

### Install Gradle

```bash
# Install default Gradle (Gradle5.4)
./components/gradle/install_gradle.sh

# Install sepecific Gradle version
# Example: ./components/gradle/install_gradle.sh gradle-4.6
./components/gradle/install_gradle.sh <gradle-version>
```



### Install Maven

```bash
# Install default Maven (Maven3.6.0)
./components/maven/install_maven.sh

# Install sepecific Maven version
# ./components/maven/install_maven.sh 3.5.0
./components/maven/install_maven.sh <version>
```



## Install GitLab CE

Install GitLab CE with HTTP:

```bash
# ./components/gitlab/install_gitlab_ce_http.sh gitlab.xdevops.cn
./components/gitlab/install_gitlab_ce_http.sh <gitlab_domain>
```



Install GitLab CE with HTTPS using manual SSL cert:

```bash
# ./components/gitlab/install_gitlab_ce_https.sh gitlab.xdevops.cn "/C=CN/ST=Guangdong/L=Guangzhou/O=xdevops/OU=xdevops/CN=gitlab.xdevops.cn"
./components/gitlab/install_gitlab_ce_https.sh <gitlab_domain> <ssl_cert_subj>
```



Configure HTTPS for an existing HTTP GitLab CE using manual SSL cert:

```bash
# Set domain name mapping in host file if necessary
# echo "$(./components/utils/get_ip.sh) gitlab.xdevops.cn" >> /etc/hosts
echo "$(./components/utils/get_ip.sh) <gitlab_domain>" >> /etc/hosts

# ./components/gitlab/configure_gitlab_ce_manual_ssl.sh gitlab.xdevops.cn "/C=CN/ST=Guangdong/L=Guangzhou/O=xdevops/OU=xdevops/CN=gitlab.xdevops.cn"
./components/gitlab/configure_gitlab_ce_manual_ssl.sh <gitlab_domain> <ssl_cert_subj>
```



> Even throuh GitLab integrate Letsencrypt natively, but I have encountered a Letsencrypt error when run `gitlab-ctl reconfigure` and haven't resolved it, so I have to use manual SSL cert at this moment.

