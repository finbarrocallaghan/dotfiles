#.zshrc

autoload -U colors && colors

PROMPT='%{$fg[yellow]%}%B%c/%b%{$reset_color%} $(git_prompt_info)%(!.#.$) '
RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg_no_bold[blue]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'


#BROWSER="firefox"
EDITOR="vim"
HISTFILE=~/.zsh_history
HISTSIZE=50000
LISTMAX=999
MAIL=0
PAGER="less"
SAVEHIST=50000

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

alias less='less -RXF'
alias ls='ls --color=auto -F'
alias lsdirs='ls -ld *(-/DN)'
alias lsd='ls -d *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'

alias ..='cd ..'
alias -g G='| grep -'
alias -g GV='| grep -v -'
alias -g L='| less'


alias tmux='tmux -u2'
alias t='tmux -u2'
alias ts='tmux new -s'

alias tsh='tmux new -s $(basename $PWD)'
alias tl='tmux ls'
alias ta='tmux attach -t'
alias th='teamocil --here'



bindkey '\ee' edit-command-line
bindkey '^F' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey -M viins '^O' copy-prev-shell-word
bindkey '^P' push-line


#-------
#vi mode
#-------
bindkey -v                      
zle -N edit-command-line

#---
#git
#---

alias g='git'
compdef _git g=git
alias gs='g s'
alias gl='g l'

alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gst='git status'
compdef _git gst=git-status
alias gco='git checkout'
compdef _git gco=git-checkout


function git_prompt_info() {                                                     
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return                            
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}                                                                                
                                                                                 
# Checks if working tree is dirty                                                
parse_git_dirty() {                                                              
  local SUBMODULE_SYNTAX=''                                                      
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then                                           
        SUBMODULE_SYNTAX="--ignore-submodules=dirty"                             
  fi                                                                             
  if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then           
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"                                           
  else                                                                           
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"                                           
  fi                                                                             
}                                                                                
