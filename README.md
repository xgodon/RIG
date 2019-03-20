# RIG

RIG is a **set of docker-compose.yml** of services destined to people interested in selfhosting.
- All services are reverse-proxied by nginx
- HTTPS setup is automated thanks to letsencrypt

It also provides a **saving script** that saves all named volumes declared in your docker-compose.yml files, using rsync. The script stop and restart your applications if they are running.

To run an application for the first time :

```
#go in its directory
cd RIG/dokuwiki 
cp exemple.env .env
#edit the env file to set the different variables
nano .env
docker-compose up -d
```

the following applications are proposed :

- ampache (audio streaming)
- dokuwiki (wiki)
- duckDNS (free dynamic DNS)
- go-socks5-proxy (socks5 proxy)
- heimdal 
- nextcloud
- nginx + letsencrypt + dockergen (mandatory for HTTPS)
- openVPN
- redmine
- seafile
- simple-socks5-server (socks5 proxy)
- wordpress

NOTE : openVPN, simple-socks5-server and go-socks5-proxy are not being served by the reverse proxy


TO COME SOON : 
- torrent.csv 

TODO : 
- remove all latest tag for named tags

# Supervision of the containers

i suggest the following : 
https://cockpit-project.org/

you can follow this tutorial https://www.linux.com/learn/intro-to-linux/2017/3/make-container-management-easy-cockpit

## ampache

repo :  https://github.com/ampache/ampache-docker

## dokuwiki

image :  https://hub.docker.com/r/mprasil/dokuwiki/

## duckDNS

image :  https://github.com/coppit/docker-duckdns

## go-socks5-proxy

image :  https://hub.docker.com/r/serjs/go-socks5-proxy/

## heimdal 

image :  https://github.com/linuxserver/Heimdall

## nextcloud

image :  https://github.com/nextcloud/docker

## nginx + letsencrypt + dockergen

images :  
  - nginx
  - jwilder/docker-gen
  - jrcs/letsencrypt-nginx-proxy-companion
  
  
## openVPN

image : https://github.com/kylemanna/docker-openvpn

see https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md for detailed instructions


## redmine

image :  https://hub.docker.com/_/redmine/

## seafile

image :  https://hub.docker.com/r/seafileltd/seafile

run init.sh after the settup of your .env 

## simple-socks5-server

image : https://hub.docker.com/r/dijedodol/simple-socks5-server/

## wordpress

image : WIP

