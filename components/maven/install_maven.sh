#!/usr/bin/env bash

set -e

# Locate shell script path
SCRIPT_DIR=$(dirname $0)
if [ ${SCRIPT_DIR} != '.' ]
then
  cd ${SCRIPT_DIR}
fi

# Check if JDK is installed
../utils/determine_java.sh

# Download and install Maven
VERSION="$1"
if [ ! -n "${VERSION}" ]; then
    VERSION="3.6.0"
fi

MAVEN_VERSION="apache-maven-${VERSION}"
MAVEN_PACKAGE="${MAVEN_VERSION}-bin.tar.gz"

# Maven mirrors:
# http://maven.apache.org/download.cgi
MAVEN_MIRROR_URL="http://mirrors.tuna.tsinghua.edu.cn/apache"
wget ${MAVEN_MIRROR_URL}/maven/maven-3/${VERSION}/binaries/${MAVEN_PACKAGE}

tar -zxvf ${MAVEN_PACKAGE}

mv ${MAVEN_VERSION} /opt

chown -R root:root /opt/${MAVEN_VERSION}

ln -s /opt/${MAVEN_VERSION} /opt/apache-maven

# Set PATH system variable
cat > /etc/profile.d/maven.sh <<EOF
export M2_HOME=/opt/apache-maven
export PATH=\$PATH:\$M2_HOME/bin
EOF

source /etc/profile.d/maven.sh


# Check Maven
mvn -version
