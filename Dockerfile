FROM debian:bullseye-slim

RUN apt update && \
    apt install -y wget tar shadowsocks-libev && \
    wget -O /tmp/v2ray-plugin.tar.gz "https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.2/v2ray-plugin-linux-amd64-v1.3.2.tar.gz" && \
    mkdir -p /usr/local/bin/v2ray-plugin && \
    tar -xzvf /tmp/v2ray-plugin.tar.gz -C /usr/local/bin/v2ray-plugin --strip-components=1 && \
    ln -s /usr/local/bin/v2ray-plugin/v2ray-plugin /usr/bin/v2ray-plugin && \
    rm /tmp/v2ray-plugin.tar.gz && \
    apt clean

COPY entrypoint.sh /entrypoint.sh
USER root
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/ss-server"]
