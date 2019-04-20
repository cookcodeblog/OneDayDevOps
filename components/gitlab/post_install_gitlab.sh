#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

GITLAB_URL="$1"

echo "GitLab URL: ${GITLAB_URL}"
echo "Check GitLab version and Help document: ${GITLAB_URL}/help"
echo "Please open GitLab in browser and reset password to continue configuration"
echo "Default GitLab admin account: root"
echo "You may need update local hosts file firstly:"
echo "Mac: https://www.tekrevue.com/tip/edit-hosts-file-mac-os-x/"
echo "Windows: https://www.techwalla.com/articles/how-to-edit-your-windows-hosts-file"

