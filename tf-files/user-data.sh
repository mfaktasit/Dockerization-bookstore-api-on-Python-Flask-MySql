#! /bin/bash
dnf update -y
dnf install -y docker 
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
newgrp docker
dnf install -y git 
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /home/ec2-user/
mkdir project && cd project
FOLDER=https://raw.githubusercontent.com/mfaktasit/Dockerization-bookstore-api-on-Python-Flask-MySql/tree/main
wget $FOLDER/docker-compose.yml
docker-compose up -d