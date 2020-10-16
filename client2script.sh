#!/bin/sh
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

# nomad config

sudo cp /vagrant/nomadconfig/client2.hcl /etc/nomad.d/nomad.hcl

sudo systemctl enable nomad
sudo systemctl restart nomad 
