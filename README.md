# Chrony NTP server using Docker Compose

## Purpose
This repository allows the user to run and manage an NTP server using Chrony via Docker Compose. This code is made for Docker on Ubuntu but can be adapted for your environment. Please feel to share and adapt this project for your own specific needs.

## Usage
The code ran an managed using [docker-compose](https://docs.docker.com/compose/compose-file/compose-file-v3/).

`docker-compose up -d`

`docker-compose down`

`docker-compose --help`

## Important Files
### [chrony.conf](https://github.com/notarobot767/ntp-chrony/blob/master/app/chrony.conf)
This is the main configuration file for Chrony that gets copied into the image after a build.

### [env_file](https://github.com/notarobot767/ntp-chrony/blob/master/.env)
Variables used on in [docker-compose.yml](https://github.com/notarobot767/ntp-chrony/blob/master/docker-compose.yml). Edit variables for the binding IP if using multiple servers.