#!/bin/bash
set -euo pipefail
export http_proxy=http://172.17.42.1:7072
export https_proxy=http://172.17.42.1:7072

PATH=/usr/local/go/bin:$PATH

GOPATH=/tmp go get -v github.com/fzerorubigd/tmass bitbucket.org/liamstask/goose/cmd/goose github.com/sosedoff/pgweb github.com/codeskyblue/fswatch github.com/mailhog/MailHog
cp /tmp/bin/tmass /usr/local/bin
cp /tmp/bin/goose /usr/local/bin
cp /tmp/bin/pgweb /usr/local/bin
cp /tmp/bin/fswatch /usr/local/bin
cp /tmp/bin/MailHog /usr/local/bin

#pip install pgcli
apt-get -y update
apt-get -y upgrade
