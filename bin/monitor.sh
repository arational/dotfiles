#!/bin/bash

if [ -z "$1" ]; then
    echo "usages:"
    echo "  monitor off"
    echo "  monitor [left-of|right-of|above|same-as]"
    exit 1
fi

INTERNAL="eDP1"
EXTERNAL=$(xrandr | egrep "(\w+) connected" | grep -v $INTERNAL | cut -d ' ' -f1)

if [ -z $EXTERNAL ]; then
    exit
fi

if [ "$1" = "off" ]; then
    xrandr --output $EXTERNAL --off
else
    POS="$1"

    case "$POS" in
        lo) POS=left-of
            ;;
        ro) POS=right-of
            ;;
        sa) POS=same-as
            ;;
        ab) POS=above
            ;;
    esac

    xrandr --output $EXTERNAL --auto --"$POS" $INTERNAL
fi

xmodmap ~/.Xmodmap
