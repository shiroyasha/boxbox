#!/bin/bash

if which ruby > /dev/null; then
  exit 0
fi

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update -y -qq > /dev/null

sudo apt-get install -y -qq ruby2.3 ruby2.3-dev

echo "gem: --user-install --no-document --no-ri --no-rdoc" > ~/.gemrc
echo "benchmark: false" >> ~/.gemrc
echo "verbose: false" >> ~/.gemrc
echo "update_sources: true" >> ~/.gemrc
echo "backtrace: true" >> ~/.gemrc

gem install bundler
