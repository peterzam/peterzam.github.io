#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi

sudo apt install -y conky
wget peterzam.dev/ubuntu/conky/conky.conf && sudo cp conky.conf /etc/conky/conky.conf && sudo mv conky.conf ~/.conkyrc
sudo mkdir -p ~/.config/autostart
wget peterzam.dev/ubuntu/conky/conky.desktop
sudo mv conky.desktop ~/.config/autostart/conky.desktop
