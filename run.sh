#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ../config.sh
source ./config/config.conf
#source global then local parameters

docker stop $NAME
docker rm $NAME
#if exist, stop and remove container

docker run -d \
  --name $NAME \
  -h $HOST \
  --network=$NETWORK \
  -m $MEM_LIMIT \
  -p $BINDING_IP:$H_PORT:$C_PORT/udp \
  -p $BINDING_IPV6:$H_PORT:$C_PORT/udp \
  --cap-add=$SYS_TIME \
  --restart $RESTART_MODE \
  -e TZ=$TZ \
  $IMAGE

#--cap-add: necessary for controlling system of host
  #SYS_TIME
  #https://docs.docker.com/engine/reference/run/

#-p: necessary to state binding IP instead of listen on all interfaces due
  #to docker inherit container dns listening on 127.0.0.53:53
  #Will otherwise run into conflict with dnsmasq
