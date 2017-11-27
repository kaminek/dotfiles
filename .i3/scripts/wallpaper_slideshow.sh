#!/bin/bash

WALLPAPERS=$HOME/Pictures/Wallpapers/*
DELAY=1h

while true
do
    feh --randomize --bg-scale $WALLPAPERS && sleep $DELAY
done