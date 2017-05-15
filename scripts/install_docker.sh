#!/bin/bash

# install docker
if ! which docker > /dev/null; then
  curl -L https://get.docker.com | bash > /dev/null
  sudo usermod -aG docker $USER
fi

# install docker compose
if ! which docker-compose > /dev/null; then
  curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/pip.py
  sudo python /tmp/pip.py > /dev/null
  sudo pip install docker-compose > /dev/null
fi
