#!/bin/bash

docker network create --subnet=172.28.0.0/16 --opt com.docker.network.bridge.name=nginx-proxy nginx-proxy
docker-compose up -d
