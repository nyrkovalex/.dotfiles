#! /bin/bash

VIM_HOME=~/.config/nvim

install_pathogen () {
  mkdir -p $VIM_HOME/autoload ~/.dotfiles/bundle
  curl -LSso $VIM_HOME/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

install_bundles () {
  cd ~/.dotfiles
  git submodule init
  git submodule update --init --recursive
}

build_ycm () {
  cd ~/.dotfiles/bundle/YouCompleteMe
  ./install.py
}

mkdir -p $VIM_HOME
install_pathogen
install_bundles
build_ycm

cd $VIM_HOME
ln -sf ~/.dotfiles/bundle
ln -sf ~/.dotfiles/vimrc ./init.vim
touch ~/.dotfiles/local.vim
