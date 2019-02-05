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

