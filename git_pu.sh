#!/bin/zsh    

# I use different branches for different computers/profiles
BRANCH="$(git branch | grep "^\*" | cut -c3-)"
TEMP_FILE="`whoami`_git_`date | base64`.tmp"

function on_exit {
    rm -rf $TEMP_FILE
}
trap on_exit EXIT

# for each remote
git remote > $TEMP_FILE
while read line ; do
    
    # push to that remotes branch
    ( git push $line $BRANCH 2>&1 > /dev/null )

done < $TEMP_FILE
