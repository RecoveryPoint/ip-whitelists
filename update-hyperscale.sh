#!/bin/bash
HYPERSPIN_IPS="https://www.hyperspin.com/network.php?type=xml"
PROJ_PATH=/home/rpsadmin/ip-whitelists
HYPERSPIN_XML_OUTPUT=$PROJ_PATH/hyperspin.xml
/usr/bin/curl $HYPERSPIN_IPS -o $HYPERSPIN_XML_OUTPUT
