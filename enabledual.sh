#!/bin/bash
xrandr --output DP-0 --primary --mode 2560x1440 --rate 164.54 --output HDMI-0 --mode 1920x1080 --rate 239.96 --right-of DP-0
sleep 5
i3-msg restart
