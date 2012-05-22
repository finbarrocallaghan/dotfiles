#.zshrc
source ~/.zshrc.local
LANG="en_IE.utf8"
LC_ALL="en_IE.utf8"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="clean"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-flow python vi-mode)

source $ZSH/oh-my-zsh.sh

BROWSER="firefox"
EDITOR="vimx"
HISTFILE=~/.zsh_history
HISTSIZE=50000
LISTMAX=999
MAIL=0
PAGER="less"
SAVEHIST=50000
NODE_PATH="/local/focallag/_loc_bin/node-v0.6.15/bin/node"

setopt PROMPT_SUBST
setopt APPENDHISTORY
setopt AUTOCD
setopt AUTOPUSHD
setopt BANGHIST
setopt EXTENDEDGLOB
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPENDHISTORY
setopt INTERACTIVECOMMENTS
setopt NOCLOBBER
setopt NOHUP
setopt NOMATCH
setopt NOTIFY
setopt PUSHDMINUS
setopt PUSHDSILENT
setopt PUSHDIGNOREDUPS
setopt PUSHDTOHOME
setopt SHARE_HISTORY
setopt NOCDABLEVARS
unsetopt BEEP



# tab completion for PID
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*:processes' command "ps auxw"


zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle :compinstall filename '~/.zshrc'

zmodload -i zsh/complist

autoload -U zmv
autoload -U zed

zle -N edit-command-line


alias less='less -RXF'
alias ls='ls --color=auto -F'
alias lsdirs='ls -ld *(-/DN)'
alias lsd='ls -d *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'
alias gvim='gvim -geom 82x35'


alias ..='cd ..'
alias -g G='| grep -'
alias -g GV='| grep -v -'
alias -g L='| less'

alias g='git'
#alias s='screen'

alias tmux='tmux -u2'
alias t='tmux -u2'
alias ts='tmux new -s'

alias tsh='tmux new -s $(basename $PWD)'
alias tl='tmux ls'
alias ta='tmux attach -t'
alias th='teamocil --here'

alias vim="vimx"
alias gs='g s'
alias gl='g l'

vv() { screen -X chdir `pwd`; screen -X screen;}
alias vvv="vv && vv && vv;"

alias v--='amixer set Master 6553.6-'
alias v-='amixer set Master 3276.8-'
alias v++='amixer set Master 6553.6+'
alias v+='amixer set Master 3276.8+'
alias knoise='killall noise'




alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=eog
alias -s jpg=eog
alias -s gif=eog
alias -s sxw=soffice
alias -s doc=ooffice
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf


alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s dat=$EDITOR
alias -s cpp=$EDITOR
alias -s h=$EDITOR
#alias -s py=$EDITOR
alias -s PKGBUILD=$EDITOR



bindkey '\ee' edit-command-line
bindkey '^F' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey -M viins '^O' copy-prev-shell-word
bindkey '^P' push-line




if [ -f  ~/.zsh/zsh_functions ]; then
  source ~/.zsh/zsh_functions
else
  print "zsh_functions not loaded"
fi


# makes notmuch search work in mutt 
# no longer needed since I got perlbrew working :)
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

#autocompletion.. teamocil
compctl -g '~/.teamocil/*(:t:r)' teamocil
