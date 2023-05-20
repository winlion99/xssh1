#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

wget https://github.com/ginuerzh/gost/releases/download/v2.11.2/gost-linux-amd64-2.11.2.gz && 
gzip -d gost-linux-amd64-2.11.2.gz && 
mv gost-linux-amd64-2.11.2 haxhax && 
chmod 777 haxhax

nohup ./haxhax -L relay+wss://username:159159@:8081>/dev/null 2>&1 &

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log

