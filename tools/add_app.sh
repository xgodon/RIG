#!/bin/bash

#defines email and host
source .env

proxy=true
da="dockerized-apps"

print_help () {

	echo "
 	Usage: $0 [ -n NAME ] [ -e <var1> <var2> VARIABLES ] [ -b ]
	-n              Name of the application
	-e              Environment variables
	-b              Basic : doesn't write nginx&letsencrypt args
	-h              Help
	"
	1>&2
}

if (($# == 0)); then
  print_help
  exit 2
fi
while getopts ":n:e:bh" opt; do
  case $opt in
    n)
      NAME=$OPTARG
      ;;
    e)
      ENVS=$OPTARG
      ;;
    b)
      proxy=false
      ;;
    h)
      print_help
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ -z "$NAME" ]
then
	print_help
	exit 1
fi

mkdir "./$da/$NAME"
cp ./exemple-compose.yml "./$da/$NAME/docker-compose.yml"

cp ./default.env "./$da/$NAME/.env"
for ENV in $ENVS;
do
 echo "$ENV=" >> "./$da/$NAME/.env"
done


exit 0
