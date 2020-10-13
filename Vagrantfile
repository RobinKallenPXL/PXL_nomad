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

  config.vm.provision "shell",
    inline: "whoami"

  config.vm.provision "shell", path: "script.sh"
  config.vm.provision "shell", path: "scripts/update.sh"

  config.vm.define "server" do |server|
    server.vm.hostname = "server"
    server.vm.provision "shell", path: "serverscript.sh"
  end
  config.vm.define "client1" do |client1|
    client1.vm.hostname = "client1"
    client1.vm.provision "shell", path: "client1script.sh"
  end
  config.vm.define "client2" do |client2|
    client2.vm.hostname = "client2"
    client2.vm.provision "shell", path: "client2script.sh"
  end
end
