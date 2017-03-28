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
	[ $# -ne 1 ] && 
	{
	  echo 'Usage: sqrt number'
	  exit 1
	} ||
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


# this will grab swap usage and each program using swap and total it.
swap_sum()

{
	for dir in $(find /proc/ -maxdepth 1 -type d | egrep "^/proc/[0-9]") ; do pid=$(echo $dir | cut -d / -f 3);prog=$(ps -p $pid -o comm --no-headers|awk '{print $1}'); for swap in $(grep Swap $dir/smaps 2>/dev/null| awk '{print $2}');do let sum=$sum+$swap; done; echo "$prog $sum "|grep -vw 0;sum=0;done|awk '{ swap[$1]+=$2; sum+=$2} END { for (prog in swap) printf("%-15s Swap: %10.1f MiB\n", prog, swap[prog]/1024); } END {printf("Total Swap: %20.1f MiB", sum/1024);}'|sort -n -k3
}

# Extra many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract() 

{
  	if [ -f "$1" ]; then
    	  case "$1" in
      	    *.tar.bz2)  tar -jxvf "$1"                        ;;
      	    *.tar.gz)   tar -zxvf "$1"                        ;;
      	    *.bz2)      bunzip2 "$1"                          ;;
      	    *.dmg)      hdiutil mount "$1"                    ;;
      	    *.gz)       gunzip "$1"                           ;;
      	    *.tar)      tar -xvf "$1"                         ;;
      	    *.tbz2)     tar -jxvf "$1"                        ;;
      	    *.tgz)      tar -zxvf "$1"                        ;;
      	    *.zip)      unzip "$1"                            ;;
      	    *.ZIP)      unzip "$1"                            ;;
      	    *.pax)      cat "$1" | pax -r                     ;;
      	    *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      	    *.Z)        uncompress "$1"                       ;;
      	    *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    	  esac
         else
          echo "'$1' is not a valid file to extract"
        fi
}

#global_python()
#{
#	export PATH=$PATH
#
#}

user_python()

{
	[[ -d "$HOME/install/python" ]] && export PATH="$PATH:/install/python/bin"
}

add_underscore()

{
	sed -e s'/ /_/g' #single line to rename from pipe
}

rot13()

{
  	if [ -r $1 ]; then cat $1 | tr '[N-ZA-Mn-za-m5-90-4]' '[A-Za-z0-9]'; else echo $* | tr '[N-ZA-Mn-za-m5-90-4]' '[A-Za-z0-9]'; fi
}

histupdate()    

{
 	history -a; history -n
}

mostusedcmds() 

{
	history | awk '{ print $2}' | sort | uniq -c | sort -rn | head   
}

on()

{

	user="$1"

	if who | grep "^$user " > /dev/null; then
		echo "$user is logged in"
	fi

}

multiplication_table()

{
	for y in {1..10}; do
		for x in {1..10}; do echo -n "| $x*$y=$((y*x)) "; 
	done; echo; done| column -t
}
