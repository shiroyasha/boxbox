#!/bin/bash

#if which vim > /dev/null; then
#  exit 0
#fi

sudo apt-get install -qq -y vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
