#!/usr/bin/env bash

set -e

yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

cat > /etc/profile.d/java8.sh <<EOF
export JAVA_HOME=\$(dirname \$(dirname \$(readlink \$(readlink \$(which javac)))))
export PATH=\$PATH:\$JAVA_HOME/bin
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
EOF

source /etc/profile.d/java8.sh

java -version
javac -version

echo $JAVA_HOME