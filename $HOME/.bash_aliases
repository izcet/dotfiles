#!/bin/bash

# simple colorizations
#alias ls="ls -G"
alias grep="grep --color=always"
if [ -n "$(which colordiff)" ] ; then
    alias diff="colordiff"
fi

# .bashrc
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"

# .zshrc
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"

# .vimrc
alias vv="vim ~/.vimrc"

# because I'm bad at typing
alias vi="vim"
alias ivm="vim"

# shell hacks
alias cdc="cd ; clear"
alias ll="ls -la"

