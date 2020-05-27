#!/usr/bin/env bash
set -euxo pipefail

export initialres=800x600

#pacman --noconfirm -Syyu

# remove guest utils provided by the box (they do not work in the GUI environment)
pacman --noconfirm -R virtualbox-guest-utils-nox || true

pacman --noconfirm -Sy \
    vi \
    vim \
    base-devel \
    net-tools \
    neovim \
    wget \
    git \
    unzip \
    openssh \
    bash-completion \
    dialog \
    alsa-utils \
    pulseaudio \
    xorg \
    xf86-video-intel \
    xf86-input-synaptics \
    xf86-input-libinput \
    xclip \
    feh \
    termite \
    chromium \
    virtualbox-guest-utils \
    i3 \
    dmenu \
    ttf-dejavu \
    ranger \
    lightdm \
    lightdm-gtk-greeter

sed -i "s/.*GRUB_CMDLINE_LINUX_DEFAULT.*/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet video=${initialres}\"/"  /etc/default/grub
sed -i "s/.*GRUB_GFXMODE.*/GRUB_GFXMODE=\"${initialres}x24\"/"  /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable vboxservice.service
systemctl enable lightdm.service

# generate & set locales
echo 'LANG=en_GB.UTF-8' | sudo tee /etc/locale.conf
sed -i 's/#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g' /etc/locale.gen
sed -i 's/#en_GB ISO-8859-1/en_GB ISO-8859-1/g' /etc/locale.gen
locale-gen

#set timezone
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

#add vagrant user to admin group
sed -i 's/#%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
gpasswd -a vagrant wheel

#set keyboard settings for arch & x server
localectl --no-convert set-keymap en-latin1-nodeadkeys
localectl set-x11-keymap gb pc105 extd terminate:ctrl_alt_bksp
