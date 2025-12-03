#!/bin/bash

file=/var/log/network-watchdog.log

ping -c 2 -W 2 8.8.8.8 > /dev/null;
result=$?

echo "$(date): OK" >> $file

if [ $result -ne 0 ];then
        echo "$(date): ERROR" >> $file
        systemctl restart NetworkManager
fi
