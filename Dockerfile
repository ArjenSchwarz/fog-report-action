FROM debian:bullseye-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://github.com/ArjenSchwarz/fog/releases/download/1.7.0/fog-1.7.0-linux-amd64.tar.gz -O fog.tar.gz && \
    tar xzf fog.tar.gz && \
    mv fog /usr/sbin/ && \
    rm fog.tar.gz && \
    /usr/sbin/fog version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]