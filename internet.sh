#!/bin/bash
ping google.com &
if [ $? -eq 0 ];then
echo "online"
else
echo "offline"
exit 1
fi
