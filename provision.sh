#!/bin/bash

echo "[PROVISIONER] Installing Basic Tools"
bash /vagrant/scripts/install_basics.sh

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
