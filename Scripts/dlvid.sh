#!/bin/bash

vidname=$(($(date +%s%N)/1000000)).mp4

yt-dlp -o /home/$USER/Videos/$vidname --recode-video mp4 $1
