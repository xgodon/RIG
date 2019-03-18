#!/bin/bash

vol_path="/var/lib/docker/volumes"

#for each service
for D in ./dockerized-apps/*/; do

	FOLDER=$(basename $D) 
	echo "${D}"   # your processing here

	#go in folder
	cd ${D}

	#create volume list
	VOLUMES=()

	#get volume names
	line=$(cat docker-compose.yml  | grep -n "^volumes:" | cut -f1 -d:)
	STOP=false
	while [ $STOP != true ] ;do
		((line++))
		line_content=$(sed "${line}q;d" docker-compose.yml)
		if [[ "$line_content" == " "* ]]; then
			VOLUME=$(echo $line_content |  tr -d '[:space:]' | tr -d '[:]' )
			VOLUMES+=("$VOLUME")
		else
			STOP=true;
		fi
	done

	#if there is folders to backup
	if [ ${#VOLUMES[@]} -ne 0 ]; then
		#stop service
		#docker-compose stop

		#for each volume
		for i in "${VOLUMES[@]}"
		do
			echo "backup of $vol_path/${FOLDER}_$i"
			#back data locally with rsync

		done
		#restarting service
		#docker-compose start	
	fi
	cd ../..

done

