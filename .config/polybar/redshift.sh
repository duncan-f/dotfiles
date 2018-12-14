#!/bin/sh

eval $(xres2var)

if [ "$(pgrep -x redshift)" ]; then
    temp=$(redshift -p 2> /dev/null | grep temp | cut -d " " -f 3 | tr -d "[:alpha:]")

    if [ -z "$temp" ]; then
        echo "%{F$foreground}  "
    elif [ "$temp" -ge 5000 ]; then
        echo "%{F$color0}  "
    elif [ "$temp" -ge 4000 ]; then
        echo "%{F$color3}  "
    else
        echo "%{F$color9}  "
    fi
fi
