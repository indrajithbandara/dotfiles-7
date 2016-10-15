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
