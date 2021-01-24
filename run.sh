#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config.sh

docker stop $NAME
docker rm $NAME
#stop and remove an existing instance

docker run -d \
  --name $NAME \
  -h=$HNAME \
  --network=$NETWORK \
  -p $H_PORT:$C_PORT/udp \
  --dns-search=$DNS_SEARCH \
  --restart $RESTART_MODE \
  $IMAGE
