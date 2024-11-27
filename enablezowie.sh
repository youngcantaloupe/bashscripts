#!/bin/bash
xrandr --output HDMI-0 --off --output DP-2 --mode 1920x1080 --rate 239.96 --primary
i3-msg restart
