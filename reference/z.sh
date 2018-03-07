#!/bin/bash

LOGIN=""
INTER=""

if [ "$#" -eq "2" ] ; then
	LOGIN="$1"
	INTER="$2"
fi

while [ "$LOGIN" != "y" ] && [ "$LOGIN" != "n" ] ; do
	echo "login? (y/n)"
	read LOGIN
done

while [ "$INTER" != "y" ] && [ "$INTER" != "n" ] ; do
	echo "interactive? (y/n)"
	read INTER
done

echo "/etc/zshenv"
echo "~/.zshenv"

if [ "$LOGIN" == "y" ] ; then
	
	echo "~/.zprofile"
	if [ "$INTER" == "y" ] ; then
		echo "~/.zshrc"
	fi
	echo "~/.zlogin"
elif [ "$INTER" == "y" ] ; then
	echo "~/.zshrc"
fi

echo "(running...)"

if [ "$LOGIN" == "y" ] ; then
	echo "~/.zlogout"
fi

