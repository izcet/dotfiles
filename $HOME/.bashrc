#!/bin/bash

source "$HOME/.env"
source "$HOME/.alias"

DOTFILES="$HOME/.dotfiles"
BACKUP="$DOTFILES/backup.sh"
if [ -f "$BACKUP" ] ; then
	/bin/zsh "$BACKUP"
fi

# Git Push Plus
# Author: Isaac Rhett
# Repo: https://github.com/izcet/gitpushplus
export GPP_DIR='/Users/isaac.rhett/.gpp_resources/'
export GPP_GREEN='[0;32m'
export GPP_BLUE='[0;34m'
export GPP_PURPLE='[0;35m'
export GPP_RED='[0;31m'
export GPP_NOCOLOR='[0m'
source ${GPP_DIR}aliases.sh
# End Git Push Plus

# Dot Slash is too much typing, stolen shamelessly from jsears
function sbt(){
	local pwd=$(pwd)
	local opts="-J-Xmx12G"
	if [ -f "${pwd}/sbt" ] && [ -x "${pwd}/sbt" ]; then
		./sbt $opts $*
	else
		if command -v jenv > /dev/null; then
			jenv exec sbt $opts $*
		else
			sbt $opts $*
		fi
	fi
}

function afk() {
  local MINS="${1:-30}"
  local DATE="$(date -v "+${MINS}M" +'%H:%M') EST"
  local MESG="/status :flying_saucer: AFK - will be back around ${DATE}"
  
  echo "$MESG" | pbcopy
  echo "'$MESG' added to clipboard"
}
  
export JAVA_TOOL_OPTIONS="-XX:MaxJavaStackTraceDepth=-1"

# brew
echo 'export PATH="/usr/local/sbin:$PATH"' >> /Users/isaac.rhett/.bash_profile

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export JAVA_HOME=/Users/isaac.rhett/openjdk/jdk8u212-b03/Contents/Home

export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/libi -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export BASH_SILENCE_DEPRECATION_WARNING=1

