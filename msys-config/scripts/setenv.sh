#!/bin/bash

pacman -S \
	git subversion \
        zsh \
        vim nano \
        openssh curl \
        make automake autoconf \
        python2-pip \
	mingw-w64-x86_64-boost \
        mingw-w64-x86_64-cmake mingw-w64-x86_64-extra-cmake-modules \
	mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb \
        mingw-w64-x86_64-lua

# Install powerline-status and get location
pip2 install powerline-status
POWERLINE_STATUS_LOCATION=$(pip2 show powerline-status | grep Location | cut -d' ' -f2)

# Install Oh-My-Zsh!
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Install mintty colorscheme
cp ../files/.mintty ~/.mintty

# Setting up git
git config --global color.ui true
git config --global core.editor "vim"
git config --global user.email "julien.combattelli@hotmail.com"
git config --global user.name "Julien Combattelli"

# Setting up vim
echo "
\" General setting
syntax on
set number
set showmatch
\" Powerline Font path
set rtp+=$POWERLINE_STATUS_LOCATION/powerline/bindings/vim/
set laststatus=2
set t_Co=256
\" Indentation settings
set expandtab
set shiftwidth=4
set softtabstop=4
set cindent
set cinoptions=:0,l1,g0,(0,W4,N-s
" >> ~/.vimrc

# Setting up nano
echo "
include /usr/share/nano/*
" >> ~/.nanorc

# Setting up zsh
sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc
echo "
# Custom settings
DEFAULT_USER=$(whoami)
unsetopt nomatch
autoload -U compinit && compinit
" >> ~/.zshrc

# Install powerline fonts on Windows
git clone https://github.com/powerline/fonts.git ~/powerline-fonts
SCRIPT_DIR_WIN=$(cygpath -w $(realpath ~/powerline-fonts/install.ps1))
powershell start-process powershell -argumentlist \(\' \
    set-executionpolicy bypass -scope currentuser \; \
    set-executionpolicy bypass \; \
    $SCRIPT_DIR_WIN \; \
    set-executionpolicy default -scope currentuser \; \
    set-executionpolicy default \; \
    start-sleep 2 \
\'\) -verb runas

