#!/bin/zsh

################################################################################
# VARIABLES

# the directory that this script was launched from
LAUNCHED="`pwd`"

# the actual location of this script
REPO_DIR="`dirname \"$0\"`"

# the files to be backed up
LIST="${REPO_DIR}/backup.list"

# the destination directory in the repository
DEST="${REPO_DIR}/\$HOME"

GIT_COMMIT="${REPO_DIR}/git_commit.sh"
GIT_PUSH="${REPO_DIR}/git_pu.sh"

# colors
BLU="\e[34m"
GRE="\e[32m"
ORA="\e[33m"
NOC="\e[0m"

# for any debugging
LOG="/tmp/`whoami`-backup-`date | base64`.log"

################################################################################
# BODY

# only copy files if this script is run from the home folder
if [ "$LAUNCHED" = "$HOME" ] ; then

    echo -e "`date`" >> "$LOG"

    # clear any existing formatting
    echo -e "${NOC}\c"
    echo -e "${BLU}Backing up dotfiles. Copying... \c"
	
    # for each line in $LIST
    while read line ; do

        # strip out comments
        line="`echo \"$line\" | cut -d'#' -f1`"
        
        # if the line is not empty
        if [ -n "$line" ] ; then
            ( cp -rf "${HOME}/${line}" "${DEST}" 2>&1 >> "$LOG" )
        fi

    done < "$LIST"
    echo -e "${GRE}Done"

    # back up the files through git
    # i don't remember why I put this in a subshell but it works so I'll leave it alone
	
    cd "$REPO_DIR"
    (
    git add .

	if [ "`git status | wc -l | tr -d ' '`" -gt "3" ] ; then
		echo -e "${ORA}\c"

        MESSAGE="`$GIT_COMMIT "\`date\`"`"
        ( git commit -m "$MESSAGE" 2>&1 >> "$LOG" )

		echo "${BLU}Pushing to github... \c"
        $GIT_PUSH
        echo "${GRE}Done${NOC}"
	fi 
    )

    cd "$LAUNCHED"
fi

