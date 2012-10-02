#!/bin/bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/colors

ln -s ~/.dotfiles/vim/colors/candy.vim ~/.vim/colors
ln -s ~/.dotfiles/vimrc ~/.vimrc
