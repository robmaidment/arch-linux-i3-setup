#!/usr/bin/env bash
set -euxo pipefail

# enable i3
echo "VBoxClient-all
           exec i3 " > /home/vagrant/.xinitrc

echo "
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ \$(tty) = /dev/tty1 ]; then exec startx; fi" > /home/vagrant/.bash_profile

ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""

# install yay, because my profiles need it
# git clone https://aur.archlinux.org/yay.git 
# chmod 777 yay && cd yay
# makepkg --noconfirm -si
# cd .. && rm -r yay
