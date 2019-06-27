#!/usr/bin/env bash
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -R virtualbox-guest-utils-nox 
sudo pacman --noconfirm -S i3 dmenu xorg-server xorg-xinit xorg-drivers konsole git vim base-devel cmake chromium ttf-dejavu ranger

sudo sed -i "s/.*GRUB_CMDLINE_LINUX_DEFAULT.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet video=${RESOLUTION}\"/"  /etc/default/grub

sudo sed -i "s/.*GRUB_GFXMODE.*/GRUB_GFXMODE=\"${RESOLUTION}x24\"/"  /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable vboxservice.service

# generate & set locales
sudo echo LANG=de_DE.UTF-8 > /etc/locale.conf
sudo sed -i 's/#de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/g' /etc/locale.gen
sudo sed -i 's/#de_DE ISO-8859-1/de_DE ISO-8859-1/g' /etc/locale.gen
sudo sed -i 's/#de_DE@euro ISO-8859-15/de_DE@euro ISO-8859-15/g' /etc/locale.gen
sudo locale-gen

#set timezone
sudo ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

#add vagrant user to admin group
sudo sed -i 's/#%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
sudo gpasswd -a vagrant wheel

#set keyboard settings for arch & x server
sudo localectl --no-convert set-keymap de-latin1-nodeadkeys
sudo localectl --no-convert set-x11-keymap de pc105 nodeadkeys

#i3 autostart
sudo echo "VBoxClient-all
           exec i3 " > /home/vagrant/.xinitrc

sudo echo "
[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ \$(tty) = /dev/tty1 ]; then exec startx; fi" > /home/vagrant/.bash_profile

sudo mkdir /home/vagrant/.i3 && sudo cp /etc/i3/config /home/vagrant/.i3/config 

# install AUR helper yay
sudo git clone https://aur.archlinux.org/yay.git 
sudo chmod 777 yay && cd yay
makepkg --noconfirm -si
yay_package = find . -regex'./y ay-.*.pkg.tar.xz'
sudo pacman --noconfirm -U yay-.*-pkg.*
cd .. && sudo rm -r yay

