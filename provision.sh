#!/usr/bin/env bash

set -eou pipefail

sudo apt-get update -y

echo "[PROVISIONER] Installing Basic Tools"
sudo apt-get install -y figlet \
                        git \
                        vim \
                        tmux \
                        zsh \
                        curl \
                        wget \
                        firefox \
                        build-essential


echo "[PROVISIONER] Setting up zsh"
# sudo chsh -s /bin/zsh vagrant
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "[PROVISIONER] Setting up vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "[PROVISIONER] Installing Hub"
wget -q https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz
tar xvzf hub-linux-amd64-2.2.9.tgz
cd hub-linux-amd64-2.2.9
sudo chmod +x install
sudo ./install
cd -

echo "[PROVISIONER] Installing Docker"
curl -L https://get.docker.com | bash > /dev/null
sudo usermod -aG docker $USER

echo "[PROVISIONER] Installing Docker Compose"
curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/pip.py
sudo python /tmp/pip.py > /dev/null
sudo pip install docker-compose > /dev/null


echo "[PROVISIONER] Done"
figlet "Box Box"
