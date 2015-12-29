#!/bin/bash
set -euo pipefail

apt-get -y update
apt-get -y -f install apt-utils dialog wget curl sudo
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
curl http://www.dotdeb.org/dotdeb.gpg | apt-key add -
curl http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add -
curl -sL https://deb.nodesource.com/setup_5.x | bash -

bash -c 'echo -e "deb http://packages.dotdeb.org jessie all\ndeb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list'
bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list'
bash -c 'echo "deb http://repo.mosquitto.org/debian jessie main" >> /etc/apt/sources.list'

cd /tmp
curl https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz | tar zxvf -
chmod a+x /tmp/godeb
/tmp/godeb install 1.5.2

apt-get -y update
apt-get -y upgrade
apt-get -y --no-install-recommends -f install openssh-server git zsh vim nano libsqlite3-dev autoconf bison build-essential libssl-dev \
                libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev htop redis-server postgresql mercurial \
                nginx-extras realpath pkg-config unzip dnsutils re2c python-pip python-dev libpq-dev tmux bzr \
                libsodium-dev cmake nodejs libxml2-dev libzip-dev libxslt1-dev openjdk-7-jdk mp3info inkscape \
                libc-ares-dev uuid-dev libcurl4-gnutls-dev mosquitto libmosquitto-dev mosquitto-clients fontconfig libfontconfig1 \
                libfreetype6 libpng12-0 libjpeg62-turbo libx11-6 libxext6 libxrender1 xfonts-base xfonts-75dpi fontconfig-config libxcb1 \
                libx11-data xfonts-utils libfontenc1 libxfont1 x11-common xfonts-encodings libxau6 libxdmcp6 ucf fonts-dejavu-core \
                ttf-bitstream-vera fonts-liberation libexpat1 || apt-get update --fix-missing


apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*
