#!/usr/bin/env bash
# vim:ft=sh:ts=2:sw=2:sts:et:
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
	return $(command -v $1 >/dev/null 2>&1)
}

# Returns whether the current host type is what we think it is. (HOSTTYPE is
# set later.)
_is() {
	return $([ "$HOSTTYPE" = "$1" ])
}

# Returns whether the given statement executed cleanly.
_try() {
	return $(eval $* >/dev/null 2>&1)
}

_prepend_to_path() {
	if ! [ -d $1 ]; then
		mkdir -p $1
	fi
	export PATH="$PATH:$1"
}

_append_to_path() {
	if ! [ -d $1 ]; then
		mkdir -p $1
	fi
	export PATH="$1:$PATH"
}

# Enviroment variables

export DEFAULT_USER=$USER
export ZSH=$HOME/.oh-my-zsh
export PAGER=less

if [ "$TMUX" = "" ]; then
	export TERM="xterm-256color"
else
	export TERM="screen-256color"
fi
# Use custom path for tmux socket
export TMUX_TMPDIR=$HOME/.tmux

if _has hostname; then
	HOSTNAME=$(hostname)
elif _has uname; then
	HOSTNAME=$(uname -n)
else
	HOSTNAME="unknown"
fi
export HOSTNAME

# HOSTTYPE = { Linux | OpenBSD | SunOS | etc. }
if _has uname; then
	HOSTTYPE=$(uname -s)
else
	HOSTTYPE="unknown"
fi
export HOSTTYPE

# GoLang
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
_append_to_path $GOBIN

# Language env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# local home bin path
export LOCAL_PATH=$HOME/.local/bin
_prepend_to_path $LOCAL_PATH

# misc bin path
_prepend_to_path /usr/local/sbin

# Cargo bin path
_prepend_to_path $HOME/.cargo/bin

export TERMINAL="alacritty"
export VISUAL="gvim"
export EDITOR="nvim"

export GPG_KEYID=0x239BDC0C10526EC6
export SOPS_AGE_KEY_FILE=$HOME/.config/sops/age/keys.txt

#==============================================================================
#       Configuration
#==============================================================================

# Command auto-correction.
ENABLE_CORRECTION="false"

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
MANPAGER='nvim +Man!'

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

SSH_ENV="$HOME/.ssh/agent-environment"
function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" >/dev/null
	/usr/bin/ssh-add
}

function gpg_restart {
	pkill gpg
	pkill pinentry
	pkill ssh-agent
	eval $(gpg-agent --daemon --enable-ssh-support)
}
#==============================================================================
#       Extra Custom PATH
#==============================================================================

# local bins
_prepend_to_path $HOME/.bin

#==============================================================================
#       Key bindings
#==============================================================================

# Alias the main keymap to the viins keymap.
bindkey -e
# get to vi normal mode with the key sequence ^X^V

#==============================================================================
#       Zsh Plugin Manager
#==============================================================================

# zplug
if _is Linux; then
	source /usr/share/zsh/scripts/zplug/init.zsh
fi

zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions

# Syntax highlighting bundle.
zplug zdharma-continuum/fast-syntax-highlighting

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
	printf "Install? [y/N]: "
	if read -q; then
		echo
		zplug install
	fi
fi

zplug load

#==============================================================================
#       Misc
#==============================================================================

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
#       Source files
#==============================================================================

# Aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# FZF
if _is Darwin; then
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif _is Linux; then
	[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
	[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
fi

# Custom FZF cmd
# User ripgrep as search for fzf
if _has fzf && _has fd; then
	export FZF_COMPLETION_TRIGGER='~~'
	export FZF_COMPLETION_OPTS='--border --info=inline'
	#export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
	export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_DEFAULT_OPTS='
  --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
  --color info:144,prompt:161,spinner:135,pointer:135,marker:118
  '
	# - The first argument to the function ($1) is the base path to start traversal
	_fzf_compgen_path() {
		fd --hidden --follow --exclude ".git" . "$1"
	}
	# Use fd to generate the list for directory completion
	_fzf_compgen_dir() {
		fd --type d --hidden --follow --exclude ".git" . "$1"
	}
	# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
	# - The first argument to the function is the name of the command.
	# - You should make sure to pass the rest of the arguments to fzf.
	#_fzf_comprun() {
	#  local command=$1
	#  shift

	#  case "$command" in
	#    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
	#    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
	#    ssh)          fzf "$@" --preview 'dig {}' ;;
	#    *)            fzf "$@" ;;
	#  esac
	#}
fi

# SSH agent
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" >/dev/null
	#ps ${SSH_AGENT_PID} doesn't work under cywgin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ >/dev/null || {
		start_agent
	}
else
	start_agent
fi

# certs bundle
if _is Darwin; then
	export CURL_CA_BUNDLE=/usr/local/etc/ca-certificates/cert.pem
	export REQUESTS_CA_BUNDLE=/usr/local/etc/ca-certificates/cert.pem
	export SSL_CERT_FILE=/usr/local/etc/ca-certificates/cert.pem
elif _is Linux; then
	export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
	export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
	export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
fi

# source local functions
[[ -f $HOME/.local/bin/local_functions.sh ]] &&
	source $HOME/.local/bin/local_functions.sh

# source custom env vars
[[ -f $HOME/.custom_envs ]] &&
	source $HOME/.custom_envs

# Call upon launch if not in tmux
! [[ -n $TMUX ]] && neofetch

if _has kubectl; then
	source <(kubectl completion zsh)
	_prepend_to_path $HOME/.krew/bin
fi

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# XXX:completion for k alias?
#compdef __start_kubectl k

if _has terraform; then
	complete -o nospace -C /usr/bin/terraform terraform
fi

if _has aws; then
	complete -C '/sbin/aws_completer' aws
fi

eval "$(zoxide init zsh)"

[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

# Starship prompt
eval "$(starship init zsh)"
