#!/bin/bash

if [ ! -f `pwd`/go1.3.3.linux-amd64.tar.gz ]; then
    echo "Make sure you have proper access to internet and google code :) :/"
    wget https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz
fi;

rm -f consul
wget -c https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip -O consul.zip
unzip consul.zip
chmod a+x consul

wget -c https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 -O confd

docker build -t elbix:5000/gobox .
