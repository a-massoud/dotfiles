#!/bin/bash

CURRENTSTATE=$(setxkbmap -query)
swapped=$(echo $CURRENTSTATE | grep 'ctrl:swapcaps')

if [[ -z $swapped ]]
then
    setxkbmap -option ctrl:swapcaps
else
    setxkbmap -option -option compose:ralt -option grp:menu_toggle
fi
