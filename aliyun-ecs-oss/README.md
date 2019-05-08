[TOC]



# Install DevOps platform using Aliyun ECS servers and OSS storage

## tools

## ossutil

https://help.aliyun.com/document_detail/50452.html?spm=a2c4g.11186623.2.10.11ca1144ACKSLs#concept-cnr-3d4-vdb

```bash
alias ossutil='/path/to/ossutilmac64'
```

## openjdk

Install openjdk by yum



## jenkins

Download:

https://mirrors.tuna.tsinghua.edu.cn/jenkins/redhat-stable/jenkins-2.164.2-1.1.noarch.rpm

Upload to Aliyun OSS storage:

```bash
ossutil cp -r ./jenkins/jenkin*rpm oss://xxx-oss/devops/jenkins/
```


Install same versioned Jenkins in an env with Internet, and install all required Jenkins plugins, and then copy `/var/lib/jenkins/plugins` folder to target env.
```bash
ossutil cp -r /var/lib/jenkins/plugins/ oss://xxx-oss/devops/jenkins/plugins/
```





## gitlab



Download:

<https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-11.10.4-ce.0.el7.x86_64.rpm>



Upload to Aliyun OSS storage:

```bash
ossutil cp -r ./gitlab/gitlab*rpm oss://xxx-oss/devops/gitlab/
```



## docker

Download:

<https://download.docker.com/linux/centos/7/x86_64/stable/Packages/>



Upload to Aliyun OSS storage:

```bash
ossutil cp -r ./docker/docker*rpm oss://xxx-oss/devops/docker/
```



## docker-compose



Download:

<https://github.com/docker/compose/releases>

https://github.com/docker/compose/releases/download/1.24.0/docker-compose-Linux-x86_64



Upload to Aliyun OSS storage:

```bash
ossutil cp -r ./docker/docker-compose* oss://xxx-oss/devops/docker/
```



## Harbor



Package:

<https://github.com/goharbor/harbor/releases>



Upload to Aliyun OSS storage:

```bash
ossutil cp -r ./harbor/harbor* oss://xxx-oss/devops/harbor/
```







