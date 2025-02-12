#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LC_COLLATE="C"
alias ls='ls --group-directories-first --color=auto'
PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoreboth
export HISTSIZE=-1
export HISTFILESIZE=-1

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip - selection clipboard -o'

function icy () {
  ps -ax |\
    grep $1 |\
    grep -v grep |\
    sed 's/^\(\s\+\)//' |\
    cut -f1 -d' ' |\
    xargs -I % kill -9 -- %
}
export -f icy

export PATH="$PATH:~/.bin/"

# auto "cd" when just a path is entered
#
#   $ /etc
#   bash: /etc: Is a directory
# 
# becomes
#   $ /etc
#   cd /etc
#
shopt -s autocd

alias datetime="date +%F_%H-%M-%S"

eval $(ssh-agent)
