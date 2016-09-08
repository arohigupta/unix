#!/bin/bash
ping -c 1 8.8.8.8 > trial
v=`cat trial | grep "transmitted" | cut -d , -f 2| cut -d " " -f 2`
if [ $v -eq 1 ]; then
	inter=yes
else
	inter=no
fi

echo "CPU AND MEMORY RESOURCES__________________________"
load=$( uptime | sed -n -e 's/^.*load/CPU LOAD/p' )
	echo "	$load"
	echo "	Free RAM : $(free -m| tr -s ' '|grep -i 'mem' | cut -d ' ' -f 7) MB"
echo "NETWORK CONNECTIONS______________________________"
	echo "lo Bytes Received: $(cat /proc/net/dev |tr -s ' '|grep lo| cut -d ' ' -f 3)		Bytes Transmitted: $(cat /proc/net/dev | tr -s ' '|grep lo| cut -d ' ' -f 11)"
	echo "enp0s3 Bytes Received: $(cat /proc/net/dev | tr -s ' '|grep enp0s3|cut -d ' ' -f 2)		Bytes Transmitted: $(cat /proc/net/dev | tr -s ' '|grep enp0s3| cut -d " " -f 10)"
	echo "Internet connectivity : $inter "
echo "Account info_____________________________________"
	echo "Total users: $(cat /etc/passwd | wc -l)"
	echo "No. of active users: $(who |wc -l)"
	echo "Most frequently used shell : $(cat /etc/passwd | cut -d : -f 7| uniq -c| sort| head -1 | sed 's/[0,11111111111111]//g')"
