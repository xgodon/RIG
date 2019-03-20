#!/bin/bash

DESTINATION="${1-/backups/manual/volumes}"
vol_path="/var/lib/docker/volumes"
BASE_DIR=$(pwd)
APPS_DIR="./dockerized-apps"


mkdir -p $DESTINATION
#for each service
for D in ${APPS_DIR}/*/; do

	FOLDER=$(basename $D) 
	echo "Service : $FOLDER" 

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
		#check if service is running,
		#if no the service won't be restarted
		is_up=$(docker-compose ps | grep "Up")
		if [ -n "$is_up" ]
		then
			#printf "\tstopping service"
			docker-compose stop
		else
			printf "\tservice isn't running"
		fi

		#for each volume
		for i in "${VOLUMES[@]}"
		do
			SOURCE=$(echo "$vol_path/${FOLDER}_$i" | tr '[:upper:]' '[:lower:]')
			printf "\n\t backup of $SOURCE to $DESTINATION"
			#back data locally with rsync
			rsync -avq --delete $SOURCE $DESTINATION

		done
		#if the service was running, restart it
		if [ -n "$is_up" ]
		then
			printf "\trestarting service"
			docker-compose start	
		fi
	fi
	cd $BASE_DIR
	printf "\n\n"

done

