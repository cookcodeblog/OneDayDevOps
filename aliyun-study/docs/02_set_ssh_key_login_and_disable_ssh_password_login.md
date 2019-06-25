[TOC]

# 设置ssh key免密码登录和禁用服务器密码登录

## 设置ssh key免密码登录

1. 生成ssh公钥和私钥
2. 将ssh公钥内容添加到服务器`~/.ssh/authorized_keys` 文件末尾
3. 测试ssh免密码登录



## 禁用密码登录

1. 编辑`/etc/ssh/sshd_config`
2. 将`PasswordAuthentication`参数值修改为no： `PasswordAuthentication no`
3. 重启ssh服务：`systemctl restart sshd`
4. 测试禁用密码登录是否生效



## 参考文档

* [Xshell配置SSH秘钥登录](https://www.cnblogs.com/ioveNature/p/7919115.html)
* [Centos7禁用密码登录](<https://blog.csdn.net/dushu990/article/details/78834729> )
* [SecureCRT](https://blog.csdn.net/hgcpkclwcx/article/details/78929737)

  



