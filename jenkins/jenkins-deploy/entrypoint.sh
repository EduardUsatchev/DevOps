#!/bin/sh

# Install plugins
if [ -f /usr/share/jenkins/plugins.txt ]; then
    jenkins-plugin-cli --plugins $(cat /usr/share/jenkins/plugins.txt)
fi

# Start Jenkins
exec /usr/local/bin/jenkins.sh "$@"
