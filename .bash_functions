### list of functions to source ###

randpw() 

{ 
	openssl rand -base64 12
}

cipher_check() 

{
	nmap --script ssl-enum-ciphers "$1"
}

check_gzip()

{
	curl -I -H 'Accept-Encoding: gzip,deflate' "$1" 2> /dev/null | grep --color 'Content-Encoding' && 'echo gzip enabled' || echo 'gzip not enabled' 
}

ns()

{
	dig +short "$1"
}

mx() 

{
	dig +short MX "$1"
}

open_urls()

{
	xargs -a "$1" firefox -new-tab "$line" 

}

check_open_resolver()

{
	nmap -sU -p 53 -sV -P0 --script "dns-recursion" "$1"
}

fix_spaces()

{
	for i in $1/*
    	do mv -v "$i" "$(echo $i | sed 's/ /_/g')"
	done
}
 
sqrt()

{
	[ $# -ne 1 ] && {
	  echo 'Usage: sqrt number'
	  exit 1
	} || {
   	  echo -e "sqrt($1)\nquit\n" | bc -q -i | head -2 | tail -1
}

cx()

{
	chmod +x $1
}

ssl()

{
	
	openssl s_client -connect $1:443
}

mem_usage()

{
	ps aux |grep -v USER|awk '{ cpu[$1]+=$3; rss[$1]+=$6; sum+=$6} END { for (user in cpu) printf("%-11s Memory: %9.1f MiB   CPU%%: %5.1f\n", user, rss[user]/1024, cpu[user]); } END {printf("Total Memory: %15.1f MiB", sum/1024);}'|sort -n -k3;echo;free -m|egrep -v 'Mem|Swap'	
}

swap_sum()

{
	# this will grab swap usage and each program using swap and total it.
	for dir in $(find /proc/ -maxdepth 1 -type d | egrep "^/proc/[0-9]") ; do pid=$(echo $dir | cut -d / -f 3);prog=$(ps -p $pid -o comm --no-headers|awk '{print $1}'); for swap in $(grep Swap $dir/smaps 2>/dev/null| awk '{print $2}');do let sum=$sum+$swap; done; echo "$prog $sum "|grep -vw 0;sum=0;done|awk '{ swap[$1]+=$2; sum+=$2} END { for (prog in swap) printf("%-15s Swap: %10.1f MiB\n", prog, swap[prog]/1024); } END {printf("Total Swap: %20.1f MiB", sum/1024);}'|sort -n -k3
}
