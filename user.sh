#!/bin/bash
set -euo pipefail

# Create vagrant user
bash -c "echo root:bita123 | chpasswd"
groupadd develop
useradd -g develop -m -s /usr/bin/zsh develop
bash -c "echo %develop ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant"
chmod 0440 /etc/sudoers.d/vagrant
bash -c "echo develop:bita123 | chpasswd"
sudo -Hu develop -- wget -O /home/develop/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
sudo -Hu develop -- wget -O /home/develop/.zshrc.local  http://git.grml.org/f/grml-etc-core/etc/skel/.zshrc

# Go related stuff
bash -c "echo GOPATH=/home/develop > /etc/environment"
sudo -Hu develop -- bash -c "echo export GOPATH=/home/develop >> /home/develop/.zshrc.local"
sudo -Hu develop -- bash -c "echo export PATH=\\\$PATH:/usr/local/go/bin:/home/develop/bin >> /home/develop/.zshrc.local"