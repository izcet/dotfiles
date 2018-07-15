
source "$HOME/.env"
source "$HOME/.alias"

DOTFILES="$HOME/dotfiles"
BACKUP="$DOTFILES/backup.sh"
if [ -f "$BACKUP" ] ; then
    /bin/zsh "$BACKUP"
fi
