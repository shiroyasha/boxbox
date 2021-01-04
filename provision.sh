#!/usr/bin/env bash

set -eou pipefail

echo "[PROVISIONER] Set up timezone to Belgrade"
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Europe/Belgrade /etc/localtime

echo "[PROVISIONER] Installing Docker"
curl -L https://get.docker.com | bash > /dev/null
sudo usermod -aG docker vagrant

echo "[PROVISIONER] Installing Basic Tools"
sudo apt-get install -y htop git vim tmux zsh curl wget build-essential xauth ack-grep python-pip software-properties-common

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

echo "[PROVISIONER] Installing Docker Compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "[PROVISIONER] Installing postgresql"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg 9.6" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib libpq-dev pgadmin3
sudo update-rc.d postgresql enable
sudo service postgresql start

echo "[PROVISIONER] Creating postgres user 'developer' with SUPERUSER privilege"
sudo -u postgres bash -c "psql -c \"CREATE USER developer WITH PASSWORD 'developer';\""
sudo -u postgres bash -c "psql -c \"ALTER USER developer WITH SUPERUSER;\""

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
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "[PROVISIONER] Installing yarn"
sudo npm install -g yarn

echo "[PROVISIONER] Installing ruby"
sudo chown vagrant:vagrant ~/.config
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.7.2
rbenv global 2.7.2
sudo gem install bundler

echo "[PROVISIONER] Installing awscli"
pip install awscli --upgrade --user
echo "export PATH=~/.local/bin:\$PATH" >> ~/.zshrc
echo "export PATH=~/.local/bin:\$PATH" >> ~/.bashrc

echo "[PROVISIONER] Installing gcloud and kubectl"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get install -y google-cloud-sdk kubectl

echo "[PROVISIONER] Installing minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.24.1/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/
