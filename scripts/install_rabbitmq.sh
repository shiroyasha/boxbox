#!/bin/bash

echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list > /dev/null 2>&1
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add - > /dev/null 2>&1
sudo apt-get update -y -qq > /dev/null
sudo apt-get install -qq -y rabbitmq-server
