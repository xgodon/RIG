# RIG

RIG is a **set of docker-compose.yml** of services destined to people interested in selfhosting.
- All services are reverse-proxied by nginx
- HTTPS setup is automated thanks to letsencrypt

It also provides a **saving script** that saves all named volumes declared in your docker-compose.yml files, using rsync. The script stop and restart your applications if they are running.


the following applications are proposed :

- ampache (audio streaming)
- dokuwiki (wiki)
- duckDNS (free dynamic DNS)
- gitea
- go-socks5-proxy (socks5 proxy)
- heimdal 
- jekyll
- nextcloud
- nginx + letsencrypt + dockergen (mandatory for HTTPS)
- openVPN
- redmine
- seafile
- simple-socks5-server (socks5 proxy)
- wordpress

NOTE : openVPN, simple-socks5-server and go-socks5-proxy are not being served by the reverse proxy

NOTE2 : nginx uses TCP so you can setup openVPN on the same port because it uses UDP by default, this is usefull for port 80/443


TO COME SOON : 
- torrent.csv 

TODO : 
- remove all latest tag for named tags, cf : https://vsupalov.com/docker-latest-tag/

## BACKUPS

- place yourself in the "RIG" directory
- run :

```
sudo tools/save_apps.sh
```
It will save in all named volumes declared in "./dockerized-apps" from "/var/lib/docker/volumes" to "/backups/manual/volumes"
you can easily change source and destination folder in the beginning of the script and run this with a cron job 

## Supervision of the containers

i suggest the following : 
https://cockpit-project.org/

you can follow this tutorial https://www.linux.com/learn/intro-to-linux/2017/3/make-container-management-easy-cockpit

## Running containers

### nginx + letsencrypt + dockergen

```
docker network create --subnet=172.28.0.0/16 --opt com.docker.network.bridge.name=nginx-proxy nginx-proxy
docker-compose up -d 
```
(or just run install.sh)

based on : https://raw.githubusercontent.com/ekkis/nginx-proxy-LE-docker-compose/master/docker-compose.yml

images :  
  - nginx
  - jwilder/docker-gen
  - jrcs/letsencrypt-nginx-proxy-companion
  
  
### ampache

```
cd RIG/ampache 
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

repo :  https://github.com/ampache/ampache-docker

### dokuwiki

```
cd RIG/dokuwiki 
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```


image :  https://hub.docker.com/r/mprasil/dokuwiki/

### duckDNS

```
cd RIG/duckdns 
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image :  https://github.com/coppit/docker-duckdns

### gitea

```
cd RIG/gitea
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image : https://hub.docker.com/r/gitea/gitea/

### go-socks5-proxy

```
cd RIG/go-socks5-proxy
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image :  https://hub.docker.com/r/serjs/go-socks5-proxy/

### heimdal 

```
cd RIG/heimdal
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image :  https://github.com/linuxserver/Heimdall

### Jekyll

Deploys a jekyll wesite on an nginx server

This setup suppose that :
- you have a "blog" directory with your jekyll source (before build)
- you have a volume "from_seafile" taht contains assets for this blog.

If you don't need seafile integration, just remove the volume from the docker-compose and "run docker-compose up -d" instead of deploy.sh.

If you need seafile integration, you will have to replace variables in the dl/entrypoint.sh or create a .env

```
cd RIG/jekyll
cp exemple.env .env
#edit the env file to set the different variables
vi .env
./deploy.sh
```

image : locally builded, FROM the official nginx image

### nextcloud

```
cd RIG/nextcloud
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image :  https://github.com/nextcloud/docker
  
  
### openVPN

TODO

image : https://github.com/kylemanna/docker-openvpn

see https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md for detailed instructions


### redmine


```
cd RIG/redmine
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image :  https://hub.docker.com/_/redmine/

## seafile

```
cd RIG/seafile
cp exemple.env .env
#edit the env file to set the different variables
vi .env
init.sh
docker-compose up -d
#you will have to edit a conf file
docker exec -it seafile bash
vi conf/seahub_settings.py
#replace the http by https in the FILE_SERVER_ROOT var
```

image :  https://hub.docker.com/r/seafileltd/seafile

### simple-socks5-server


```
cd RIG/simple-socks5-server
cp exemple.env .env
#edit the env file to set the different variables
vi .env
docker-compose up -d
```

image : https://hub.docker.com/r/dijedodol/simple-socks5-server/

### wordpress

WIP

