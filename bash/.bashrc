#
# ~/.bashrc
#

[[ -f /etc/bash.bashrc ]] && \
  . /etc/bash.bashrc

[[ -f /usr/share/doc/pkgfile/command-not-found.bash ]] && \
  . /usr/share/doc/pkgfile/command-not-found.bash

# Modified commands
alias ls='ls --color=auto'
alias rm='rm -I'

# Manual bash-completion
complete -c man which
complete -cf sudo proxychains4

export VISUAL='vim'
# Ignore dups in bash history
export HISTCONTROL=ignoredups

shopt -s histverify
# Auto "cd" when entering just a path
shopt -s autocd
