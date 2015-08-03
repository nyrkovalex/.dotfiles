#! /bin/sh

# X stuff
ln -sf ~/.dotfiles/Xmodmap ~/.Xmodmap
ln -sf ~/.dotfiles/Xresources ~/.Xresources

# i3
mkdirp ~/.i3
ln -sf ~/.dotfiles/i3status.conf ~/.i3status.conf
ln -sf ~/.dotfiles/i3/config ~/.i3-config

# wmii
mkdirp ~/.wmii
ln -sf ~/.dotfiles/wmiirc ~/.wmii/wmiirc

# VIM
ln -sf ~/.dotfiles/gvimrc ~/.gvimrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
sh ~/.dotfiles/vimify.sh
