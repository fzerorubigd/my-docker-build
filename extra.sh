#!/bin/bash
set -euo pipefail

#PATH=/usr/local/go/bin:$PATH

#GOPATH=/tmp go get -v github.com/fzerorubigd/tmass
#cp /tmp/bin/tmass /usr/local/bin
gem install mailcatcher --no-ri --no-rdoc

mkdir /etc/consul.d
mkdir /var/lib/consul

# Move this stuff to install for next full rebuild
apt-get install -y bzr 
apt-get -y update
apt-get -y upgrade
