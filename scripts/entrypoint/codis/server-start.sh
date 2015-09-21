#!/bin/bash
# DIR MAXMEMORY SAVEDB
set -e

mv /project/redis.default.conf /etc/codis/redis.conf

if [ $MAXMEMORY ]
then
    sed -i "s/#MAXMEMORY#/maxmemory $MAXMEMORY/g" /etc/codis/redis.conf
    echo "[INFO] MAXMEMORY: $MAXMEMORY"
else
    echo '[INFO]maxmemory no limit'
fi


if [ $SAVEDB ]
then
    sed -i "s/SAVEDB/$SAVEDB/g" /etc/codis/redis.conf
    echo "[INFO] SAVEDB: $SAVEDB"
else
    echo '[INFO]redis start without Persistence'
fi

if [ $DIR ]
then
    sed -i "s/#DIR#/$DIR/g" /etc/codis/redis.conf
    echo "[INFO] DIR: $DIR"
else
    sed -i "s/#DIR#/.\//g" /etc/codis/redis.conf
    echo "[INFO] DIR: ./"
fi

$GOPATH/src/github.com/wandoulabs/codis/bin/codis-server /etc/codis/redis.conf