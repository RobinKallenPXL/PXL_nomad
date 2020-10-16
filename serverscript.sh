#!/bin/sh
sudo cp /vagrant/nomadconfig/server.hcl /etc/nomad.d/nomad.hcl

sudo systemctl enable nomad
sudo systemctl restart nomad 