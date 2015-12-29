# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'dummy'
  config.vm.box_url = 'http://bit.ly/vagrant-docker-dummy'

  config.ssh.username = "develop"
  config.ssh.password = "bita123"

  config.vm.provision "shell" do |s|
    s.path   = "bin/provision.sh"
    s.args   = [%x(ip addr | grep inet | grep docker0 | awk -F" " '{print $2}'| sed -e 's/\\/.*$//')]
  end

  config.vm.network "forwarded_port", guest: 9200,  host: 9200  # Elastic search
  config.vm.network "forwarded_port", guest: 6000,  host: 6000  # Logstash
  config.vm.network "forwarded_port", guest: 1080,  host: 1080  # Mail catcher
  config.vm.network "forwarded_port", guest: 15672, host: 15672 # Rabbit management
  
  config.vm.provider "docker" do |d|
    d.image = "docker.azmoona.com/azmoona/dev-box"
    d.has_ssh = true
    d.cmd = ["/bin/bash", "/vagrant/bin/init.sh"]
  end
end
