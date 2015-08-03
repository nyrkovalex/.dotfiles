#! /bin/bash

install_pathogen () {
    mkdir -p ~/.vim/autoload ~/.vim/bundle 
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

install_bundles () {
    cd ~/.vim/bundle
    git clone git@github.com:scrooloose/syntastic.git
    git clone git@github.com:terryma/vim-multiple-cursors.git
    git clone git@github.com:vim-scripts/EasyGrep.git
    git clone git@github.com:tpope/vim-fugitive.git
    git clone git://github.com/altercation/vim-colors-solarized.git
		git clone https://github.com/airblade/vim-gitgutter
		git clone git@github.com:mileszs/ack.vim.git
}

install_command_t () {
    cd ~/.vim/bundle
    git clone git@github.com:wincent/command-t.git
    cd ~/.vim/bundle/command-t
    bundle install
    rake make
}

install_pathogen
install_bundles
install_command_t
