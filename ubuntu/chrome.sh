#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi
sudo apt update
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && sudo rm -rf linux_signing_key.pub && sudo apt update && sudo apt install google-chrome-stable -y
