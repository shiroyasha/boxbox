#!/bin/bash

echo "Updating Apt repository"
sudo apt-get update -qq -y > /dev/null
sudo apt-get install -qq -y figlet > /dev/null

figlet "Box Box"

echo "Installing Basic Tools"
sudo apt-get install -qq -y git tmux zsh vim curl wget firefox build-essential > /dev/null

echo "Changing shell to zsh"
chsh -s /bin/zsh

echo "Installing Postgres"
sudo apt-get install -qq -y postgresql postgresql-contrib > /dev/null

echo "Installing Docker"
bash /vagrant/scripts/install_docker.sh

echo "Installing RabbitMQ"
bash /vagrant/scripts/install_rabbitmq.sh

echo "Installing Ruby"
bash /vagrant/scripts/install_ruby.sh

echo "Installing Node"
bash /vagrant/scripts/install_node.sh
