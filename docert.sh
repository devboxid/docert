#!/usr/bin/env bash

DOCERT="docker run --rm -ti -v $(pwd)/.secrets/:/root/.secrets/ -v $(pwd)/certbot/:/opt/certbot/ devboxid/docert"
COMMAND="$1"

cli_help(){
cat << "EOF"

+-----------------------------------+
|  TASK    |   TASK USAGE FOR       |
+-----------------------------------+
|   list   |   list certificate     |
|   new    |   create certificate   |
|   renew  |   renew certificate    |
+-----------------------------------+

EOF
}

if [[ ! -z "$COMMAND" ]]; then
  if [[ "$COMMAND" != "list" ]] || [[ "$COMMAND" != "new" ]] || [[ "$COMMAND" != "renew" ]]; then
    cli_help
  fi
else
  cli_help
  read -p 'Type your task : ' TASK
  clear
  $DOCERT "--$TASK"
fi

# change permission on generated certificate
sudo chown -R "$USER" certbot
