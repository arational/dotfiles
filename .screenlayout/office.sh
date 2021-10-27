#!/bin/sh
xrandr --output DP2-2 --mode 1920x1080 --pos 0x360 --rotate normal
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x360 --rotate normal
xrandr --output DP2-1 --mode 2560x1440 --pos 3840x0 --rotate normal
xinput --map-to-output 'Weida Hi-Tech                CoolTouchR System           ' DP2-2
