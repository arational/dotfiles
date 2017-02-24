#!/bin/sh

# source xprofile
[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

export BROWSER=qutebrowser

feh  --bg-scale .fehbg/* &
exec i3 -V >> ~/.i3.log 2>&1
