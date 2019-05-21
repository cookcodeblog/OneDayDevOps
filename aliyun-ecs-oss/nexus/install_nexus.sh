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


# Extract installaiton package, you can delete the package afer installed if necessary
cp /downloads/packages/nexus/nexus-3.16.1-02-unix.tar.gz /opt

tar -xvf /opt/nexus-3.16.1-02-unix.tar.gz

mv /opt/nexus-3.16.1-02 /opt/nexus

# Run Nexus with nexus account
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work

../../components/utils/replace_in_file.sh /opt/nexus/bin/nexus.rc "root" "nexus"

# Add Nexus into systemd service
./add_nexus_service.sh

../../components/utils/start_service.sh nexus

../../components/utils/open_firewall_port.sh 8081



