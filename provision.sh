#!/bin/bash

echo "[PROVISIONER] Installing Basic Tools"
bash /vagrant/scripts/install_basics.sh

echo "[PROVISIONER] Installing Vim"
bash /vagrant/scripts/install_vim.sh

echo "[PROVISIONER] Installing Hub"
bash /vagrant/scripts/install_hub.sh

echo "[PROVISIONER] Installing Docker"
bash /vagrant/scripts/install_docker.sh

echo "[PROVISIONER] Installing Oh My ZSH"
bash /vagrant/scripts/install_oh_my_zsh.sh

echo "[PROVISIONER] DONE. Type:"
echo " "
echo "  vagrant ssh"
echo " "
