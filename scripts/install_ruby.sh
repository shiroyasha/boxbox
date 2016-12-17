#!/bin/bash

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update -y -qq > /dev/null

sudo apt-get install -y -qq ruby2.3 ruby2.3-dev
