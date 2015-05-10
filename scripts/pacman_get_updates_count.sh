#!/usr/bin/bash

updates_count=`cat /home/uibxn/.Scripts/pacman_updates_count.txt`

if [ $updates_count -eq 1 ]
then    
    echo -n ""
fi
if [ $updates_count -eq 2 ]
then    
    echo "1 update"
fi
if [ $updates_count -gt 2 ]
then    
    echo "$updates_count updates"
fi
