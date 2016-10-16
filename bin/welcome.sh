#!/bin/sh

~/bin/greetings.sh
echo "hostname: $HOSTNAME"
echo "public ip: $(curl --silent ipinfo.io | grep ip | cut -f 4 -d '"')"
echo "private ip:" $(ifconfig -a | grep inet | grep 192.168 | awk ' { print $2 }')
#this daemon.cow usually needs to be seperately installed on a system as most do not come with it.
fortune linux | cowsay -f /usr/share/cows/daemon.cow


