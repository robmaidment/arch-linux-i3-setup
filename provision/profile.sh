#!/usr/bin/env bash
set -euxo pipefail

# enable i3
echo "VBoxClient-all
           exec i3 " > /home/vagrant/.xinitrc

echo "
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ \$(tty) = /dev/tty1 ]; then exec startx; fi" > /home/vagrant/.bash_profile

# profile