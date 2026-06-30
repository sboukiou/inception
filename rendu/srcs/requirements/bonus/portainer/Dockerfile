FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    tar \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/portainer/portainer/releases/download/2.21.0/portainer-2.21.0-linux-amd64.tar.gz \
    && tar -xzf portainer-2.21.0-linux-amd64.tar.gz \
    && rm portainer-2.21.0-linux-amd64.tar.gz

EXPOSE 9443

ENTRYPOINT ["/portainer/portainer", "--data", "/var/lib/portainer"]

