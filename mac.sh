#!bin/bash
macchanger -l > maclist.txt
ouimac=$(shuf -n 1 maclist.txt | awk'({print$3}')
uaamac=$(printf'%02x:'%02x:'%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
mac="$ouimac:$uaamac"
ifconfig eth0 down
ifcong= eth0 hw ether $mac
ifconfig eth0 up
