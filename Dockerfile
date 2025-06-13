FROM alpine:latest

RUN apk add --no-cache shadowsocks-libev v2ray-plugin

ENV SS_SERVER_ADDR=0.0.0.0     SS_SERVER_PORT=PORT     SS_PASSWORD=superSecret123     SS_METHOD=aes-256-gcm     SS_PLUGIN=v2ray-plugin     SS_PLUGIN_OPTS="server;mode=websocket"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
