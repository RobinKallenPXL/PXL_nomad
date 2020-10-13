#!/bin/sh
sudo cp /vagrant/nomadserver.service /etc/systemd/system
sudo systemctl enable nomadserver.service
sudo systemctl start nomadserver.service