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
