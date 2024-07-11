FROM jenkins/jenkins
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
USER root
# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apt-get update --fix-missing \
    && apt-get install -qqy apt-transport-https ca-certificates curl dnsutils gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker.io -y
RUN usermod -aG docker jenkins
RUN apt-get clean
RUN curl -L "https://github.com/docker/compose/releases/download/2.28.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
USER jenkins
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
