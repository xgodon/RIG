#!/bin/bash
source .env

mkdir ~/seafile-client
seaf-cli init -d ~/seafile-client
seaf-cli start


seaf-cli start
f="run.sh"
seaf-cli download -d /tmp/from_seafile/quebec -u $SEAFILE_USER -p $SEAFILE_PWD -l $SEAFILE_LIB_ID -s $SEAFILE_URL

sleep 10

mv /tmp/from_seafile/quebec/Québec/*.jpg /tmp/from_seafile/quebec
rm -r /tmp/from_seafile/quebec/Québec


