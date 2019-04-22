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

# Download and install Gradle
VERSION="$1"
if [ ! -n "${VERSION}" ]; then
    VERSION="5.4"
fi

GRADLE_VERSION="gradle-${VERSION}"

GRADLE_PACKAGE="${GRADLE_VERSION}-bin.zip"
wget https://services.gradle.org/distributions/${GRADLE_PACKAGE}

unzip ${GRADLE_PACKAGE}

mv ${GRADLE_VERSION} /opt

chown -R root:root /opt/${GRADLE_VERSION}

ln -s /opt/${GRADLE_VERSION} /opt/gradle

# Set PATH system variable

cat > /etc/profile.d/gradle.sh <<EOF
export GRADLE_HOME=/opt/gradle
export PATH=\$PATH:\$GRADLE_HOME/bin
EOF

source /etc/profile.d/gradle.sh

# Check Gradle
gradle -v





