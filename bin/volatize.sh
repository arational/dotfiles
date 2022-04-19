#!/bin/env sh

static=.static-$2
link=$2
volatile=/dev/shm/$USER-$2

IFS=
set -efu

save () {
    rsync -av --delete ./$1/ ./$2/
}

start () {
    if [ "$(readlink $link)" = "$volatile" ]; then
        if [ -r $volatile ]; then
            save $link $static
        else
            mkdir -m0700 $volatile
            save $static $link
        fi
    else
        if [ ! -r $volatile ]; then
            mkdir -m0700 $volatile
        fi
        mv $link $static
        ln -s $volatile $link
        save $static $link
    fi
    echo "$(date) '$link' synchronized"
}

stop () {
    if [ "$(readlink $link)" = "$volatile" ]; then
        save $link $static
        rm $link
        mv $static $link
    fi
}

case $1 in
    start)
        start
        ;;
    stop)
        stop
        ;;
    *)
        echo "Usage: $0 [FOLDER] [ACTION]"
        echo ""
        echo "ACTIONS"
        echo "    start -"
        echo "    stop -"
        exit 2
esac
