#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

export HISTCONTROL=ignoredups
export PATH="$PATH:/home/niklash/bin"

shopt -s autocd
shopt -s checkwinsize

# Handy aliases
alias la="ls -a"
alias ll="ls -l"
alias l="ls -hatrl"

alias ls='ls --color=auto'

alias sshpi='ssh pi@88.114.239.186'

export PS2=':D '
export PS1='\[$(tput setaf 7)\]\u\[$(tput sgr0)\]@\[$(tput bold)$(tput setaf 1)\]\h\[$(tput sgr0)\] \w $ '
export EDITOR=vim

