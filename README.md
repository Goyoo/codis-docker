Docker Version For Codis
============

Docker Hack Day Project, Beijing, 2015


Dodis is a redis cluster solution based on Docker and codis. It supports auto scaling, data failover, data auto rebalance, multi-tenant. Based on Docker, Dodis is very easy to be deployed and it can make great use of server resources dynamically. Each Dodis instance including proxies, redis nodes, dodis-server, etcd modules.

###Keywords

`Docker`, `Etcd`, `Fleet`, `Codis`

- Auto Scaling. With health stats, Dodis can dynamic change the proxy and redis instances amount depending on traffic and memory requirement.
- Data Failover. There are backup redis nodes in each group of redis cluster. When primary redis dead, it will bring up second one to primary role and keep data safe and working.
- Multi-tenant. Each Dodis instance has its own service endpoint, data is individual for each services with authorization feature.

## NOTE

This Project is for DEMO only, and we will improve it for PRODUCTION SOON.

## Prepare
sh ./scripts/prepare/buildBase.sh

## Build
see makefile

## Error
dashboard has exist. use `make exitDashboard` to exit.
solution: zkCli.sh && ls /zk/codis/db_test/dashboard && delete /zk/codis/db_test/dashboard
