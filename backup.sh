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
RED="\e[31m"
GRE="\e[32m"
ORA="\e[33m"
BLU="\e[34m"
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
    echo -e "${BLU}Backing up dotfiles. Copying:\c"
	
    # for each line in $LIST
    while read line ; do

        # strip out comments
        line="`echo \"$line\" | cut -d'#' -f1`"
        
        # if the line is not empty
        if [ -n "$line" ] ; then
            ( cp -rf "${HOME}/${line}" "${DEST}" &> "$LOG" )
            if (( $? )) ; then
                echo -e "${RED}x\c"
            else
                echo -e "${ORA}.\c"
            fi
        fi

    done < "$LIST"
    echo -e "${GRE} Done"

    # back up the files through git
    # i don't remember why I put this in a subshell but it works so I'll leave it alone
	
    cd "$REPO_DIR"
    (
    git add .

	if [ "`git status | wc -l | tr -d ' '`" -gt "3" ] ; then

        MESSAGE="`$GIT_COMMIT`"
        if [ -n "$MESSAGE" ] ; then
            echo -e "${ORA}${MESSAGE}"
            ( git commit -m "Automated commit of $MESSAGE" 2>&1 >> "$LOG" )
        fi

		echo "${BLU}Pushing to github... \c"
        ( $GIT_PUSH &> "$LOG" )
        if (( $? )) ; then
            echo -e "${RED}[!] \c"
        fi
        echo "${GRE}Done${NOC}"
	fi 
    )

    cd "$LAUNCHED"
fi

