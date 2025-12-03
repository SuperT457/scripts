#!/bin/bash

set -e

function update(){
	# stop filebrowser
	sudo systemctl stop filebrowser
	
	# get asset uri
	asset=$(curl --silent https://api.github.com/repos/filebrowser/filebrowser/releases/latest | grep browser_download_url | grep linux-amd64 | cut -f 4 -d "\"")
        
	# work in temporary directory
        cd /tmp
	
	# create temp directory for new files
	newdir="filebrowser-$(date +"%H%M%S%d%m%y")"
	mkdir $newdir
	cd $newdir	

	# download assets
	wget $asset 	

	# extract files
	tar xzf linux-amd64-filebrowser.tar.gz

	# replace executable
	sudo mv filebrowser /usr/local/bin/filebrowser
	
	# restart filebrowser
	sudo systemctl start filebrowser

	echo "Upgrade complete"
	echo "New version: $(filebrowser version)"
}


check_version=$(curl --silent https://api.github.com/repos/filebrowser/filebrowser/releases/latest | grep tag_name | cut -f 4 -d \")

current_version=$(filebrowser version | cut -f 3 -d " " | cut -f 1 -d \/)

echo current: $current_version

echo check new: $check_version

if [ $current_version = $check_version ];then
	echo "Filebrowser is up-to-date"
else
	echo "Found a more recent version: $check_version"
	update
fi
