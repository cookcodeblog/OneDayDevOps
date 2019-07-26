#!/bin/sh

JENKINS_HOME=/var/lib/jenkins
JENKINS_URL=http://192.168.87.151:8080
JENKINS_NODE_NAME=linux-node1
JENKINS_NODE_SECRET=59f8ab35a33944b1279a5fd25892c16cadb4298bba352d3e1283cf272ba21c27

return_code=0
case "$1" in
    start)
        echo "Starting Jenkins slave"

        nohup java -jar ${JENKINS_HOME}/agent.jar \
          -jnlpUrl ${JENKINS_URL}/computer/${JENKINS_NODE_NAME}/slave-agent.jnlp \
          -secret ${JENKINS_NODE_SECRET} \
          -workDir "${JENKINS_HOME}" > /dev/null 2>&1 &
        return_code=$?


    ;;
    stop)
        echo "Stopping Jenkins slave"

        ps -ef | grep jenkins | grep agent | grep -v grep | awk '{print $2}' | xargs kill -9
        return_code=$?

esac

exit $return_code
