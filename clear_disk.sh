#!/bin/bash 
 
set_max=4
work_dir="/var/log"

used_space=`df -H $work_dir  | grep % | awk {'print $5'} | sed '1d;s/[^0-9]//g'`
#print "Free Space available under \"$path\" is `expr 100 - $used_space`%.\n"
 
if [ $used_space -gt $set_max ]
then
    echo "Clear Disk"
    #truncate -s 0 $work_dir/access.*
    find $work_dir  -type f -name 'access.*' -print | while read i 
    do 
        cat /dev/null > "$i"
    done
else
   echo "Disk OK"
fi