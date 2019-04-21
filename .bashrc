# vim:ft=zsh:ts=2:sw=2:sts:et:

#==============================================================================
#			General
#==============================================================================

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Internal functions

# Returns whether the given command is executable or aliased.
_has() {
  return $( which $1 >/dev/null 2>&1 )
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
  return $( [ "$HOSTTYPE" = "$1" ] )
}

# Returns whether the given statement executed cleanly.
_try() {
  return $( eval $* >/dev/null 2>&1 )
}

_prepend_to_path() {
  if [ -d $1 ]; then
    export PATH="$PATH:$1" ;
  fi
}

_append_to_path() {
  if [ -d $1 ]; then
    export PATH="$1:$PATH" ;
  fi
}

# Enviroment variables

PS1="\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h"
export PS1="$PS1:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] "

export DEFAULT_USER=$USER
export PAGER=less

if [ "$TMUX" = "" ]; then
  export TERM="xterm-256color"
else
  export TERM="screen-256color"
fi
# Use custom path for tmux socket
export TMUX_TMPDIR=$HOME/.tmux

if _has hostname; then
  HOSTNAME=`hostname`
elif _has uname; then
  HOSTNAME=`uname -n`
else
  HOSTNAME="unknown"
fi
export HOSTNAME

# HOSTTYPE = { Linux | OpenBSD | SunOS | etc. }
if _has uname; then
  HOSTTYPE=`uname -s`
else
  HOSTTYPE="unknown"
fi
export HOSTTYPE

# Go installation directory
export GOROOT=/usr/local/go
# Go working dir
export GOPATH=$HOME/Work/go
_prepend_to_path $GOROOT/bin

# Language env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# local home bin path
export LOCAL_PATH=$HOME/.local/bin
_prepend_to_path $LOCAL_PATH

# misc bin path
_prepend_to_path /usr/local/sbin
_prepend_to_path /usr/games

if _is Darwin; then
	export TERMINAL="iterm"
	export VISUAL="gvim"
	DIRCOLORS=gdircolors
elif _is Linux; then
	export TERMINAL="urxvt"
	export VISUAL="gvim"
	DIRCOLORS=dircolors
fi

# editor
export EDITOR="vim"


#==============================================================================
#			Misc
#==============================================================================

alias ls='ls -Ctr --file-type --color=auto'

# enable color on ls
if _has dircolors; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" \
    || eval "$(dircolors -b)"
fi


HISTSIZE=1000
HISTFILESIZE=2000
HIST_STAMPS="mm/dd/yyyy"
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend

# Improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

# Colored man pages using less as pager
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#==============================================================================
# 			Source files
#==============================================================================

# aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# fzf
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && \
  source /usr/local/etc/profile.d/autojump.sh

# source local functions
[ -f $HOME/.local/bin/local_functions.sh ] && \
  source $HOME/.local/bin/local_functions.sh
