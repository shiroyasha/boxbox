#!/bin/bash

last_update=$(stat -c %Z /var/lib/apt/periodic/update-success-stamp)
time_since_last_update="$[$(date +%s) - $last_update]"

if [ "$time_since_last_update" -ge 600000 ]; then
  sudo apt-get update -qq -y > /dev/null
fi

sudo apt-get install -qq -y figlet git tmux zsh curl wget firefox build-essential > /dev/null

figlet "Box Box"

sudo chsh -s /bin/zsh vagrant
