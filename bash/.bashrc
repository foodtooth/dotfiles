#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Modified commands
alias ls='ls --color=auto'
alias rm='rm -I'

# Customise PS1
PS1='[\u@\h \W]\$ '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# Manual bash-completion
complete -c man which
complete -cf sudo proxychains4

# Change to 256-color for your terminal applications
export TERM="xterm-256color"

export VISUAL="vim"
