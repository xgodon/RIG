#!/bin/bash
name="temp"
docker build -f Dockerfile -t seafile_dl .
docker rm -f $name
docker run --rm -it --name $name -v from_seafile:/tmp/from_seafile seafile_dl
#docker run -d --name $name -v from_seafile:/tmp/from_seafile --entrypoint "tail" seafile_dl -f /dev/null


