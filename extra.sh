#!/bin/bash
set -euo pipefail

apt-get -y update
apt-get -y upgrade

curl http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb > /tmp/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb
dpkg -i /tmp/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb

pip install --upgrade pgcli

cd /tmp
curl http://mosquitto.org/files/source/mosquitto-1.4.5.tar.gz | tar xvz
git clone https://github.com/jpmens/mosquitto-auth-plug.git
cd /tmp/mosquitto-auth-plug

cat > config.mk <<EOF
# Select your backends from this list
BACKEND_CDB ?= no
BACKEND_MYSQL ?= no
BACKEND_SQLITE ?= no
BACKEND_REDIS ?= no
BACKEND_POSTGRES ?= no
BACKEND_LDAP ?= no
BACKEND_HTTP ?= yes
BACKEND_MONGO ?= no

# Specify the path to the Mosquitto sources here
MOSQUITTO_SRC = /tmp/mosquitto-1.4.5

# Specify the path the OpenSSL here
OPENSSLDIR = /usr
EOF

make clean
make
mv /tmp/mosquitto-auth-plug/auth-plug.so /usr/local/lib/auth-plug.so

apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*