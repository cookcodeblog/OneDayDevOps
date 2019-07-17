
https://github.com/sameersbn/docker-gitlab


1. Replace values of below keys using `pwgen -Bsv1 64`

* `GITLAB_SECRETS_DB_KEY_BASE`
* `GITLAB_SECRETS_SECRET_KEY_BASE`
* `GITLAB_SECRETS_OTP_KEY_BASE`

> Run `yum install pwgen -y` to install `pwgen` firstly if it is not installed.

2. Set value of `GITLAB_HOST`

3. Set value of `password`

4. Set timezone `TZ` as `Asia/Shanghai` and GITLAB_TIMEZONE=`Beijing`
