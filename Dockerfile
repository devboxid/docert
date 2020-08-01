FROM python:3-slim

ADD apps.sh /usr/local/bin/apps.sh
RUN pip install --no-cache-dir certbot certbot-dns-digitalocean && \
    chmod +x /usr/local/bin/apps.sh 

WORKDIR /opt/certbot/

ENTRYPOINT ["/usr/local/bin/apps.sh"]
