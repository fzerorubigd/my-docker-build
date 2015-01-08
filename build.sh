#!/bin/bash

if [ ! -f `pwd`/go1.4.linux-amd64.tar.gz ]; then
    echo "Make sure you have proper access to internet and google code :) :/"
    wget -c https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz
fi;

docker build -t elbix:5000/gobox .
