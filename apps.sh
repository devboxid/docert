#!/usr/bin/env sh

cli_banner(){
cat << "EOF"

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

EOF
}

cli_help(){
cat << "EOF"

   --help 	printing this options
   --list	list certificate
   --new	create certificate
   --renew 	renew certificate

EOF
}

# main script

cli_banner

case $1 in

  --new|d)
    read -p 'Your New Domain : ' DOMAIN
    certbot certonly \
      --work-dir /opt/certbot \
      --logs-dir /opt/certbot \
      --config-dir /opt/certbot \
      --dns-digitalocean \
      --dns-digitalocean-propagation-seconds 10 \
      --dns-digitalocean-credentials ~/.secrets/config.ini \
      -d "$DOMAIN"
    ;;

  --renew|d)
    read -p 'Your Renew Domain : ' DOMAIN
    certbot renew \
      --work-dir /opt/certbot \
      --logs-dir /opt/certbot \
      --config-dir /opt/certbot \
      --dns-digitalocean \
      --dns-digitalocean-propagation-seconds 10 \
      --dns-digitalocean-credentials ~/.secrets/config.ini \
      --cert-name "$DOMAIN"
    ;;

  --list|d)
    certbot certificates \
      --work-dir /opt/certbot \
      --logs-dir /opt/certbot \
      --config-dir /opt/certbot
    ;;

  *)
    cli_help
    ;;
esac
