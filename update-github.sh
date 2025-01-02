#!/bin/bash
URL=https://api.github.com/meta
PROJ_PATH=/home/rpsadmin/ip-whitelists
JSON_OUTPUT=$PROJ_PATH/github.json
TXT_OUT=$PROJ_PATH/github.txt
/usr/bin/curl $URL -o $JSON_OUTPUT
/usr/bin/cat $JSON_OUTPUT | /usr/bin/jq -r '.git | join("\n")' > $TXT_OUT
