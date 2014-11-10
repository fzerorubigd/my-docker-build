#!/bin/bash

tmass load --layout-dir=/vagrant/bin/ init.yml

# DO NOT ALTER THE FOLLOWING LINE
while true;
do
	echo "Docker main shell, press Ctrl+C to kill this container"
	sleep 1
done;
