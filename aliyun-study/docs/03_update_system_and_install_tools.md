[TOC]

# 更新系统、安装必要的工具和同步时间


## 设置主机名

```bash
hostnamectl set-hostname  <hostname>
```


## 更新系统

```bash
# 在首次使用系统前，更新软件包和操作系统内核
yum update -y
```



> 阿里云ECS服务器缺省已经配置好Yum repo源



## 安装工具

```bash
./components/tools/install_tools.sh
```



## 同步时间

```bash
./components/timedate/sync_timedate_chrony.sh
```



> 阿里云ECS服务器缺省已经开启chrony时间同步

