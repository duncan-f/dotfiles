#!/bin/bash

while [[ -f $HOME/Videos/video$n.mkv ]]

do
    n=$((n+1))
done

filename="$HOME/Videos/video$n.mkv"

ffmpeg -f x11grab \
    -s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
    -i :0.0 \
    -c:v libx264 -qp 0 -r 30 $filename
