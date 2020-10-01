#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh

########################################
NAME="chrony"
#name of container

HNAME="ntp-a.ogrydziak.net"
#hostname of container

NETWORK="SERVERS"
#docker network to use

IP="10.0.20.105"
#ip of container
########################################

podman stop $NAME
podman rm $NAME
#stop and remove an existing instance

podman run -d \
  --name $NAME \
  -h=$HNAME \
  --network $NETWORK \
  --ip $IP \
  --dns=$DNS \
  --dns-search=$DNS_SEARCH \
  --restart $RESTART_MODE \
  -e TZ=$TZ \
  -e PUID=$PUID \
  -e PGID=$PGID \
  -v ./config:/etc/chrony:ro \
  -v $LOGDIR:/var/log/chrony \
  localhost/chrony:latest
