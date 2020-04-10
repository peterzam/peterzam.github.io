#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi
sudo apt update
wget -O get-docker.sh https://get.docker.com 
sh get-docker.sh
sudo rm -rf get-docker.sh
