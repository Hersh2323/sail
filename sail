#!/bin/bash
#errlogfile=/var/log/hscripts/mactbin_err.log
#logfile=/var/log/hscripts/mactbin.log
#
if [[ $# -ne 1 ]]
then
    echo "sail called with missing or too many paramters." >&2
    exit 1
fi

if [[ $1 == "s" ]]
then
    echo "[sail] s parameter detected."
    setsail=true
fi

if [[ $1 == "r" ]]
then
    echo "[sail] r parameter detected."
    returntoport=true
fi

if [[ $setsail == true ]]
then
    echo "[sail] setting sail"
    cd /srv/docker/gluetun
    sudo docker-compose up -d
    cd /srv/docker/deluge
    sudo docker-compose up -d
fi

if [[ $returntoport == true ]]
then
    echo "[sail] returning to port..."
    sudo docker stop deluge
    sudo docker stop gluetun
fi
