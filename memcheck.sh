#!/bin/bash
available=$(free -m|grep -i "mem"|tr -s ' '|cut -d ' ' -f 7)
minimal_mb_free=100
email=root
subject="Memory Check"
echo $minimal_mb_free $email $available $subject

if [ $available -lt $minimal_mb_free ] ; then
	echo "WARING: only $available mb of memory is available!!! | mail -s subject $email
fi
