#!/bin/bash

NAME="chrony"
#name of container

HNAME="ntp-a.ogrydziak.net"
#hostname of container

NETWORK="SERVERS"
#docker network to use

IP="10.0.20.105"
#ip of container

LOGDIR="/disk2/logs/chrony"
#local dir for logs

LOCAL_CONFIG="./config"
#app config dir

DNS="10.0.20.100"
#local dns server for network

DNS_SEARCH="ogrydziak.net"
#local dns domain search

RESTART_MODE="on-failure"
#docker restart mode

TZ="America/New_York"
#docker time zone

PUID="1000"
#docker UID

PGID="1000"
#docker GID
