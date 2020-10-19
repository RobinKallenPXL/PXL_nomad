#!/bin/sh

# consul
sudo cp /vagrant/consulconfig/consulserver.hcl /etc/consul.d/consul.hcl

sudo systemctl enable consul
sudo systemctl restart consul

#nomad
sudo cp /vagrant/nomadconfig/server.hcl /etc/nomad.d/nomad.hcl

sudo systemctl enable nomad
sudo systemctl restart nomad 

