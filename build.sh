#!/bin/bash

cd "${0%/*}"
#change directory relative to script

source ./config/config.conf

podman build -f "./config/dockerfile.conf" \
	--tag $IMAGE_NAME \
	.
