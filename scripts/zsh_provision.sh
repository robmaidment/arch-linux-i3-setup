#!/usr/bin/env bash
sudo pacman --noconfirm -S fzf zsh

sudo chsh -s $(which zsh) $(whoami)
touch /home/vagrant/.zshrc

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed -i "s/.*ZSH_THEME.*/ZSH_THEME=\"agnoster\"/"  /home/vagrant/.zshrc

echo "source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh" >> /home/vagrant/.zshrc

echo "
[[ -f ~/.zshrc ]] && . ~/.zshrc
if [ \$(tty) = /dev/tty1 ]; then exec startx; fi" >> /home/vagrant/.zprofile


cd /home/vagrant/.oh-my-zsh/plugins && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
sed -i "s/.*plugins=.*/plugins=( git zsh-syntax-highlighting)/"  /home/vagrant/.zshrc
