#!/bin/env bash

set -e -o pipefail

######################################################################
# This script performs a live backup of the whole root partition.
#
# Please make the mandatory changes of the environment variables.
######################################################################

modsize=1G
partsize=1G
target="$HOME/mnt/BACKUPS/$(date +%Y%m%d)"
rootdev=/dev/system/root
snapshot=snap01

######################################################################


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

echo
echo "Summary"
echo "======="
echo "Root device: $rootdev"
echo "Target directory: $target"
confirm

echo "Creating LVM snapshot and open its luks container ..."
sudo lvcreate --size $modsize --snapshot --name $snapshot $rootdev
sudo cryptsetup luksOpen /dev/system/$snapshot $snapshot
sourcedev=/dev/mapper/$snapshot

echo "Checking source device ..."
sudo e2fsck -f $sourcedev

echo "Preparing the target directory ..."
mkdir -p "$target"

echo "Saving device information ..."
# TODO: check whether device exists
size=$(sudo blockdev --getsize64 $sourcedev)
# TODO: check available free space
sudo fdisk -l $sourcedev > "$target/fdisk.info"
echo "$size" > "$target/blockdev.size64"

echo "Storing backup ..."
image="$target/image.e2i.bz2"
tmpdir=$(mktemp -d)
pipe=$tmpdir/sha256sum.pipe
mkfifo $pipe
sha256sum < $pipe > $tmpdir/checksum & pid=$!
sudo e2image -ra -p $sourcedev - | \
    pbzip2 -1 -c | \
    scrypt enc - | \
    tee $pipe | \
    split -a3 -d -b$partsize - \
          "$image"
wait $pid
checksum="$(cat $tmpdir/checksum)"
rm -rf $tmpdir

echo "Checking the stored data of the new backup ..."
if [ "$(cat $image* | sha256sum)" = "$checksum" ]
then
    echo "The checksums match!"
else
    echo "The checksums don't match!"
    return 1
fi

echo "Removing LVM snapshot and closing its luks container ..."
sudo cryptsetup luksClose $snapshot
sudo lvremove /dev/system/$snapshot

echo "Done!"
