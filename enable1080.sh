#!/bin/bash
xrandr --output DP-0 --primary --mode 1920x1080 --rate 164.54 --output HDMI-0 --off
sleep 5
i3-msg restart
