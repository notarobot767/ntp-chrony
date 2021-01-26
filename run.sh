#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config.sh
#source global then local parameters

podman stop $NAME
podman rm $NAME
#stop and remove an existing instance

podman run -d \
  --name $NAME \
  --restart $RESTART_MODE \
  --network=$NETWORK \
  -p $H_PORT:$C_PORT/udp \
  $IMAGE
