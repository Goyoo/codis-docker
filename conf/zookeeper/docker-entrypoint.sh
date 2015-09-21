#!/bin/bash
set -e

if [ $myid ]
then
    echo set to be server.$myid
else
    echo 'please set serverId with docker -e myid=xxx'
    exit -1
fi

if [ $zoogroup ]
then
    zoogroup=${zoogroup//,/ }
    echo get server group $zoogroup
else
    echo 'please set serverHost with docker -e zoogroup=xxx,xxx,xxx'
    exit -1
fi

#set myid
echo ${myid:-1} > /data/zookeeper/myid

#set zoo.cfg
count=1
for ele in $zoogroup
do
    echo server.$count=zoo-$count:2182:2183 >> /usr/local/zookeeper-3.4.6/conf/zoo.cfg
    let count=count+1
done

#set host
hostCount=1
for ele in $zoogroup
do
    if [ $hostCount == $myid ]
    then
        echo 0.0.0.0  zoo-$hostCount >> /etc/hosts
    else
        echo $ele  zoo-$hostCount >> /etc/hosts
    fi
    let hostCount=hostCount+1
done
#sleep 1000000s
zkServer.sh start-foreground
