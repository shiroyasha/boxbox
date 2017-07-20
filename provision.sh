#!/usr/bin/env bash

set -eou pipefail

sudo apt-get update -y

echo "[PROVISIONER] Installing Basic Tools"
sudo apt-get install -y htop figlet git vim tmux zsh curl wget build-essential xauth

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
sudo usermod -aG docker $USER

echo "[PROVISIONER] Installing Docker Compose"
curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/pip.py
sudo python /tmp/pip.py > /dev/null
sudo pip install docker-compose > /dev/null

echo "[PROVISIONER] Installing postgresql"
sudo apt-get install -y postgresql postgresql-contrib
sudo update-rc.d postgresql enable
sudo service postgresql start

echo "[PROVISIONER] Installing rabbitmq"
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y rabbitmq-server

echo "[PROVISIONER] Installing redis"
sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install -y redis-server

echo "[PROVISIONER] Installing elixir"
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang elixir

echo "[PROVISIONER] Installing node.js"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "[PROVISIONER] Installing ruby"
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.3
sudo gem install bundler

echo "[PROVISIONER] Export path to Ruby executables"
echo "export PATH=\"\$HOME/.gem/ruby/2.3.0/bin:\$PATH\"" >> ~/.zshrc

echo "[PROVISIONER] Installing ruby"
sudo gem install rails -v 4.2.8

# extract me :)

echo "[PROVISIONER] Reducing box size"
sudo aptitude -y purge ri
sudo aptitude -y purge installation-report landscape-common wireless-tools wpasupplicant ubuntu-serverguide
sudo aptitude -y purge python-dbus libnl1 python-smartpm python-twisted-core libiw30
sudo aptitude -y purge python-twisted-bin libdbus-glib-1-2 python-pexpect python-pycurl python-serial python-gobject python-pam python-openssl libffi5
sudo apt-get clean -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y

echo "[PROVISIONER] Remove bash history"
unset HISTFILE
sudo rm -f /root/.bash_history
sudo rm -f /home/vagrant/.bash_history

echo "[PROVISIONER] Done"
figlet "Box Box"
