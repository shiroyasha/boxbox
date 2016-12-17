#!/bin/bash

if which hub > /dev/null; then
  exit 0
fi

cd /tmp

echo "Downloading package from GitHub"
wget -q https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz

tar xvzf hub-linux-amd64-2.2.9.tgz
cd hub-linux-amd64-2.2.9

echo "Running install script"
sudo chmod +x install
sudo ./install
