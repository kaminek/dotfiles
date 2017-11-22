#!/bin/bash

WALLPAPERS=$HOME/Pictures/Wallpapers/*
DELAY=10m

while true
do
    feh --randomize --bg-scale $WALLPAPERS && sleep $DELAY
done