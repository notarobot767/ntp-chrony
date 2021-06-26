#!/bin/bash

FROM docker.io/library/ubuntu:latest

LABEL maintainer="notarobot" \
  org.label-schema.name="Chrony NTP Server" \
  org.label-schema.name="OG Networks" \
  org.label-schema.build-date="2021-02-13" \
  org.label-schema.description="Custom NTP server using Chrony on Alpine Linux" \
  org.label-schema.url="https://github.com/notarobot767/ntp-chrony" \
  org.label-schema.vcs-ref="github.com:notarobot767/ntp-chrony.git" \
  org.label-schema.cmd="docker run -d -p 123:123/udp --cap-add='SYS_TIME'  chrony"

ENV TZ=America/New_York
#set timezone variable
#https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

RUN export DEBIAN_FRONTEND=noninteractive && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update -y && apt-get upgrade -y && apt-get install -y tzdata && \
  dpkg-reconfigure --frontend noninteractive tzdata
#update, upgrade, set timezone

RUN apt-get update -y && apt-get install -y chrony
#install chrony package

COPY ./app /app
#config will live locally on image

EXPOSE 123/udp
#ntp uses UDP port 123

ENTRYPOINT ["chronyd", "-d", "-4", "-n", "-f"]
CMD ["/app/chrony.conf"]
#CMD would allow user to specify alternative config for container instance

#-d	all messages will be written to the terminal instead of syslog
#-f	specify an alternate location for the configuration file
#-4	only resolve hostnames to ipv4
#-n	disable reverse lookups
#https://chrony.tuxfamily.org/doc/4.0/chronyd.html
