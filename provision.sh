#!/bin/bash

echo "[PROVISIONER] Updating Apt repository"
sudo apt-get update -qq -y > /dev/null
sudo apt-get install -qq -y figlet > /dev/null

figlet "Box Box"

echo "[PROVISIONER] Installing Basic Tools"
sudo apt-get install -qq -y git tmux zsh curl wget firefox build-essential > /dev/null

echo "[PROVISIONER] Changing shell to zsh"
sudo chsh -s /bin/zsh

echo "[PROVISIONER] Installing Postgres"
sudo apt-get install -qq -y postgresql postgresql-contrib > /dev/null

echo "[PROVISIONER] Installing Vim"
bash /vagrant/scripts/install_vim.sh

echo "[PROVISIONER] Installing Docker"
bash /vagrant/scripts/install_docker.sh

echo "[PROVISIONER] Installing RabbitMQ"
bash /vagrant/scripts/install_rabbitmq.sh

echo "[PROVISIONER] Installing Ruby"
bash /vagrant/scripts/install_ruby.sh

echo "[PROVISIONER] Installing Node"
bash /vagrant/scripts/install_node.sh

echo "[PROVISIONER] Installing Hub"
bash /vagrant/scripts/install_hub.sh
