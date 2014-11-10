#!/bin/bash

echo "export GOPATH=/home/develop/go" >> /home/develop/.zshrc
echo "export GOPATH=/home/develop/go" >> /etc/environment
echo "export PATH=$PATH:/usr/local/go/bin:/home/develop/go/bin" >> /home/develop/.zshrc

# RabbitMQ install management
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl stop_app
rabbitmqctl start_app
rabbitmqctl add_user bita bita123
rabbitmqctl set_user_tags bita administrator
rabbitmqctl set_permissions -p / bita ".*" ".*" ".*"

cd /usr/share/elasticsearch && bin/plugin -i elasticsearch/marvel/latest > /dev/null

cp /vagrant/bin/logstash.conf /etc/logstash/conf.d
/etc/init.d/logstash restart


