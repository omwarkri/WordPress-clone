FROM jenkins/jenkins:lts

USER root

# Install docker CLI
RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl gnupg2 lsb-release \
 && curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-24.0.2.tgz | tar xz -C /usr/local/bin --strip 1 docker/docker \
 && chmod +x /usr/local/bin/docker

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
  && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
  && rm kubectl

# Fix permissions for Jenkins user
RUN chown -R jenkins:jenkins /var/jenkins_home

USER jenkins
