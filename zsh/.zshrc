#.zshrc

autoload -U colors; colors
autoload -U compinit; compinit

export LSCOLORS="Gxfxcxdxbxegedabagacad"

export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

EDITOR="vim"
HISTFILE=~/.zsh_history
HISTSIZE=50000
LISTMAX=999
MAIL=0
PAGER="less"
SAVEHIST=50000
P4DIFF="vimdiff"
C_VIM_TEMP_FILE="/tmp/cvim.tmp"
GREP_OPTIONS="--color=auto"

setopt prompt_subst
setopt appendhistory
setopt autocd
setopt autopushd
setopt banghist
setopt extendedglob
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_appendhistory
setopt interactivecomments
setopt noclobber
setopt nohup
setopt nomatch
setopt notify
setopt pushdminus
setopt pushdsilent
setopt pushdignoredups
setopt pushdtohome
setopt share_history
setopt nocdablevars
setopt braceccl
unsetopt beep

zmodload -i zsh/complist

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*:processes' command "ps auxw"

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -U zmv
autoload -U zed
autoload -U zargs
autoload -U edit-command-line

#-------
#prompt
#-------
autoload -Uz vcs_info

zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' use-server true

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '^'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' enable git hg p4
zstyle ':vcs_info:*' actionformats  '%b%c%u|%a '
zstyle ':vcs_info:*' formats $'%{\e[0;93m%}%b%{\e[0m%}%{%F%{\e[0;91m%}%}%c%u %f'
precmd() { vcs_info }

return_code=$'%(?..%B%F %{\e[0;92m%}[%F%{\e[0;91m%}%?%F%{\e[0;92m%}]%f)'

# figuring out colour codes: for f ({01..99}) print "\e[0;${f}m\\\e[0;${f}m"
#B (%b) Start (stop) boldface mode.
#%F (%f) Start (stop) using a different foreground colour
PROMPT=$'%{\e[0;92m%}%B%c/ %{\e[0m%}${vcs_info_msg_0_}%(!.#.$) %b'
RPROMPT=$'${return_code}%B%F%{\e[0;92m%}[%f%b%*%B%F%{\e[0;92m%}]%f'

#-------
#general
#-------

alias less='less -RXF'
alias ls='ls --color=auto -F'
alias lsdirs='ls -ld *(-/DN)'
alias lsd='ls -d *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias dir='ls -1'

alias ..='cd ..'
alias -- -='cd -'
alias -g G='| grep -'
alias -g GV='| grep -v -'
alias -g L='| less'

alias gvim='gvim -geom 82x35'
alias tmux='tmux -u2'

#-------
#vi mode
#-------
bindkey -v

zle -N edit-command-line
bindkey '\ee' edit-command-line

bindkey -M viins '^O' copy-prev-shell-word
bindkey '^P' push-line

bindkey '^F' history-incremental-search-backward
bindkey '^G' history-incremental-search-forward

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#---
#git
#---

alias g='git'
compdef _git g=git

alias gs='g s'
alias gl='g l'
alias gls='g ls'
alias gds='g ds'
alias ga='g a'

alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gst='git status'
compdef _git gst=git-status
alias gco='git checkout'
compdef _git gco=git-checkout


#----------
#ealiases
#----------

ealiases=()

function ealias()
{
alias $1
ealiases+=(${1%%\=*})
}

function expand-ealias()
{
if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)ealiases})\$" ]]; then
    zle _expand_alias
    zle expand-word
fi
zle magic-space
}

zle -N expand-ealias

bindkey -M viins ' '    expand-ealias
bindkey -M viins '^ '   magic-space # control-space to bypass completion
bindkey -M isearch " "  magic-space # normal space during searches


#------------
#tmux &
#  (ealiases)
#------------

function tms {
  args=$@
  tmux send-keys -t bottom "$args" C-m
}

ealias ts='tmux new -s'
ealias tsh='tmux new -s $(basename $PWD)'
ealias tl='tmux ls'
ealias ta='tmux attach -t'

#--------------------------
#source stuff; if it exists
#--------------------------

if [ -d ~/bin ]; then
path=(~/local/bin $path)
fi

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if [ -d ~/.zsh/completions ]; then
fpath=($fpath ~/.zsh/completions)
fi


if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


if [ -f  ~/.zsh/zsh_functions ]; then
  source ~/.zsh/zsh_functions
fi
