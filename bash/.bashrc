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

# Source great things
source /usr/share/doc/pkgfile/command-not-found.bash

# Manual bash-completion
complete -c man which
complete -cf sudo proxychains4

# Change to 256color for your terminal applications
export TERM="xterm-256color"

# Exports
export VISUAL="vim"