#!/bin/sh
# generates todolist

arg="$1"

usage()
{
	echo "Usage: $(basename "$0") <max range value>"
	echo "Example: $(basename $0) 10 - would make a todolist with 1..10 values."
	exit 1
}

list()
{
	echo "Todolist for: $(date +%m_%d_%y)" 
	for i in $(seq $arg)
	do
		echo $i
	done

}

list
