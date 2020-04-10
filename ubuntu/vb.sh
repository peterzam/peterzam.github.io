#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi
sudo add-apt-repository multiverse && sudo apt-get update && sudo apt install virtualbox -y && sudo apt install virtualbox-ext-pack
