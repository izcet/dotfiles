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
DEBUG="0"

TEMP_FILE="/tmp/`whoami`_git_`date | base64`.tmp"


################################################################################
# FUNCTIONS

function on_exit {
    rm -rf "$TEMP_FILE"
}
trap on_exit EXIT


################################################################################
# BODY

# only copy files if this script is run from the home folder
if [ "$LAUNCHED" = "$HOME" ] ; then

    echo -e "`date`" >> "$LOG"

    # clear any existing formatting
    echo -e "${NOC}\c"
    echo -e "${BLU}Backing up dotfiles:\c"

    # for each line in $LIST
    while read line ; do

        # strip out comments
        # files cannot have spaces in the name, or this will break them
        LINE="`echo \"$line\" | cut -d'#' -f1 | cut -d' ' -f1`"

        # if the line is not empty
        if [ -n "$LINE" ] ; then

            OLD="${DEST}/${LINE}"
            NEW="${HOME}/${LINE}"
            ( diff "$OLD" "$NEW" &> /dev/null )

            # if the files differ
            if (( $? )) ; then

                # overwrite the old one
                if [ -d "$NEW" ] ; then
                    ( cp -rf "$NEW" "$DEST" 2>&1 >> "$LOG" )
                else
                    ( cp -rf "$NEW" "$OLD" 2>&1 >> "$LOG" )
                fi

                # if there was an error during the copy
                if (( $? )) ; then
                    echo -e "${RED}x\c"
                else
                    echo -e "${ORA}.\c"
                fi

                # if we're in debug, print the result of the last command
                if [ "$DEBUG" = "1" ] ;  then
                    tail -n 1 "$LOG"
                fi

            else
                # no difference
                echo -e "${CYA}.\c"
            fi
        fi

    done < "$LIST"
    echo -e "${GRE}Done"

    # back up the files through git
    cd "$REPO_DIR"
    (
    git add .

    if [ "`git status | wc -l | tr -d ' '`" -gt "3" ] ; then

        MESSAGE="`$GIT_COMMIT`"

        # if the message is non-null, aka there were changes to commit
        if [ -n "$MESSAGE" ] ; then

            # print the message to the user
            echo -e "${ORA}${MESSAGE}"

            # if this is live, push it to git each remote/{current branch}
            if [ "$DEBUG" = "0" ] ; then
               
                ( git commit -m "Automated commit of $MESSAGE" 2>&1 >> "$LOG" )
                echo "${BLU}Pushing to git remotes:\c"

                # I use different branches for different computers/profiles
                BRANCH="$(git branch | grep "^\*" | cut -c3-)"

                # for each remote
                git remote > $TEMP_FILE

                while read line ; do

                    # push to that remotes branch
                    ( git push $line $BRANCH &> /dev/null )
                    if (( $? )) ; then
                        echo -e "${RED}x\c"
                    else
                        echo -e "${ORA}.\c"
                    fi

                done < $TEMP_FILE
            fi
            echo "${GRE}Done${NOC}"
        fi
    fi 
    )

    # keep the log files from sticking around unless we're in debug mode
    if [ "$DEBUG" = "0" ] ; then
        rm -rf "$LOG"
    fi

    # return home
    cd "$LAUNCHED"
fi

