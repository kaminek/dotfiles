# vim:ft=zsh:ts=2:sw=2:sts:et:
###############################################################################
#
#      ███████╗███████╗██╗  ██╗██████╗  ██████╗
#      ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#        ███╔╝ ███████╗███████║██████╔╝██║
#       ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#   ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#   ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
###############################################################################

#==============================================================================
#       General
#==============================================================================

# Internal functions

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null 2>&1 )
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

export DEFAULT_USER=$USER
export ZSH=$HOME/.oh-my-zsh
export PAGER=less

# Working/Dev directory
WORKING_DIR="Work"

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

# GoLang
# Go installation directory
# export GOPATH="$HOME/$WORKING_DIR/go"
# _prepend_to_path "$GOPATH/bin"
# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

if _is Darwin; then
  export GOROOT="$(brew --prefix golang)/libexec"
elif _is Linux; then
  export GOROOT=/usr/local/go
fi
_prepend_to_path "$GOROOT/bin"

# Language env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# local home bin path
export LOCAL_PATH=$HOME/.local/bin
_prepend_to_path $LOCAL_PATH

# misc bin path
_prepend_to_path /usr/local/sbin

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


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#==============================================================================
#       Configuration
#==============================================================================

# Command auto-correction.
ENABLE_CORRECTION="false"

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history

# use bash compatible failed globbing
setopt nonomatch


#==============================================================================
#       Functions
#==============================================================================

if [ -d $HOME/.zfuncs ]; then
  fpath=($HOME/.zfuncs $fpath)
  # Load custom function/cmd
  autoload -Uz kp sshc
fi

#==============================================================================
#       Extra Custom PATH
#==============================================================================

# local bins
_prepend_to_path $HOME/.bin

# Mysql-client
_prepend_to_path /usr/local/opt/mysql-client/bin


#==============================================================================
#       Key bindings
#==============================================================================

# Install proper key bindings for Home, PgDn, PgUp, etc.
bindkey -e

bindkey "\e[1~"   beginning-of-line
bindkey "\e[7~"   beginning-of-line
bindkey "\eOH"    beginning-of-line
bindkey "\e[H"    beginning-of-line

bindkey "\e[4~"   end-of-line
bindkey "\e[8~"   end-of-line
bindkey "\eOF"    end-of-line
bindkey "\e[F"    end-of-line

bindkey "\e[5~"   beginning-of-history
bindkey "\e[6~"   end-of-history

bindkey "\e[5C"   forward-word
bindkey "\e\e[C"  forward-word
bindkey "\eOc"    emacs-forward-word
bindkey "\e[1;5C" forward-word

bindkey "\e[5D"   backward-word
bindkey "\e\e[D"  backward-word
bindkey "\eOd"    emacs-backward-word
bindkey "\e[1;5D" backward-word

bindkey "\e[3~"   delete-char
bindkey "\e[2~"   quoted-insert
bindkey "^H"      backward-delete-word
bindkey "^i"      expand-or-complete-prefix

bindkey "\ew"     kill-region
bindkey -s "\el"  "ls\n"
bindkey -s "\e."  "..\n"
bindkey "^r"      history-incremental-search-backward
bindkey "^[[5~"   up-line-or-history
bindkey "^[[6~"   down-line-or-history


#==============================================================================
#       Antigen Zsh Plugin Manager
#==============================================================================

# source the script file
#source $HOME/.oh-my-zsh/tools/antigen.zsh
if _is Darwin; then
  source /usr/local/share/antigen/antigen.zsh
elif _is Linux; then
  source /usr/share/zsh/share/antigen.zsh
fi

# configuration vars
export ANTIGEN_PATH="$HOME/.antigen"
export ANTIGEN_BUNDLES="$ANTIGEN_PATH/plugins"
export ANTIGEN_LOG="$ANTIGEN_PATH/antigen.log"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle sudo
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# helpers
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Syntax highlighting bundle.
antigen bundle zdharma/fast-syntax-highlighting
#antigen bundle colored-man-pages

# Load the theme.
antigen theme romkatv/powerlevel10k

# Apply changes
antigen apply

autoload -Uz compinit


#==============================================================================
#       Misc
#==============================================================================

# Less
# enable color on ls
eval `$DIRCOLORS ~/.dircolors/dircolors.256dark`
export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

if _is Darwin; then
  # Prefer GNU version, since it respects dircolors.
  alias ls="() { $(whence -p gls) -Ctr --file-type --color=auto $@ }"
  # export CLICOLOR="YES" # Equivalent to passing -G to ls.
fi

# Improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case \
  --quit-if-one-screen --RAW-CONTROL-CHARS"

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

# https://github.com/gsamokovarov/jump
eval "$(jump shell)"

#==============================================================================
#       Source files
#==============================================================================

# Zsh
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# Aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom FZF cmd
# User ripgrep as search for fzf
if _has fzf && _has rg; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
  --color info:144,prompt:161,spinner:135,pointer:135,marker:118
  '
fi

# python certs
export REQUESTS_CA_BUNDLE=/usr/local/etc/openssl/cert.requests.pem
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.requests.pem


# source local functions
[[ -f $HOME/.local/bin/local_functions.sh ]] && \
  source $HOME/.local/bin/local_functions.sh

# Call upon launch if not in tmux
! [[ -n $TMUX ]] && neofetch


if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

complete -o nospace -C /usr/local/bin/vault vault

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
