#!/bin/bash
PROJ_PATH=/home/rpsadmin/ip-whitelists
/usr/bin/git pull
/usr/bin/git add .
/usr/bin/git commit -m "Refresh whitelists"
/usr/bin/git push
