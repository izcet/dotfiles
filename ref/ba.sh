#!/bin/bash

REMOT=""
LOGIN=""
INTER=""

########

if [ "$#" -eq "3" ] ; then
	REMOT="$1"
	LOGIN="$2"
	INTER="$3"
fi

########

while [ "$REMOT" != "y" ] && [ "$REMOT" != "n" ] ; do
	echo "remote? (y/n)"
	read REMOT
done

while [ "$LOGIN" != "y" ] && [ "$LOGIN" != "n" ] ; do
	echo "login? (y/n)"
	read LOGIN
done

while [ "$INTER" != "y" ] && [ "$INTER" != "n" ] ; do
	echo "interactive? (y/n)"
	read INTER
done

########

PUR=1
BLK=1
GRY=1
RED=1
YEL=1
GRE=1
BLU=1

if [ "$REMOT" == "y" ] ; then
	RED=0
	YEL=0
	GRE=0
	BLU=0
else
	PUR=0
	BLK=0
	GRY=0
fi	

if [ "$LOGIN" == "y" ] ; then
	GRY=0
	BLU=0
	GRE=0
else
	PUR=0
	BLK=0
	RED=0
	YEL=0
fi

if [ "$INTER" == "y" ] ; then
	YEL=0
	BLK=0
	BLU=0
	GRY=0
else
	RED=0
	PUR=0
	GRE=0
fi

########

if [ "$(($RED + $PUR + $YEL + $BLK))" -ne "0" ] ; then
	echo "/etc/profile"
fi

if [ "$(($PUR + $GRE + $GRY))" -ne "0" ] ; then
	echo "/etc/bash.bashrc"
fi

if [ "$(($YEL + $RED + $BLK + $PUR))" -ne "0" ] ; then
	echo "~/.profile"
	echo "~/.bash_profile"
	echo "~/.bash_login"
fi

if [ "$(($GRE + $GRY))" -ne "0" ] ; then
	echo "~/.bashrc"
fi

if [ "$(($YEL + $BLK + $BLU))" -ne "0" ] ; then
	echo "\$BASH_ENV"
fi

# Is this correct? 
# Does a Bash non-remote non-login non-interactive enter "running" mode? 
# or is this a bug in the graphic? 
# :thinking_face:
if [ "$BLU" -eq "0" ] ; then
	echo "(running...)"
fi

if [ "$(($RED + $YEL + $PUR))" -ne "0" ] ; then
	echo "~/.bash_logout"
fi
