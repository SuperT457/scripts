#!/bin/bash

# I should create an environment variable for the working dir, or pass it as an argument

function update(){
	echo "AGGIORNAMENTO IN $PWD"
	docker compose pull && docker compose up -d
	docker image prune -f
	echo -e "=================\n"
}

workingdir="/your/working/dir"
cd $workingdir

for i in *
do
	cd $i || exit
	update
	cd ..
done

bash /usr/local/bin/update-filebrowser.sh
