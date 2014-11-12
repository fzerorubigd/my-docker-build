#!/bin/bash

echo "export GOPATH=/home/develop/go" >> /home/develop/.zshrc
echo "export GOPATH=/home/develop/go" >> /etc/environment
echo "export PATH=$PATH:/usr/local/go/bin:/home/develop/go/bin" >> /home/develop/.zshrc


echo '{"datacenter": "docker","log_level": "INFO","data_dir": "/var/lib/consul","server": true}' > /etc/consul.d/config.json
echo '{"service": {"name": "rabbitmq", "tags": ["base"], "port": 5672, "check": {"script": "curl -i -u guest:guest http://localhost:15672/api/vhosts >/dev/null 2>&1", "interval": "60s"}}}' >/etc/consul.d/rabbitmq.json
echo '{"service": {"name": "postgres", "tags":["base"], "port": 5432, "check":{"script":"psql -U postgres -c \'select 1\'",  "interval": "60s"}}}' > /etc/consul.d/postgres.json
echo '{"service": {"name": "redis", "tags":["base"], "port": 6379, "check":{"script": "redis-cli PING >/dev/null 2>&1", "interval":"60s"}}}' > /etc/consul.d/redis.json

