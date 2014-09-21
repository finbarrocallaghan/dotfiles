#!/bin/bash

#vim setup..
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/ftplugin/gitcommit
mkdir -p ~/.vim/ftplugin/mail

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/colors/candy.vim ~/.vim/colors/candy.vim
ln -s ~/.dotfiles/vim/ftplugin/gitcommit/gitcommit.vim ~/.vim/ftplugin/gitcommit/gitcommit.vim
ln -s ~/.dotfiles/vim/ftplugin/mail/mail.vim ~/.vim/ftplugin/mail/mail.vim

#somehow i'd like to install all the bundles etc without opening vim
#but for now.. after a ,bi inside vim..

wget -nc -P ~/.fonts/ https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget -nc -P ~/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -vf ~/.fonts/

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
