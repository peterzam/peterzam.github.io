#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi

cd /tmp && \
apt update && \
apt upgrade -y && \

wget http://releases.obins.net/occ/linux/deb/ObinsKit_1.1.4_x64.deb && \
dpkg -i ObinsKit_1.1.4_x64.deb && \
rm  -rf ObinsKit_1.1.4_x64.deb
apt --fix-missing install -y

echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
rm -rf linux_signing_key.pub && \
apt update && \
apt install google-chrome-stable -y

apt install git -y 

apt install zsh -y

wget -O get-docker.sh https://get.docker.com && \
bash get-docker.sh && \
rm -rf get-docker.sh && \
usermod -aG docker $USER

snap install --classic code

apt install -y conky && \
wget https://gist.githubusercontent.com/peterzam/16c3e5704b9373d71cda622fb2f2a709/raw/9943da641c175ced93f18bcaa4fdce26be764338/conky.conf && \
cp conky.conf /etc/conky/conky.conf && \
mv conky.conf /home/$USER/.conkyrc && \
rm -rf conky.conf && \
mkdir -p /home/$USER/.config/autostart && \
wget https://gist.githubusercontent.com/peterzam/04ad1044106ca3b12deee023c6abffca/raw/2a3adea5dcdd695ba5763b783aae8b24c54729e0/conky.desktop && \
mv conky.desktop /home/$USER/.config/autostart/conky.desktop && \
rm -rf conky.desktop

apt install gnome-tweaks

cd /home/$USER && \
apt install golang && \
cd /tmp

add-apt-repository multiverse && \
apt-get update && \
apt install virtualbox -y && \
apt install virtualbox-ext-pack -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
