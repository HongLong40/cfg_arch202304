#!/bin/zsh

if [[ $(xrandr | rg "HDMI-0 connected" ) ]]
then
    xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off
fi

if [[ $(xrandr | rg "HDMI-0 disconnected" ) ]]
then
    xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --off --output DP-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal
fi
