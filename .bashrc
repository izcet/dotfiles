
alias ls="ls -G"
alias grep="grep --color=auto"

export PATH="$PATH:$HOME/Library/Python/2.7/bin" # git review
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin" # rvm
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home # jruby
export JRUBY_OPTS=-J-Xmx1024m # jruby

# \[ doing this prevents non-printing characters from counting towards character wrap \]
# \u username of current user
# \h hostname up to the first '.' (pirated.space would be pirated)
# \w current working directory (full path, for just the basename use \W)
# \t used for time
# more can be found here: https://ss64.com/bash/syntax-prompt.html
# '' instead of "" makes the prompt evaluate faster
export PS1='\

\[\e[0;31m\]\u\
\[\e[0;30;1m\]@\
\[\e[0;32m\]\h\
\[\e[0;30;1m\]:\
\[\e[0;34m\]\w\
\[\n\e[30;1m\](\[\e[33m\]\$\
\[\e[30;1m\])</\
\[\e[1m`if (( "$?" )) ; then echo -e "\e[31m" ; else echo -e "\e[32m" ; fi`\]^\
\[\e[0;30;1m\]\\>\
\[\e[0m\] '

alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias vv="vim ~/.vimrc"

if [ -n "$(which colordiff)" ] ; then
    alias diff="colordiff"
fi
