#!/bin/bash

#vim setup..
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/ftplugin/gitcommit
mkdir -p ~/.vim/ftplugin/mail

ln -si ~/.dotfiles/vimrc ~/.vimrc
ln -si ~/.dotfiles/vim/colors/candy.vim ~/.vim/colors/candy.vim
ln -si ~/.dotfiles/vim/ftplugin/gitcommit/gitcommit.vim ~/.vim/ftplugin/gitcommit/gitcommit.vim
ln -si ~/.dotfiles/vim/ftplugin/mail/mail.vim ~/.vim/ftplugin/mail/mail.vim

#somehow i'd like to install all the bundles etc without opening vim
#but for now.. after a ,bi inside vim..

wget -nc -P ~/.fonts/ https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget -nc -P ~/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -vf ~/.fonts/

#tmux
echo "ln -si ~/.dotfiles/tmux.conf ~/.tmux.conf"
ln -si ~/.dotfiles/tmux.conf ~/.tmux.conf

#git
echo "ln -si ~/.dotfiles/gitconfig ~/.gitconfig"
ln -si ~/.dotfiles/gitconfig ~/.gitconfig

#zsh
echo "ln -si ~/.dotfiles/zshrc ~/.zshrc"
ln -si ~/.dotfiles/zshrc ~/.zshrc

#inputrc
echo "ln -si ~/.dotfiles/inputrc ~/.inputrc"
ln -si ~/.dotfiles/inputrc ~/.inputrc
