#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log
ngrok tcp 8081 --log=stdout > ng.log
