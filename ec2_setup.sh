#! usr/bin/bash

# update vm
sudo yum update -y
sudo yum install git -y

# install docker
sudo yum install docker -y

# give user permissions to docker
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker

# install docker compose
sudo yum install python3-pip
sudo pip3 install docker-compose

# start docker when vm starts
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service

# verify docker was installed
docker version
docker-compose version

# pull files from repo
git clone https://github.com/ChaseRun/crypto_bot.git
mv crypto_bot freqtrade
cd freqtrade

# setup freqtrade
docker-compose pull
