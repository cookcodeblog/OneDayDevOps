#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi


# Download and install
MAJOR_VERSION="$1"
if [ ! -n "${VERSION}" ]; then
    MAJOR_VERSION="1.8"
fi

MINOR_VERSION="$2"
if [ ! -n "${MINOR_VERSION}" ]; then
    MINOR_VERSION="0"
fi

HTTP_PORT="$3"
if [ ! -n "${HTTP_PORT}" ]; then
    HTTP_PORT="80"
fi

VERSION="${MAJOR_VERSION}.${MINOR_VERSION}"
RELEASE_PATH="release-${MAJOR_VERSION}.0"

HARBOR_PACKAGE="harbor-offline-installer-v${VERSION}.tgz"

wget https://storage.googleapis.com/harbor-releases/${RELEASE_PATH}/${HARBOR_PACKAGE}

tar xvf ${HARBOR_PACKAGE}
mv harbor /opt


HOST_NAME=$(../../components/utils/get_ip.sh)
../../components/utils/replace_in_file.sh /opt/harbor/harbor.yml "hostname: reg.mydomain.com" "hostname: ${HOST_NAME}"
../../components/utils/replace_in_file.sh /opt/harbor/harbor.yml "port: 80" "port: ${HTTP_PORT}"


cd /opt/harbor && sudo ./install.sh

echo "Harbor URL: http://${HOST_NAME}"

# Harbor will be auto restarted by docker-compose when reboot server
# So don't need add Harbor into `systemd` service