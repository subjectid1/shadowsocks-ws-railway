#!/bin/sh

sudo  ss-server \
  -s ${SS_SERVER_ADDR} \
  -p ${PORT:-443} \
  -k ${SS_PASSWORD} \
  -m ${SS_METHOD} \
  --plugin ${SS_PLUGIN} \
  --plugin-opts ${SS_PLUGIN_OPTS}
