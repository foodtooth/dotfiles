#
# ~/.bashrc
#

[[ -f /etc/bash.bashrc ]] && \
  . /etc/bash.bashrc

# Modified commands
alias ls='ls --color=auto'
alias rm='rm -I'

# Manual bash-completion
complete -c man which
complete -cf sudo proxychains4

export VISUAL='vim'
# Ignore dups in bash history
export HISTCONTROL=ignoredups
