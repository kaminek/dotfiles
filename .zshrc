
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
		;;
	Linux)
		#
		export PATH=$HOME/bin:$HOME/.scripts:$PATH
		export ZSH=/home/$USER/.oh-my-zsh
		export TERMINAL=urxvt
		export VISUAL=gvim
		;;
esac

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi'
 else
   export EDITOR='vi'
fi

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

	###	Begin PowerLevel9K Theme	###
# Font
POWERLEVEL9K_MODE='Knack Nerd Font'
# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{black}%k"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{161} $ %k%f%F{white}\ue0ce%f "

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0ce'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0cf'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b6'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b7'

# Context
DEFAULT_USER="andrea"
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND='yellow'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='yellow'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='red'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# OS segment
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_LINUX_ICON='%F{cyan}\uf300 %F{white}arch%F{cyan}linux%f'

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf071'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=true

# Status
POWERLEVEL9K_OK_ICON=$'\uf164'
POWERLEVEL9K_FAIL_ICON=$'\uf165'
POWERLEVEL9K_CARRIAGE_RETURN_ICON=$'\uf165'

# Battery
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='red'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='yellow'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='green'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='blue'

# Time
POWERLEVEL9K_TIME_FORMAT="%F{black}\uf017 %D{%I:%M}%f"
POWERLEVEL9K_TIME_BACKGROUND='blue'

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs status time)
	###	End PowerLevel9K Theme	###

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Source files
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# enable color on ls
 eval `dircolors ~/.dircolors`

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
