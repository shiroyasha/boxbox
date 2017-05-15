#!/bin/bash

# install docker
if ! which docker > /dev/null; then
  curl -L https://get.docker.com | bash > /dev/null
fi

# install docker compose
if ! which docker-compose > /dev/null; then
  curl https://bootstrap.pypa.io/get-pip.py | python
  sudo pip install docker-compose
fi
