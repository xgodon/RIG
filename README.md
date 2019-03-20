# RIG

RIG is a **set of docker-compose.yml** of services destined to people interested in selfhosting.
- All services are reverse-proxied by nginx
- HTTPS setup is automated thanks to letsencrypt

It also provides a **saving script** that saves all named volumes declared in your docker-compose.yml files, using rsync. The script stop and restart your applications if they are running.

the following applications are supported :

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

TO COME SOON : 
- torrent.csv 

TODO : 
- remove all latest tag for named tags

# Supervision of the containers

i suggest the following : 
https://cockpit-project.org/

## ampache

repo :  https://github.com/ampache/ampache-docker

## dokuwiki

repo :  

## duckDNS

repo :  https://github.com/coppit/docker-duckdns

## go-socks5-proxy

repo :  

## heimdal 

repo :  

## nextcloud

repo :  

## nginx + letsencrypt + dockergen

repo :  

## openVPN

container repo :  
see https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md for detailed instructions


## redmine

repo :  

## seafile

repo :  
run init.sh after the settup of your .env 

## simple-socks5-server

## wordpress


