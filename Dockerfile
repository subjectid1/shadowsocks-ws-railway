FROM debian:bullseye-slim

RUN apt update && \
    apt install -y shadowsocks-libev v2ray-plugin && \
    apt clean

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

