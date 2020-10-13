#!/bin/sh
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker

# start nomad

sudo cp /vagrant/nomadclient2.service /etc/systemd/system
sudo systemctl enable nomadclient2.service
sudo systemctl start nomadclient2.service