#!/usr/bin/env bash

set -eou pipefail

export LC_ALL="en_US.UTF-8"

echo -e "\n[TEST] Testing shell"
cat /etc/passwd | grep "vagrant" | grep "/bin/zsh"

echo -e "\n[TEST] Testing vim version"
vim --version
vim --version | grep "VIM - Vi IMproved 7.4"

echo -e "\n[TEST] Testing postgres version"
psql --version
psql --version | grep "(PostgreSQL) 9.4"

echo -e "\n[TEST] Testing postgres 'developer' user presence with CREATEDB role"
sudo -u postgres psql -c "\du" | grep "developer | Create DB"

echo -e "\n[TEST] Testing hub version"
hub --version
hub --version | grep "hub version 2.2.9"

echo -e "\n[TEST] Testing git version"
git --version
git --version | grep "git version 1.9"

echo -e "\n[TEST] Testing bundler version"
bundle --version
bundle --version | grep "Bundler version 1.16"

echo -e "\n[TEST] Testing gem version"
gem --version
gem --version | grep "2.5"

echo -e "\n[TEST] Testing node version"
node --version
node --version | grep "v8"

echo -e "\n[TEST] Testing npm version"
npm --version
npm --version | grep "5.5"

echo -e "\n[TEST] Testing yarn version"
yarn --version
yarn --version | grep "1.3"

echo -e "\n[TEST] Erlang version"
elixir --version
elixir --version | grep "Erlang/OTP 20"

echo -e "\n[TEST] Elixir version"
elixir --version
elixir --version | grep "Elixir 1.5"

echo -e "\n[TEST] Docker version"
docker --version
docker --version | grep "Docker version 17"

echo -e "\n[TEST] Docker compose version"
docker-compose --version
docker-compose --version | grep "docker-compose version 1.17"

echo -e "\nTests passed"
