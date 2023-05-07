#!/bin/bash
kanshi &

right_display=DP-1
left_display=DP-3
sleep 5
swaymsg '[workspace=1]' move workspace to output $right_display
swaymsg '[workspace=2]' move workspace to output $left_display
swaymsg '[workspace=3]' move workspace to output $right_display
swaymsg '[workspace=4]' move workspace to output $right_display
swaymsg '[workspace=10]' move workspace to output $left_display
