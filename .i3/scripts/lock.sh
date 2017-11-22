#!/bin/bash

LOCK_ICON=~/.icons/lock1.png
LOCK_SCREEN=/tmp/screen.png

scrot $LOCK_SCREEN
convert $LOCK_SCREEN -scale 10% -scale 1000% $LOCK_SCREEN
[[ -f $1 ]] && convert $LOCK_SCREEN $1 -gravity center -composite -matte $LOCK_SCREEN
i3lock -u -i $LOCK_SCREEN
rm $LOCK_SCREEN