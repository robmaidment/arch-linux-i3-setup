#install vim plugin manager
sudo pacman --noconfirm -S clang
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim


source /home/vagrant/.vimrc
vim +PluginInstall

echo "source /usr/share/fzf/completion.bash && source /usr/share/fzf/key-bindings.bash" >> /home/vagrant/.bashrc


/home/vagrant/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang