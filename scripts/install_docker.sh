#!/bin/bash

if which docker > /dev/null; then
  echo "Docker already installed"
  exit 0;
fi

curl -L https://get.docker.com | bash > /dev/null
