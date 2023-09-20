#!/bin/bash
echo "Enter the IP address to ping"

read ip

if [ ! -z $ip ] 
then
	ping -c 1 $ip
	if [ $? -eq 0 ] ; then
		echo "The machine is responded to our ping"
	else
		echo "The machine didn't respond to our ping"
	fi
else
	echo "IP address is empty, or not a propper IP address"
fi
