#!/bin/sh
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

# consul
sudo cp /vagrant/consulconfig/consulclient1.hcl /etc/consul.d/consul.hcl

sudo systemctl enable consul
sudo systemctl restart consul

# nomad config

sudo cp /vagrant/nomadconfig/client1.hcl /etc/nomad.d/nomad.hcl

sudo systemctl enable nomad
sudo systemctl restart nomad 

