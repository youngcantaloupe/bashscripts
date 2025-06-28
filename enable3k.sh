#!/bin/bash

xrandr --output DP-0 --primary --mode 3840x2160 --rate 59.94 --output HDMI-0 --mode 1920x1080 --rate 239.96 --right-of DP-0
sleep 5
i3-msg restart
