#!/bin/sh
curl -k -s -S "https://registry.hub.docker.com/v1/repositories/${1}/tags" | jq '.[]["name"]'
