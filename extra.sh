#!/bin/bash
set -euo pipefail

#PATH=/usr/local/go/bin:$PATH

#GOPATH=/tmp go get -v github.com/fzerorubigd/tmass
#cp /tmp/bin/tmass /usr/local/bin
gem install mailcatcher --no-ri --no-rdoc

# Install consul
wget https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip -O consul.zip
unzip consul.zip
chmod +x consul
mv consul /usr/local/bin/consul

mkdir /etc/consul.d
mkdir /var/lib/consul
echo '{"datacenter": "docker","log_level": "INFO","data_dir": "/var/lib/consul","server": true}' > /etc/consul.d/config.json
echo '{"service": {"name": "rabbitmq", "tags": ["base"], "port": 5672, "check": {"script": "curl -i -u guest:guest http://localhost:15672/api/vhosts >/dev/null 2>&1", "interval": "60s"}}}' >/etc/consul.d/rabbitmq.json
echo '{"service": {"name": "postgres", "tags":["base"], "port": 5432, "check":{"script":"psql -U postgres -c 'select 1',  "interval": "60s""}}}' > /etc/consul.d/postgres.json
echo '{"service": {"name": "redis", "tags":["base"], "port": 6379, "check":{"script": "redis-cli PING >/dev/null 2>&1", "interval":"60s"}}}' > /etc/consul.d/redis.json

wget https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 -O confd
chmod +x confd
mv confd /usr/local/bin/confd

# Move this stuff to install for next full rebuild
apt-get install -y bzr 
apt-get -y update
apt-get -y upgrade
