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
DEBUG=0

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
        # files cannot have spaces in the name, whatsoever
        line="`echo \"$line\" | cut -d'#' -f1 | cut -d' ' -f1`"

        # if the line is not empty
        if [ -n "$line" ] ; then
            ( cp -Rf "${HOME}/${line}" "${DEST}/${line}" 2&>1 >> "$LOG" )
            if (( $? )) ; then
                echo -e "${RED}x\c"
            else
                echo -e "${ORA}.\c"
            fi
            if [ "$DEBUG" = "1" ] ;  then
                tail -n 1 "$LOG"
            fi
        fi

    done < "$LIST"
    echo -e "${GRE}Done"

    # back up the files through git
    # i don't remember why I put this in a subshell but it works so I'll leave it alone

    cd "$REPO_DIR"
    (
    git add .

    if [ "`git status | wc -l | tr -d ' '`" -gt "3" ] ; then

        MESSAGE="`$GIT_COMMIT`"
        if [ -n "$MESSAGE" ] ; then
            echo -e "${ORA}${MESSAGE}"
            if [ "$DEBUG" = "0" ] ; then
                ( git commit -m "Automated commit of $MESSAGE" 2>&1 >> "$LOG" )
            fi
        fi

        echo "${BLU}Pushing to git remotes:\c"
        if [ "$DEBUG" = "0" ] ; then
            ( $GIT_PUSH 2>&1 >> "$LOG" )
            if (( $? )) ; then
                echo -e "${RED}x\c"
            else
                echo -e "${ORA}.\c"
            fi
        fi
        echo "${GRE}Done${NOC}"
    fi 
    )
    if [ "$DEBUG" = "0" ] ; then
        rm "$LOG"
    fi
    cd "$LAUNCHED"
fi

