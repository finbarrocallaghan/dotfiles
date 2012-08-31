#!/bin/bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup

ln -s ~/.dotfiles/vimrc ~/.vimrc
