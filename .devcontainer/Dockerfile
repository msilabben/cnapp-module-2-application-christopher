FROM mcr.microsoft.com/devcontainers/python:1-3.11-bullseye

RUN pipx install pre-commit

USER root

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN az config set core.collect_telemetry=no

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN kubectl version --client

USER vscode


