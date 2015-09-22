Docker Version For Codis
============

Docker Hack Day Project, Beijing, 2015



## NOTE

This Project is for DEMO only, and we will improve it for PRODUCTION SOON.

## Prepare
sh ./scripts/prepare/buildBase.sh

## Build
see makefile

## Error
dashboard has exist. use `make exitDashboard` to exit.
solution: zkCli.sh && ls /zk/codis/db_test/dashboard && delete /zk/codis/db_test/dashboard
