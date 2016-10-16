#!/bin/sh
#program to print a greeting

hour=$(date +%H)

case "$hour" in 
	0? | 1[01] )	echo "Good morning $USER";;
	1[2-7] 	   )	echo "Good afternoon $USER";;
	*	   )	echo "Good evening $USER";;
esac
