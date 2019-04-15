#!/bin/bash

cd blog
git pull
cd ..
cd dl
./dl.sh
cd ..
docker-compose up -d
