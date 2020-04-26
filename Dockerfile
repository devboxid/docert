FROM alpine:latest
ENV USER=certbot
ENV UID=1017
ENV GID=1017

RUN apk update && apk add --no-cache certbot
RUN pip3 install --upgrade --no-cache-dir pip
RUN pip3 install --no-cache-dir certbot-dns-digitalocean
RUN mkdir /opt/certbot
ADD apps.sh /usr/local/bin/apps.sh
RUN chmod +x /usr/local/bin/apps.sh

RUN addgroup -g $GID -S $USER
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/opt/certbot/" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"

USER certbot

WORKDIR /opt/certbot/

ENTRYPOINT ["/usr/local/bin/apps.sh"]
