#!/bin/env bash

set -e -o pipefail -o xtrace

source=/home/ivan/var/backup/liquid/long/20191214
target=/dev/loop1

confirm() {
    while true
    do
        read -p "Continue (y/n)? " answer
        case "$answer" in
            y|Y) return 0;;
            n|N) return 1;;
        esac
    done
}

image="$source/image.e2i.bz2"
ls "$image"* > /dev/null

size=$(cat "$source/blockdev.size64")
[ $size -gt 0 ] || \
    echo "Warning: Could not get the size of the restoring data!"

echo
echo "Summary"
echo "======="
echo "Source directory: $source"
echo "Target device: $target"
echo "Restore amount: $(($size / 1048576)) MiB"
confirm

echo "Restoring backup ..."
cat $image* | \
    scrypt dec - | \
    pbunzip2 -c | \
    pv -s $size | \
    sudo dd of=$target bs=1M

echo "Checking restored target device ..."
sudo e2fsck -f $target

echo "Done!"
