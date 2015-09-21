#!/bin/bash
set -e

/bin/bash /project/config-setting.sh

if [ $PROXY_IP ]
then
    echo "[INFO] PROXY_IP: $PROXY_IP"
else
    echo "[ERROR]please set PROXY_IP Env with docker -e PROXY_IP=xxx"
    exit -1
fi

if [ $PROXY_ADDR ]
then
    echo "[INFO] PROXY_ADDR: $PROXY_ADDR"
else
    echo "[ERROR]please set PROXY_ADDR Env with docker -e PROXY_ADDR=xxx"
    exit -1
fi

if [ $PROXY_HTTP_ADDR ]
then
    echo "[INFO] PROXY_HTTP_ADDR: $PROXY_HTTP_ADDR"
else
    echo "[ERROR]please set PROXY_HTTP_ADDR Env with docker -e PROXY_HTTP_ADDR=xxx"
    exit -1
fi

if [ $CPU ]
then
    echo "[INFO] use CPU number: $CPU"
else
    CPU=1
    echo "[INFO]default proxy use $CPU cpu. set please use -e CPU=number"
fi

cd $GOPATH/src/github.com/wandoulabs/codis/bin
./codis-proxy -c /etc/codis/config.ini   --cpu=$CPU --addr=$PROXY_IP:$PROXY_ADDR --http-addr=$PROXY_IP:$PROXY_HTTP_ADDR