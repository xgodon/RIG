#!/bin/bash

source .env
cp ./vhost "/var/lib/docker/volumes/nginxle_nginx-vhost/_data/${HOST}"

#sed -i 's|;local_web_path = "http://localhost/ampache"|local_web_path = "http://localhost:80"|g' ampache.cfg.php
