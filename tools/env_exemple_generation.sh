#!/bin/bash

#generates env_exemple files based on .env files for each project

BASE_DIR=$(pwd)
APPS_DIR="./dockerized-apps"


#for each service
for D in ${APPS_DIR}/*/; do
	
	printf "\n\n\n$(basename $D)\n\n"
        #go in folder
        cd ${D}

	rm env_exemple

	if [ -f ".env" ]
	then
		while read var; do
			trimmed_var=${var%=*}
			echo "$trimmed_var=" >> env_exemple
	  	done <.env
	fi
	cd $BASE_DIR
done

