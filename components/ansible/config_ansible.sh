#!/usr/bin/env bash

# Ansible config: https://docs.ansible.com/ansible/latest/installation_guide/intro_configuration.html#intro-configuration

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# backup
cp -p /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.bak$(date '+%Y%m%d%H%M%S')

# Disable host key checking
../utils/replace_in_file.sh /etc/ansible/ansible.cfg "\#host_key_checking = False" "host_key_checking = False"
ansible-config view | grep host_key_checking

# Increase forks, default is 5
FORKS="10"
../utils/replace_in_file.sh /etc/ansible/ansible.cfg "\#forks          = 5" "forks          = ${FORKS}"
ansible-config view | grep forks