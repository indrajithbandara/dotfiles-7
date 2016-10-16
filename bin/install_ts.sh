#!/bin/bash
# this will download and install teamspeak client on 64 bit linux machine. 
# run as the root user

# variables for installation files
# update this as needed. i dont keep it up to date. you can find the latest files on teamspeaks website

download_url="http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.18.2/TeamSpeak3-Client-linux_amd64-3.0.18.2.run"
filename="TeamSpeak3-Client-linux_amd64-3.0.18.2.run"

mkdir /opt/teamspeak
cd /opt/teamspeak
wget $download_url
chmod +x $filename
ln -sv /opt/teamspeak/ts3client_runscript.sh /usr/bin/teamspeak
echo 'installation finished'
echo 'teamspeak client is installed in /opt/teamspeak'
echo 'the binary runscript is symlinked to /usr/bin/teamspeak'
