# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos/7"
  config.vm.hostname = "nomad"

  config.vm.provider :virtualbox do |virtualbox, override|
    virtualbox.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.provider :lxc do |lxc, override|
    override.vm.box = "visibilityspots/centos-7.x-minimal"
  end

  config.vm.provision "shell", path:"templateInstall.sh"

  
  config.vm.define "server" do |server|
    server.vm.hostname = "server"
    server.vm.network "private_network", ip: "192.168.1.4", virtualbox__intnet: "mynetwork"
  end
  config.vm.define "client1" do |client1|
    client1.vm.hostname = "client1"
    client1.vm.network "private_network", ip: "192.168.1.5", virtualbox__intnet: "mynetwork"
  end
  config.vm.define "client2" do |client2|
    client2.vm.hostname = "client2"
    client2.vm.network "private_network", ip: "192.168.1.6", virtualbox__intnet: "mynetwork"
  end
  config.vm.provision "ansible" do |ansible|
     ansible.playbook = "ansible/playbook.yml"
end
