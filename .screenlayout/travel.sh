#!/bin/sh
xrandr --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
xinput --map-to-output 'Weida Hi-Tech                CoolTouchR System           ' HDMI2
