#!/bin/bash
set -euo pipefail

PATH=/usr/local/go/bin:$PATH

GOPATH=/tmp go get -v github.com/fzerorubigd/tmass bitbucket.org/liamstask/goose/cmd/goose github.com/sosedoff/pgweb github.com/codeskyblue/fswatch
cp /tmp/bin/tmass /usr/local/bin
cp /tmp/bin/goose /usr/local/bin
cp /tmp/bin/pgweb /usr/local/bin
cp /tmp/bin/fswatch /usr/local/bin

apt-get -y update
apt-get -y upgrade
