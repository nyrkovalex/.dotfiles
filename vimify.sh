#! /bin/bash

VIM_HOME=~/.config/nvim

cd $VIM_HOME
ln -sf ~/.dotfiles/vimrc ./init.vim
touch ~/.dotfiles/local.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh
