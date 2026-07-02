#!/bin/bash
set -e

FTP_PASS=$(cat /run/secrets/ftp_password)

if ! id -u "$FTP_USER" >/dev/null 2>&1; then
    echo "Creating FTP user: $FTP_USER"
    adduser --disabled-password  --gecos "" "$FTP_USER"
    echo "$FTP_USER:$FTP_PASS" | chpasswd
fi

chown -R "$FTP_USER:$FTP_USER" /var/www/wordpress

exec "$@"
