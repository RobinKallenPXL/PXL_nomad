#!/bin/sh
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker

# start nomad

sudo cp /vagrant/nomadclient2.service /etc/systemd/system
sudo systemctl enable nomadclient2.service
sudo systemctl start nomadclient2.service