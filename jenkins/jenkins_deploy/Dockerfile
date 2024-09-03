FROM jenkins/jenkins

# Environment variables for Jenkins user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Use root to install dependencies and set permissions
USER root

# Skip initial Jenkins setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install necessary packages
RUN apt-get update --fix-missing \
    && apt-get install -qqy apt-transport-https ca-certificates curl dnsutils gnupg2 software-properties-common python3
# Create a symlink to ensure `python` points to `python3`
RUN ln -s /usr/bin/python3 /usr/bin/python

# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repository
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Install Docker
RUN apt-get update -qq \
    && apt-get install docker.io -y

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins
RUN usermod -aG root jenkins

# Clean up APT cache
RUN apt-get clean

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/2.28.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Copy plugins file and entrypoint script
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Install Jenkins plugins
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Switch back to Jenkins user
USER jenkins

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
