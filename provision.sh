#!/usr/bin/env bash

set -eou pipefail

echo "========================================="
echo "[PROVISIONER] Adding apt-get repositories"
echo "========================================="

sudo apt-get -y install software-properties-common
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-add-repository ppa:brightbox/ruby-ng

sudo apt-get update -y

echo "========================================="
echo "[PROVISIONER] Installing apt-get packages"
echo "========================================="

sudo apt-get install -qq -y \
  build-essential \
  curl \
  elixir \
  esl-erlang \
  figlet \
  git \
  htop \
  nodejs \
  postgresql \
  postgresql-contrib \
  rabbitmq-server \
  redis-server \
  ruby2.3 \
  tmux \
  vim \
  wget \
  xauth \
  zsh

echo "[PROVISIONER] Installing Firefox"
wget https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_46.0.1-0ubuntu1_amd64.deb
sudo dpkg -i firefox-mozilla-build_46.0.1-0ubuntu1_amd64.deb

echo "[PROVISIONER] Setting up zsh"
sudo chsh -s /bin/zsh vagrant
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "[PROVISIONER] Setting up vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "[PROVISIONER] Installing Hub"
wget https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz
tar xvzf hub-linux-amd64-2.2.9.tgz
cd hub-linux-amd64-2.2.9 && sudo chmod +x install && sudo ./install && cd -

echo "[PROVISIONER] Installing Docker"
curl -L https://get.docker.com | bash > /dev/null
curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/pip.py && sudo python /tmp/pip.py > /dev/null
sudo usermod -aG docker $USER
sudo pip install docker-compose > /dev/null

echo "[PROVISIONER] Installing gems"
echo "export PATH=\"\$HOME/.gem/ruby/2.3.0/bin:\$PATH\"" >> ~/.zshrc
gem install rails -v 4.2.8 --no-ri --no-rdoc
gem install bundler --no-ri --no-rdoc

echo "[PROVISIONER] Done"
figlet "Box Box"
