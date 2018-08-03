#!/bin/bash

pacman -S \
	make git subversion zsh vim nano openssh automake autoconf \
	mingw-w64-x86_64-boost mingw-w64-x86_64-cmake mingw-w64-x86_64-extra-cmake-modules \
	mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb mingw-w64-x86_64-lua

# Install Oh-My-Zsh!
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Install mintty colorscheme
cp ../files/.mintty ~/.mintty
