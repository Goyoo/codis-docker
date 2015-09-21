Split Codis in diffent docke containers.
============

## Prepare
sh ./scripts/prepare/buildBase.sh

## Build
see makefile

## Error
dashboard has exist. use `make exitDashboard` to exit.
solution: zkCli.sh && ls /zk/codis/db_test/dashboard && delete /zk/codis/db_test/dashboard
