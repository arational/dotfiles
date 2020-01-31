#!/bin/env sh
notify-send -h string:synchronous:amixer "$(amixer sget $1)"
