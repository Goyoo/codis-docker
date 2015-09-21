#!/bin/bash
set -e

/bin/bash /project/config-setting.sh

cd $GOPATH/src/github.com/wandoulabs/codis/bin
./codis-config -c /etc/codis/config.ini dashboard