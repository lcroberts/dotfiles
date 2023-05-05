#!/bin/bash
kanshi &

sleep 7
swaymsg '[workspace="1"]' move output to output right
swaymsg '[workspace=$ws2]' move output to output left
swaymsg '[workspace=$ws3]' move output to output right
swaymsg '[workspace=$ws4]' move output to output right
swaymsg '[workspace=$ws10]' move output to output left
