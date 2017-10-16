###############################################################################
#
#		   ███████╗███████╗██╗  ██╗██████╗  ██████╗
#		   ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#		     ███╔╝ ███████╗███████║██████╔╝██║
#		    ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#		██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#		╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
###############################################################################

# Enviroment variables
export DEFAULT_USER="$USER"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PAGER=less
export TERM="xterm-256color"

case `uname` in
	Darwin)
		export PATH=$HOME/bin:/usr/local/bin:$PATH
		export ZSH=/Users/$USER/.oh-my-zsh
		export TERMINAL=iterm
		export VISUAL=atom
		DIRCOLORS=gdircolors
		;;
	Linux)
		#
		export PATH=$HOME/bin:$HOME/.scripts:$PATH
		export ZSH=/home/$USER/.oh-my-zsh
		export TERMINAL=urxvt
		export VISUAL=gvim
		DIRCOLORS=dircolors
		;;
esac

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi'
 else
   export EDITOR='vi'
fi

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
bindkey '^i'      expand-or-complete-prefix

bindkey '\ew'     kill-region
bindkey -s '\el'  "ls\n"
bindkey -s '\e.'  "..\n"
bindkey '^r'      history-incremental-search-backward
bindkey "^[[5~"   up-line-or-history
bindkey "^[[6~"   down-line-or-history

autoload -Uz compinit

	###	Antigen Zsh Plugin Manager	###

# source the script file
source $HOME/.oh-my-zsh/tools/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle sudo
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# helpers
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle colored-man-pages

# Load the theme.
#antigen theme robbyrussell
antigen theme bhilburn/powerlevel9k powerlevel9k

# Apply changes
antigen apply

#==============================================================================
#			PowerLevel9K Theme
#==============================================================================

# Font
POWERLEVEL9K_MODE='Knack Nerd Font'

# Prompt settings
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{cyan}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{161} $ %k%f%F{white}\ue0ce%f "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f"

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=""

# Context
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="cyan"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="cyan"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="cyan"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="black"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_left"

# Status
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="235"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="red"
POWERLEVEL9K_STATUS_OK_BACKGROUND="235"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="235"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

# OS segment
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_LINUX_ICON='%F{cyan}\uf300 %F{white}arch%F{cyan}linux%f'

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON="\uf1d3"
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uf113"
POWERLEVEL9K_VCS_STAGED_ICON="\uf055"
POWERLEVEL9K_VCS_UNSTAGED_ICON="\uf071"
POWERLEVEL9K_VCS_UNTRACKED_ICON="\uf00d"
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\uf0ab"
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\uf0aa"

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="red"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"

# VCS conf
POWERLEVEL9K_SHOW_CHANGESET=true

# Prompt elements
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context host dir_writable dir vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs status time)

# Status
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# Ssh
POWERLEVEL9K_SSH_FOREGROUND="yellow"
POWERLEVEL9K_SSH_BACKGROUND="235"

# Background jobs
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="235"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="magenta"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_ICON="\u231A"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="235"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="magenta"

# User
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="235"
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="cyan"
POWERLEVEL9K_USER_ROOT_BACKGROUND="235"
POWERLEVEL9K_USER_ROOT_FOREGROUND="red"
POWERLEVEL9K_USER_ICON="\uF415"
POWERLEVEL9K_ROOT_ICON="\u26A1"

# Host
POWERLEVEL9K_HOST_LOCAL_BACKGROUND="235"
POWERLEVEL9K_HOST_LOCAL_FOREGROUND="cyan"
POWERLEVEL9K_HOST_REMOTE_BACKGROUND="235"
POWERLEVEL9K_HOST_REMOTE_FOREGROUND="cyan"

POWERLEVEL9K_HOST_ICON="\uF109"
POWERLEVEL9K_HOST_ICON_FOREGROUND="red"
POWERLEVEL9K_HOST_ICON_BACKGROUND="black"
POWERLEVEL9K_SSH_ICON="\uF489"

POWERLEVEL9K_OS_ICON_BACKGROUND="235"
POWERLEVEL9K_OS_ICON_FOREGROUND="cyan"

# Battery
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='red'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='yellow'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='green'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='blue'

# Time
POWERLEVEL9K_TIME_FORMAT="%F{black}\uf017 %D{%I:%M}%f"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_TIME_BACKGROUND="235"


# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Source files
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# enable color on ls
 eval `$DIRCOLORS ~/.dircolors/dircolors.256dark`

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
# Call upon launch
screenfetch

# Use fzf for lookup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
