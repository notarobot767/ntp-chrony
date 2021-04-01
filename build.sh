#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ./config/config.conf
docker build \
	--file "./config/dockerfile.conf" \
	--tag $IMAGE_NAME \
	--pull \
	.

#--file: specify dockerfile since in subdirectory
#--tag: name of the image
#--pull always pull latest base image
#https://docs.docker.com/engine/reference/commandline/build/
