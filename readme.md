dotfiles
========

installing dotfiles:

`for dir (*(/)) stow -v $dir`


to uninstall dotfiles:

`stow -D directory`

`for dir (*(/)) stow -v -D $dir`

simples (/◔ ◡ ◔)/

(stow has dramatically improved this workflow, to the extent that i no longer
need a setup.sh :D)


this might fix fonts for powerline.. maybe
```
wget -nc -P ~/.fonts/ https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget -nc -P ~/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -vf ~/.fonts/
```
