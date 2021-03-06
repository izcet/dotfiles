
GPP_EDITOR=vim

alias gi="$GPP_EDITOR .gitignore"

function gp () {
    BRANCH="$(git branch | grep "^\*" | cut -c3-)"
    if [ $# != 0 ] ; then
        echo "${GPP_PURPLE}Pushing to branch \"${GPP_GREEN}$BRANCH${GPP_PURPLE}\""
		while [ "$1" != "" ] ; do
			echo -n "${GPP_GREEN}$1: ${GPP_PURPLE}"
			git push $1 $BRANCH
			shift
		done
	else
		GPP_TEMP_FILE="/tmp/gpp_$(whoami)_temp.txt"
		git remote > $GPP_TEMP_FILE
		while read line ; do
			echo -n "${GPP_GREEN}$line: ${GPP_PURPLE}"
			git push $line $BRANCH
		done < $GPP_TEMP_FILE
		rm -rf $GPP_TEMP_FILE
	fi
	echo -n "$GPP_NOCOLOR"
}

alias gu="git pull"
alias gd="git diff"
alias gs="git status"
alias ga="git add ."

function gc () {
	git commit -m "$(/Users/isaac.rhett/.gpp_resources/commit_script.sh $@)"
}

function gall () {
	gs && ga && gs && gc $@ && gp
	gs
}

