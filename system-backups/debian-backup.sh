#!/bin/bash

# script to backup system configurations and packages states and list
# useful to execute before upgrading from debian 12 (bookworm) to 13 (trixie)

mkdir ~/debian-backup

dest=~/debian-backup

sudo cp -a /etc $dest

sudo cp -a /var/lib/apt/extended_states $dest

sudo cp -a /var/lib/dpkg/ $dest

dpkg --get-selections '*' > $dest/dpkg_selections

sudo cp -a /var/lib/aptitude/pkgstates $dest

echo "Everything copied corrently in $dest"

ls $dest
