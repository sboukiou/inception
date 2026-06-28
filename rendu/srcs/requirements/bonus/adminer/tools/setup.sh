#!/bin/bash

set -e


if [ ! -f /var/www/html/index.php ]; then
	echo "[INFO]: Downloading adminer ..."
	wget "https://www.adminer.org/latest.php" -O /var/www/html/index.php
fi

if [ -f /run/secrets/adminer_password ]; then
	echo "[INFO]: Generating the password for adminer ..."
	mkdir -p /etc/adminer
	htpasswd -b -B -c /etc/adminer/.htpasswd "${USER}" "$(cat /run/secrets/adminer_password)"
else
	echo "[ERROR]: Password file for adminer (/run/secrets/adminer_password.txt) was not found!"
	exit 1
fi

echo "[INFO]: Setting permissions for the /var/ww/html"

chown -R www-data:www-data  /var/www/html
chmod -R 755 /var/www/html

exec "$@"

