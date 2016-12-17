# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-14.04"
  config.vm.hostname = "boxbox" 
  config.vm.network :private_network, type: "dhcp"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provision "shell", :privileged => false, :inline => "bash /vagrant/provision.sh"
end
