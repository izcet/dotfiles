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

# I'm gross and not worthy of life
alias npm="nodejs"
alias jsc="nodejs"

# xclip can read/write from/to standard input/output and files
#alias pbcopy='xclip -selection clipboard'
#alias pbpaste='xclip -selection clipboard -o'

# xsel can only read/write from/to standard input/output
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'


alias fsource="type -a"
alias discordsongs="cat ~/songs | sort -R | sed 's/.*/-p &/'"
alias discordtrash="echo \"-p \`head -c 20 /dev/random | base64 | head -c \"\$((3 + \$( get_rand 6 ) )) \" \` \" | pbcopy"
alias killminecraft="ps -aux | grep -i minecraft | grep -v grep | cut -f5 -d' ' | xargs -I % kill %"
alias repdf="make re ; firefox *.pdf"
