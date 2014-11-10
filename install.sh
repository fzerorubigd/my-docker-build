#!/bin/bash
set -euo pipefail

# Change mirrors to iran, its hard to be in other-side-of-fuckin-firewall
bash -c 'echo -e "deb http://debian.asis.io/debian/ wheezy main\ndeb http://debian.asis.io/debian/ wheezy-updates main\ndeb http://security.debian.org wheezy/updates main" > /etc/apt/sources.list'
bash -c 'echo "deb http://debian.asis.io/debian/ wheezy-backports main" >> /etc/apt/sources.list'

apt-get -y update
apt-get -y install apt-utils dialog wget curl sudo
bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" >> /etc/apt/sources.list'
bash -c 'echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list'
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
curl http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

bash -c 'echo -e "deb http://packages.dotdeb.org wheezy all\ndeb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list'
bash -c 'echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" >> /etc/apt/sources.list'
bash -c 'echo "deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main" >> /etc/apt/sources.list'

apt-get -y update
apt-get -y upgrade
apt-get -y install openssh-server git zsh vim emacs nano libsqlite3-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev htop redis-server postgresql mercurial nginx ruby-dev rabbitmq-server elasticsearch logstash realpath pkg-config unzip
apt-get -y install -t wheezy-backports tmux
