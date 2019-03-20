#!/bin/bash

read -p "Enter username"  CLIENTNAME

while true; do
    read -p "generate with a passphrase (recommended) y or n" yn
    case $yn in
        [Yy]* ) docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME; break;;
        [Nn]* ) docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME nopass; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
