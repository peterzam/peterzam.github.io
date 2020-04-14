#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi

sudo apt install -y conky
wget https://gist.githubusercontent.com/peterzam/16c3e5704b9373d71cda622fb2f2a709/raw/9943da641c175ced93f18bcaa4fdce26be764338/conky.conf && sudo cp conky.conf /etc/conky/conky.conf && sudo mv conky.conf ~/.conkyrc
sudo mkdir -p ~/.config/autostart
wget https://gist.githubusercontent.com/peterzam/04ad1044106ca3b12deee023c6abffca/raw/2a3adea5dcdd695ba5763b783aae8b24c54729e0/conky.desktop
sudo mv conky.desktop ~/.config/autostart/conky.desktop
