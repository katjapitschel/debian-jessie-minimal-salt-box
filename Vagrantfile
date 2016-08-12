# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "danher/debian-jessie-minimal-salt"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "share", "/media/share"
  config.vm.synced_folder "salt/roots", "/srv/salt"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "salt/minion.yml"
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = "info"
    salt.verbose = true
  end
end
