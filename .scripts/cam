#!/bin/bash

#This is the ffmpeg command that the screencast shortcut in i3 will run.

#Picks a file name for the output file based on availability:

while [[ -f $HOME/Videos/cam$n.mkv ]]
do
	n=$((n+1))
done
filename="$HOME/Videos/cam$n.mkv"

#The actual ffmpeg command:

ffmpeg -y -i /dev/video0 $filename
