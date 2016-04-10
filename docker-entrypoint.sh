#!/bin/sh
#host_ip=127.0.0.1
#server_name=localhost
set -eo pipefail
if [ ! -z "$HOST_IP" ]; then
   sed -Ei "s/^host_ip\=(.*)/host_ip\=$HOST_IP/g" /config.txt
fi
exec "$@"
