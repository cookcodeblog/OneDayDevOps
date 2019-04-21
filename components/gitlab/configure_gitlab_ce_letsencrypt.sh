#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

../utils/open_firewall_port.sh 443

# Backup GitLab configuration
cp -p /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.bak$(date '+%Y%m%d%H%M%S')

# Change external_url to https
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "external_url 'http:" "external_url 'https:"

# Enable Letsencrypt
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['enable'\] = nil" "letsencrypt\['enable'\] = true"
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['enable'\] = false" "letsencrypt\['enable'\] = true"

# Configure certificate renew notification email
CERT_RENEW_NOTIFY_EMAIL="$1"
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['contact_emails'\] = \[\]" "letsencrypt\['contact_emails'\] = \[\'${CERT_RENEW_NOTIFY_EMAIL}\'\]"

# Auto renew certification
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['auto_renew'\] = true" "letsencrypt\['auto_renew'\] = true"

../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['auto_renew_hour'\] = 0" "letsencrypt\['auto_renew_hour'\] = 12"
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['auto_renew_minute'\] = nil" "letsencrypt\['auto_renew_minute'\] = 30"
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# letsencrypt\['auto_renew_day_of_month'\]" "letsencrypt\['auto_renew_day_of_month'\]"

# Re-configure GitLab
gitlab-ctl reconfigure


