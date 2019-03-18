#!/bin/bash

source .env

docker-compose run --rm openvpn ovpn_genconfig -u udp://$HOST
docker-compose run --rm openvpn ovpn_initpki


