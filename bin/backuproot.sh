#!/bin/env bash

set -e -o pipefail

modsize=1G
partsize=1G
#target="$HOME/var/backup/liquid/long/$(date +%Y%m%d)"
target="$HOME/mnt/BACKUPS/$(date +%Y%m%d)"
root=/dev/system/root
snapshot=snap01
#source=/dev/loop1


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

new_password() {
    while true
    do
        read -s -p "Encryption passphrase > " pass
        echo
        read -s -p "Retype passphrase > " pass_confirm
        echo
        if [ "$pass" = "$pass_confirm" ]
        then
            return 0
        else
            echo "Phrases don't match!"
        fi
    done
}

echo
echo "Summary"
echo "======="
echo "Root device: $root"
echo "Target directory: $target"
confirm

echo "Creating LVM snapshot and open its luks container ..."
sudo lvcreate --size $modsize --snapshot --name $snapshot $root
sudo cryptsetup luksOpen /dev/system/$snapshot $snapshot
source=/dev/mapper/$snapshot

echo "Checking source device ..."
sudo e2fsck -f $source

echo "Preparing the target directory ..."
mkdir -p "$target"

echo "Saving device information ..."
# TODO: check whether device exists
size=$(sudo blockdev --getsize64 $source)
# TODO: check available free space
sudo fdisk -l $source > "$target/fdisk.info"
echo "$size" > "$target/blockdev.size64"

echo "Storing backup ..."
image="$target/image.e2i.bz2"
tmpdir=$(mktemp -d)
pipe=$tmpdir/sha256sum.pipe
mkfifo $pipe
sha256sum < $pipe > $tmpdir/checksum & pid=$!
sudo e2image -ra -p $source - | \
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
