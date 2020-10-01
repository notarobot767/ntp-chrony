#!/bin/bash

cd "${0%/*}"
#change directory relative to script

podman build --tag chrony \
        -f "./dockerfile.conf"
        #build docker file
