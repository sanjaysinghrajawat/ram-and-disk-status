#!/bin/bash

FREE_RAM=$(free -mt | grep "Total" | awk '{print $4}')
FREE_DISK=$(df | egrep -v "Filesystem|tmpfs" | egrep -v "/boot" | awk '{print $5}' | tr -d %)

if [[ $FREE_RAM -le 200  ]]
then
        echo "Warning !!! RAM running low :- ${FREE_RAM} M"

elif [[ $FREE_DISK -ge 70  ]]
then
        echo "Warning !!! DISK running low :- ${FREE_DISK} %"
else
        echo "All good :)"
        echo "RAM -> ${FREE_RAM} M"
        echo "DISK -> ${FREE_DISK} %"
fi