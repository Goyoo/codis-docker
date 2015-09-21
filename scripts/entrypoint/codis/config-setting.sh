#!/bin/bash
set -e
#COORDINATOR  DB_ADDR DASHBOARD_ADDR PROXY_ID

if [ $COORDINATOR ]
then
    sed -i "s/#COORDINATOR#/$COORDINATOR/g" /etc/codis/config.ini
    echo "[INFO] COORDINATOR: $COORDINATOR"
else
    echo '[ERROR]please set COORDINATOR Env with docker -e COORDINATOR=xxx'
    exit -1
fi


if [ $DB_ADDR ]
then
    sed -i "s/#DB_ADDR#/$DB_ADDR/g" /etc/codis/config.ini
    echo "[INFO] DB_ADDR: $DB_ADDR"
else
    echo '[ERROR]please set DB_ADDR Env with docker -e DB_ADDR=xxx'
    exit -1
fi


if [ $DASHBOARD_ADDR ]
then
    sed -i "s/#DASHBOARD_ADDR#/$DASHBOARD_ADDR/g" /etc/codis/config.ini
    echo "[INFO] DASHBOARD_ADDR: $DASHBOARD_ADDR"
else
    echo '[ERROR]please set DASHBOARD_ADDR Env with docker -e DASHBOARD_ADDR=xxx'
    exit -1
fi

if [ $PROXY_ID ]
then
    sed -i "s/#PROXY_ID#/$PROXY_ID/g" /etc/codis/config.ini
    echo "[INFO] PROXY_ID: $PROXY_ID"
else
    echo '[ERROR]please set PROXY_ID Env with docker -e PROXY_ID=number'
    exit -1
fi

if [ $PRODUCTNAME ]
then
    sed -i "s/#PRODUCTNAME#/$PRODUCTNAME/g" /etc/codis/config.ini
    echo "[INFO] PRODUCTNAME: $PRODUCTNAME"
else
    echo '[ERROR]please set PRODUCTNAME Env with docker -e PRODUCTNAME=name'
    exit -1
fi