# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

$script=<<-SHELL
    cp /vagrant/common.sh /home/vagrant/common.sh
    bash /home/vagrant/common.sh
SHELL


Vagrant.configure("2") do |config|

  config.vm.define "m1" do |m1|
    m1.vm.box = "ubuntu/focal64"
    m1.vm.network "private_network", ip: "192.168.100.10", auto_config: true
    m1.vm.provider "virtualbox" do |virtualbox|
      # Enable promiscuous mode so the server can receive traffic
      # for the virtual machines and containers.
      virtualbox.customize [
                             "modifyvm", :id,
                             "--nicpromisc2", "allow-all"
                         ]
      end
    # Install avahi on all machines  
    m1.vm.provision "shell", inline: $script
    m1.vm.provision :hosts, :sync_hosts => true 
    m1.vm.synced_folder ".", "/vagrant"
  end

  config.vm.define "m2" do |m2|
    m2.vm.box = "ubuntu/focal64"
    m2.vm.network "private_network", ip: "192.168.100.11", auto_config: true
    m2.vm.provider "virtualbox" do |virtualbox|
      # Enable promiscuous mode so the server can receive traffic
      # for the virtual machines and containers.
      virtualbox.customize [
                             "modifyvm", :id,
                             "--nicpromisc2", "allow-all"
                         ]
    end
    # Install avahi on all machines  
    m2.vm.provision "shell", inline: $script
    m2.vm.provision :hosts, :sync_hosts => true 
    m2.vm.synced_folder ".", "/vagrant"
  end
end
