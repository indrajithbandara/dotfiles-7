#!/bin/bash
# rebinds caps lock key to esc
# requires ~/.sweepswapper

if [ ! -e ~/.speedswapper ]; then
	echo "$HOME/.speedswapper does not exist."
	exit
fi

xmodmap ~/.speedswapper
