dotfiles
========

installing dotfiles:

`git clone --recursive https//github.com/finbarrocallaghan/dotfiles.git`

`for dir (*(/)) stow -v $dir`

to uninstall dotfiles:

`for dir (*(/)) stow -v -D $dir`

simples (/◔ ◡ ◔)/

this sometimes fixes fonts for powerline.. ᕙ(⇀‸↼‶)ᕗ

```
wget -nc -P ~/.fonts/ https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget -nc -P ~/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -vf ~/.fonts/
```
