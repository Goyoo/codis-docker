################### install gopm  ##################
mkdir -p $GOPATH/src/github.com/gpmgo/
cd $GOPATH/src/github.com/gpmgo/
wget --header "Referer: http://gopm.io/download" --post-data "pkgname=github.com/gpmgo/gopm&revision=" -O gopm.zip  http://gopm.io/download
unzip gopm.zip
rm gopm.zip
mv `ls` gopm
go install github.com/gpmgo/gopm

################### get codis last deps ##################
mkdir -p $GOPATH/src/github.com/kuizhi/
cp ./scripts/prepare/main.go $GOPATH/src/github.com/kuizhi/main.go
cd $GOPATH/src/github.com/kuizhi/
$GOPATH/bin/gopm get -v
cp -r ~/.gopm/repos/github.com/* $GOPATH/src/github.com/