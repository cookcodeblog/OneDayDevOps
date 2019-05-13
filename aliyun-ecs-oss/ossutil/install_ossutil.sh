#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# https://help.aliyun.com/document_detail/50452.html
wget http://gosspublic.alicdn.com/ossutil/1.6.0/ossutil64
chmod 755 ossutil64

mv ossutil64 /usr/local/bin/ossutil
ln -s /usr/local/bin/ossutil /usr/bin/ossutil

# Configure ossutil
ossutil config

