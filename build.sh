#!/bin/bash

if [ ! -f `pwd`/go1.3.3.linux-amd64.tar.gz ]; then
    echo "Make sure you have proper access to internet and google code :) :/"
    wget https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz
fi;

GOPATH=`pwd`/tmp go get -v -u github.com/fzerorubigd/tmass
docker build -t elbix:5000/gobox .
