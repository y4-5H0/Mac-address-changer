#!/bin/bash
macchanger -l > maclist.txt
ouimac=$(shuf -n 1 maclist.txt | awk '{print$3}')
uaamac=$(printf '%02x:''%02x:''%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
#if you want to change the mac address of wlan0 you need to change the eth0 to wlan0.
ifconfig eth0 down
macchanger -m "$ouimac:$uaamac" eth0
ifconfig eth0 up


