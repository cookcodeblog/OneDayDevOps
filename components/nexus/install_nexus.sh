#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Check if JDK is installed
../../components/utils/determine_java.sh

VERSION="$1"
if [ ! -n "${VERSION}" ]; then
    VERSION="3.16.1-02"
fi

NEXUS_VERSION="nexus-${VERSION}"
NEXUS_PACKAGE="${NEXUS_VERSION}-unix.tar.gz"

wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/${NEXUS_PACKAGE}

tar -xvf ${NEXUS_PACKAGE}

mv ${NEXUS_VERSION} /opt/nexus
mv sonatype-work /opt/sonatype-work

# Run Nexus with nexus account
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work

../../components/utils/replace_in_file.sh /opt/nexus/bin/nexus.rc "root" "nexus"

# Add Nexus into systemd service
./add_nexus_service.sh

../../components/utils/start_service.sh nexus

../../components/utils/open_firewall_port.sh 8081



