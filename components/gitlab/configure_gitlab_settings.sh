#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Backup GitLab configuration
cp -p /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.bak$(date '+%Y%m%d%H%M%S')

# Configure Timezone
# https://gitlab.xdevops.cn/help/workflow/timezone.md
../utils/replace_in_file.sh /etc/gitlab/gitlab.rb "\# gitlab_rails\['time_zone'\] = 'UTC'" "gitlab_rails\['time_zone'\] = 'Asia\/Shanghai'"

# Enable GitLab Rack Attack if the GitLab is exposed in Internet
# https://gitlab.xdevops.cn/help/security/rack_attack.md
cat >> /etc/gitlab/gitlab.rb <<EOF
gitlab_rails['rack_attack_git_basic_auth'] = {
  'enabled' => true,
  'ip_whitelist' => ["127.0.0.1"],
  'maxretry' => 10, # Limit the number of Git HTTP authentication attempts per IP
  'findtime' => 60, # Reset the auth attempt counter per IP after 60 seconds
  'bantime' => 3600 # Ban an IP for one hour (3600s) after too many auth attempts
}
EOF

# Reconfigure and restart GitLab
gitlab-ctl reconfigure
gitlab-ctl restart



