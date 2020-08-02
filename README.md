```
     _____          ___           ___           ___           ___
    /  /::\        /  /\         /  /\         /  /\         /  /\          ___
   /  /:/\:\      /  /::\       /  /:/        /  /:/_       /  /::\        /  /\
  /  /:/  \:\    /  /:/\:\     /  /:/        /  /:/ /\     /  /:/\:\      /  /:/
 /__/:/ \__\:|  /  /:/  \:\   /  /:/  ___   /  /:/ /:/_   /  /:/~/:/     /  /:/
 \  \:\ /  /:/ /__/:/ \__\:\ /__/:/  /  /\ /__/:/ /:/ /\ /__/:/ /:/___  /  /::\
  \  \:\  /:/  \  \:\ /  /:/ \  \:\ /  /:/ \  \:\/:/ /:/ \  \:\/:::::/ /__/:/\:\
   \  \:\/:/    \  \:\  /:/   \  \:\  /:/   \  \::/ /:/   \  \::/~~~~  \__\/  \:\
    \  \::/      \  \:\/:/     \  \:\/:/     \  \:\/:/     \  \:\           \  \:\
     \__\/        \  \::/       \  \::/       \  \::/       \  \:\           \__\/
                   \__\/         \__\/         \__\/         \__\/

	         Digitalocean Certificate Letsencrypt Generator

```

## Description
**docert** is certbot helper script for generating letsencrypt using digitalocean plugin. It can be usefull for automation or manual creation. Personally we use this for generating ssl letsencrypt certificate on development.

## How to use
Using this script is quite simple, but required docker. We already used this on Mac or Linux.
1. Clone this repository, then build your docker image.
```
cd docert
docker build -t devboxid/docert:latest .
```
2. [Generate](https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/) your digitalocean personal access token.
3. Save in `./secrets/config.ini` same as your working/cloned repository.
```
## config.ini
dns_digitalocean_token = deb15a2a06**************************************
```
4. If you change tag docker build in step-1. Don't forget to change docker tag in [docert.sh](./docert.sh#L3)
5. Run it.
```
./docert.sh

+-----------------------------------+
|  TASK    |   TASK USAGE FOR       |
+-----------------------------------+
|   list   |   list certificate     |
|   new    |   create certificate   |
|   renew  |   renew certificate    |
+-----------------------------------+

Type your task :
```
