#!/bin/bash

while(true)
do
	available=$(df / | grep -v Filesystem |tr -s ' '|cut -d ' ' -f 5| tr -d '%')
	if [ $available -gt 80 ]; then
		echo "WARNING : SPACE UTILIZATION EXCEEDING 80%" | mailx root

	fi
	sleep  60
done

