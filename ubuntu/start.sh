#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi
sudo apt update
mkdir tempfolder && cd tempfolder
wget peterzam.dev/ubuntu/chrome.sh && sudo sh chrome.sh
wget peterzam.dev/ubuntu/conky.sh && sudo sh conky.sh
wget peterzam.dev/ubuntu/docker.sh && sudo sh docker.sh
wget peterzam.dev/ubuntu/vb.sh && sudo sh vb.sh
wget peterzam.dev/ubuntu/vscode.sh && sudo sh vscode.sh
sudo apt upgrade && apt upgrade -y
