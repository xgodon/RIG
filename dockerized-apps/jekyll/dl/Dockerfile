FROM debian:9.8-slim

RUN apt-get update && apt-get install -y gnupg2 &&\
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8756C4F765C9AC3CB6B85D62379CE192D401AB61 &&\
  echo deb http://deb.seadrive.org stretch main | tee /etc/apt/sources.list.d/seafile.list &&\
  apt-get update &&\
  apt-get install -y seafile-cli

ADD entrypoint.sh /entrypoint.sh
ADD .env /.env

ENTRYPOINT  /entrypoint.sh

