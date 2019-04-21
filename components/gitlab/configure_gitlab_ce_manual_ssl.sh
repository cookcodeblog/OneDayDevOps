#!/usr/bin/env bash
# References:
# https://docs.gitlab.com/omnibus/settings/nginx.html#enable-https
# Nginx Configuration:
# /var/opt/gitlab/nginx/conf/gitlab-http.conf

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

GITLAB_DOMAIN="$1"
SSL_CERT_SUBJ="$2"

../utils/open_firewall_port.sh 443

# Prepare self-signed SSL cert
../ssl/create_self_signed_cert.sh "${SSL_CERT_SUBJ}"

mkdir -p /etc/gitlab/ssl
chmod 700 /etc/gitlab/ssl

cp -f ../ssl/server.key /etc/gitlab/ssl/"${GITLAB_DOMAIN}.key"
cp -f ../ssl/server.crt /etc/gitlab/ssl/"${GITLAB_DOMAIN}.crt"


# Backup GitLab configuration
cp -p /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.bak$(date '+%Y%m%d%H%M%S')

# Change external_url to https
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "external_url 'http:" "external_url 'https:"

# Redirect HTTP request to HTTPS in Nginx
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# nginx\['redirect_http_to_https'\] = false" "nginx\['redirect_http_to_https'\] = true"

# Re-configure GitLab
gitlab-ctl reconfigure


