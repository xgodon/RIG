#!/bin/bash

read -p "Enter username"  username

while true; do
    read -p "with a passphrase (recommended)" yn
    case $yn in
        [Yy]* ) docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME; break;;
        [Nn]* ) docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME nopass; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
