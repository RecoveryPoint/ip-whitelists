#!/bin/bash
REQUIRED=https://config.zscaler.com/api/zscaler.net/hubs/cidr/json/required
CENR=https://config.zscaler.com/api/zscaler.net/cenr/json
FUTURE=https://config.zscaler.com/api/zscaler.net/future/json
PROJ_PATH=/home/rpsadmin/ip-whitelists
REQ_JSON_OUTPUT=$PROJ_PATH/zscaler.json
CENR_JSON_OUTPUT=$PROJ_PATH/zscaler-cenr.json
FUTURE_JSON_OUTPUT=$PROJ_PATH/zscaler-future.json
REQ_OUT=$PROJ_PATH/req.txt
CENR_OUT=$PROJ_PATH/cenr.txt
FUTURE_OUT=$PROJ_PATH/future.txt
FINAL_OUT=$PROJ_PATH/zscaler.txt
/usr/bin/curl $REQUIRED -o $REQ_JSON_OUTPUT
/usr/bin/curl $CENR -o $CENR_JSON_OUTPUT
/usr/bin/curl $FUTURE -o $FUTURE_JSON_OUTPUT
/usr/bin/cat $REQ_JSON_OUTPUT | /usr/bin/jq -r '.hubPrefixes | unique | join("\n")' > $REQ_OUT
/usr/bin/cat $CENR_JSON_OUTPUT | jq -r '."zscaler.net" | to_entries | map(.value) | map(to_entries) | flatten | map(.value) | flatten | map(.range) | join("\n")' > $CENR_OUT
/usr/bin/cat $FUTURE_JSON_OUTPUT | /usr/bin/jq -r '.prefixes | unique | join("\n")' > $FUTURE_OUT
/usr/bin/cat $REQ_OUT $CENR_OUT $FUTURE_OUT > $FINAL_OUT
