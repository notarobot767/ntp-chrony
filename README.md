
# NTP Server using Chrony

## Purpose
This repository allows the user to run and manage an NTP server using Chrony through containerization. This code is made for Docker, but can be adapted for your flavor of Linux or container program. The specific server configuration is created for my own home network, but please feel free to adapt it for your own specific needs.

## Important Files
### [build.sh](https://github.com/notarobot767/ntp-chrony/blob/master/build.sh)
Run this script to build your chrony image. This script points to [dockerfile.conf](https://github.com/notarobot767/ntp-chrony/blob/master/dockerfile.conf) to then build your docker image. The image is based off [Alpine Linux](https://hub.docker.com/_/alpine) and simply adds the chrony repository, the config folder, and entry point to chrony.conf.

### [chrony.conf](https://github.com/notarobot767/ntp-chrony/blob/master/config/chrony.conf)
Edit  this file for your particular chrony setup. See the [manual page](https://chrony.tuxfamily.org/doc/4.0/chrony.conf.html) or other guide.

### [run.sh](https://github.com/notarobot767/ntp-chrony/blob/master/run.sh)
Run this script to start a chrony container. This script will pull parameters from [config.sh](https://github.com/notarobot767/ntp-chrony/blob/master/config.sh) and instantiate a Chrony container. If a container of the same name already exists, the script will stop the instance, remove the container, and then run the run command. This script injects the path to the [chrony](https://github.com/notarobot767/ntp-chrony/blob/master/config/chrony.conf), but you could point it somewhere else. Also note that run.sh sources a file not in this repository called ../config.sh. The ../ indicates it is located in the parent folder. In order to run run.sh, you will need to uncommit that line in run.sh and add the necessary variables not already defined in ./config.sh. Alternatively, you could create a config.sh in the parent folder. The purpose of doing this would be to add global parameters for other images. That is why ../config is sourced first followed by ./config. Config.sh in this repository is meant to be locally scoped parameters.

### test
Verify your server is functioning using the following commands or use [this guide](https://chrony.tuxfamily.org/doc/4.0/chronyc.html).
`chronyc sources`
`chronyc tracking`
