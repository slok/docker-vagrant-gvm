# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.ssh.port = "22" # small fix for https://github.com/mitchellh/vagrant/issues/3799
  config.vm.hostname = "docker-vagrant-gvm"

  config.vm.provider "docker" do |d|
      d.build_dir = "."
      d.has_ssh = true
      #d.volumes = ["/var/docker/redis:/data"]
  end

end