#!/bin/bash

#vim setup..
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/ftplugin/gitcommit
mkdir -p ~/.vim/ftplugin/mail

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/colors/candy.vim ~/.vim/colors/candy.vim
ln -s ~/.dotfiles/vim/ftplugin/gitcommit/gitcommit.vim ~/.vim/ftplugin/gitcommit/gitcommit.vim
ln -s ~/.dotfiles/vim/ftplugin/mail/mail.vim ~/.vim/ftplugin/mail/mail.vim

#tmux
echo "ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf"
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

#git
echo "ln -s ~/.dotfiles/gitconfig ~/.gitconfig"
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

#zsh
echo "ln -s ~/.dotfiles/zshrc ~/.zshrc"
ln -s ~/.dotfiles/zshrc ~/.zshrc

#inputrc
echo "ln -s ~/.dotfiles/inputrc ~/.inputrc"
ln -s ~/.dotfiles/inputrc ~/.inputrc
