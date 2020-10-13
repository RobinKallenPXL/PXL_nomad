#!/bin/sh
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker