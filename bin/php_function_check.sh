#!/bin/bash
# check if a php function exists on a system
# output results to a file

usage()	{
echo "Usage: $(basename $0) function_name > filename.php"
}

if [[ $1 = "--help" ]]; then
	usage
	exit 1
fi

if [[ $# != 1 ]]; then
	usage
	exit 1
fi

echo "<?php echo function_exists('"$1"')?'yes':'no'; ?>"
