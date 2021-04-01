
# Containerized NTP server using Chrony and Docker

## Purpose
This repository allows the user to run and manage an NTP server using Chrony through containerization. This code is made for Docker on Ubuntu but can be adapted for your environment. Please feel to share and adapt this project for your own specific needs.

## Note
Most of the detailed comments are in the code itself. You will need to modify some of the variables in the config if those objects do not exist, such as the network name. Also, you will need to dowload another configuration file mentioned below or comment out the sources to ../config.sh.

## Important Files
### [build.sh](https://github.com/notarobot767/ntp-chrony/blob/master/build.sh)
Run this script to build your chrony image. This script points to [dockerfile.conf](https://github.com/notarobot767/ntp-chrony/blob/master/dockerfile.conf) to then build your docker image. The image is based off [Alpine Linux](https://hub.docker.com/_/alpine). Build.sh will add the chrony repository, copy the contents of the config folder, and add a default entry point to chrony.conf. This and the other scripts below reference a local and global configuration file. The local [config.sh](https://github.com/notarobot767/ntp-chrony/blob/master/config/config.conf) is located in this repository and used to store all the variables. The intent is this file will be the only file needed to change the data through variables and the other files should be left alone unless changing the logic or operation. The global [config.sh](https://github.com/notarobot767/global_config) has the same concept but is in its own repository because it is meant to be used for other docker projects to avoid repetition.

### [chrony.conf](https://github.com/notarobot767/ntp-chrony/blob/master/config/chrony.conf)
Edit this file for your particular chrony setup. See the [manual page](https://chrony.tuxfamily.org/doc/4.0/chrony.conf.html) or other similar guide.

### [run.sh](https://github.com/notarobot767/ntp-chrony/blob/master/run.sh)
Run this script to start a chrony container instance. If a container of the same name already exists, the script will stop that instance, remove the container, and then run the run command. This script injects the path to the [chrony.conf](https://github.com/notarobot767/ntp-chrony/blob/master/config/chrony.conf), but you could point it somewhere else. 

## Test
Verify your server is functioning using the following commands or use [this guide](https://chrony.tuxfamily.org/doc/4.0/chronyc.html).

`chronyc sources`
`chronyc tracking`
