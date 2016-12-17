#!/bin/sh

if which node > /dev/null; then
  exit 0
fi

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y -qq nodejs
