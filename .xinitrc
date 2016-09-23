#!/bin/sh

# source xprofile
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

feh  --bg-scale .fehbg/* &
exec i3 -V >> ~/.i3log/$(date +'%F-%H-%M-%S').log 2>&1
