#!/bin/bash

if which docker > /dev/null; then
  exit 0
fi

curl -L https://get.docker.com | bash > /dev/null
