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

# Change to 256-color for your terminal applications
export TERM='xterm-256color'

export VISUAL='vim'

shopt -s histverify
