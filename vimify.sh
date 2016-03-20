#! /bin/bash

install_pathogen () {
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

install_bundles () {
  cd ~/.dotfiles
  git submodule init
  git submodule update
}

compile_command_t () {
  cd ~/.dotfiles/vim-bundles/command-t
  bundle install
  rake make
}

compile_vimproc () {
  cd ~/.dotfiles/vim-bundles/vimproc.vim
  make
}

install_pathogen
install_bundles
compile_vimproc
compile_command_t

ln -sf .dotfiles/vim-bundles/ ~/.vim/bundle
ln -sf .dotfiles/vimrc ~/.vimrc
