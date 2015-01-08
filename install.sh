#!/bin/bash
set -euo pipefail

# Change mirrors to iran, its hard to be in other-side-of-fuckin-firewall
bash -c 'echo -e "deb http://repo.asis.io/wheezy-security wheezy/updates main contrib non-free\ndeb http://repo.asis.io/wheezy-updates/ wheezy-updates main contrib non-free\ndeb http://repo.asis.io/debian stable main contrib non-free" > /etc/apt/sources.list'
bash -c 'echo "deb http://debian.asis.io/debian/ wheezy-backports main" >> /etc/apt/sources.list'

apt-get -y update
apt-get -y install apt-utils dialog wget curl sudo

curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -

bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/pgsql.list'
bash -c 'echo "deb http://ir.dotdeb.aasaam.ir/ stable all" > /etc/apt/sources.list.d/dotdeb.list'

apt-get -y update
apt-get -y upgrade
apt-get -y install openssh-server git zsh vim emacs nano libsqlite3-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev htop redis-server postgresql mercurial nginx ruby-dev realpath pkg-config unzip libpq-dev python-pip bzr python-dev
apt-get -y install -t wheezy-backports tmux
