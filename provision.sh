#!/bin/bash

sudo apt-get update -y

# install basic tools
sudo apt-get install -y git
sudo apt-get install -y zsh
sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y firefox

# install docker
curl -L https://get.docker.com | bash

# install databases
sudo apt-get install -y postgresql
sudo apt-get install -y postgresql-contrib

# install rabbit mq
bash scripts/install_rabbitmq.sh
