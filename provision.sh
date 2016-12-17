#!/bin/bash

echo "Updating Apt repository"
sudo apt-get update -qq -y > /dev/null
sudo apt-get install -qq -y figlet

figlet "Box Box"

echo "Installing Basic Tools"
sudo apt-get install -qq -y build-essential
sudo apt-get install -qq -y git
sudo apt-get install -qq -y tmux
sudo apt-get install -qq -y zsh
sudo apt-get install -qq -y vim
sudo apt-get install -qq -y curl
sudo apt-get install -qq -y wget
sudo apt-get install -qq -y firefox

echo "Installing Postgres"
sudo apt-get install -qq -y postgresql
sudo apt-get install -qq -y postgresql-contrib

echo "Installing Docker"
bash /vagrant/scripts/install_docker.sh

echo "Installing RabbitMQ"
bash /vagrant/scripts/install_rabbitmq.sh

echo "Installing Ruby"
bash /vagrant/scripts/install_ruby.sh
