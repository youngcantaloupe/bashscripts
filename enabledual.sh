#!/bin/bash
xrandr --output HDMI-0 --primary --mode 2560x1440 --rate 143.86 --output HDMI-1 --mode 1920x1080 --rate 239.96 --right-of HDMI-0
sleep 5
i3-msg restart
