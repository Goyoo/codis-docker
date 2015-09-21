buildBase:
	docker build -f dockerfile/Dockerfile.base -t dhub.yunpro.cn/kuizhi/codis-base .
buildProxy:
	docker build -f dockerfile/Dockerfile.proxy -t dhub.yunpro.cn/kuizhi/codis-proxy .
buildServer:
	docker build -f dockerfile/Dockerfile.server -t dhub.yunpro.cn/kuizhi/codis-server .
buildDashboard:
	docker build -f dockerfile/Dockerfile.dashboard -t dhub.yunpro.cn/kuizhi/codis-dashboard .
buildZookeeper:
	docker build -f dockerfile/Dockerfile.zooKeeper -t dhub.yunpro.cn/kuizhi/codis-zookeeper .


runDashboard:
	docker kill codis-dashboard && docker rm codis-dashboard && docker run -d --name=codis-dashboard -p 18087:18087 -e COORDINATOR=etcd -e DB_ADDR=10.12.1.105:2379 -e DASHBOARD_ADDR=10.12.1.101:18087 -e PROXY_ID=1 -e PRODUCTNAME=first dhub.yunpro.cn/kuizhi/codis-dashboard

initslot:
	docker exec codis-dashboard  /bin/bash -c "cd /go/src/github.com/wandoulabs/codis/bin && ./codis-config -c /etc/codis/config.ini slot init"

runServer:
	docker kill codis-server-1
	docker kill codis-server-2
	docker kill codis-server-3
	docker kill codis-server-4
	docker kill codis-server-5
	docker kill codis-server-6
	docker kill codis-server-7
	docker kill codis-server-8
	docker rm codis-server-1
	docker rm codis-server-2
	docker rm codis-server-3
	docker rm codis-server-4
	docker rm codis-server-5
	docker rm codis-server-6
	docker rm codis-server-7
	docker rm codis-server-8
	docker run -d --name=codis-server-1 -p 6301:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-2 -p 6302:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-3 -p 6303:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-4 -p 6304:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-5 -p 6305:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-6 -p 6306:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-7 -p 6307:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server
	docker run -d --name=codis-server-8 -p 6308:6379 -e MAXMEMORY=5316280320 dhub.yunpro.cn/kuizhi/codis-server

runProxy:
	docker kill codis-proxy && docker rm codis-proxy && docker run -d --name=codis-proxy --net=host -e PROXY_ADDR=19000 -e PROXY_HTTP_ADDR=11000 -e COORDINATOR=etcd -e DB_ADDR=10.12.1.105:2379 -e DASHBOARD_ADDR=10.12.1.101:18087 -e PROXY_ID=1 -e PRODUCTNAME=first -e PROXY_IP=10.12.1.101 -e CPU=4 dhub.yunpro.cn/kuizhi/codis-proxy

runZookeeper1:
	docker run --name=zookeeper -rm -p 2181:2181 -p 2182:2182 -p 2183:2183 -v /data/zookeeper/:/data/zookeeper -e myid=1 -e zoogroup=10.10.11.22,10.10.11.14,10.10.11.206 dhub.yunpro.cn/kuizhi/codis-zookeeper

runZookeeper2:
	docker run --name=zookeeper -rm -p 2181:2181 -p 2182:2182 -p 2183:2183 -v /home/kuizhi/zookeeper/:/data/zookeeper -e myid=2 -e zoogroup=10.10.11.22,10.10.11.14,10.10.11.206 dhub.yunpro.cn/kuizhi/codis-zookeeper

runZookeeper3:
	docker run --name=zookeeper -rm -p 2181:2181 -p 2182:2182 -p 2183:2183 -v /home/kuizhi/zookeeper/:/data/zookeeper -e myid=3 -e zoogroup=10.10.11.22,10.10.11.14,10.10.11.206 dhub.yunpro.cn/kuizhi/codis-zookeeper

exitDashboard:
	docker exec codis-dashboard /bin/kill 5
	docker rm codis-dashboard
	#docker exec codis-dashboard  /bin/ps -ef|grep dashboard|tail -n 1|awk '{print $2}'|xargs -I {} kill {}

