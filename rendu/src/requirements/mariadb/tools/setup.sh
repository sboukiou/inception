#!/bin/bash

set -e

mkdir -p /run/mysqld
chown  mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql &

until mysqladmin ping > /dev/null 2>&1; do
	sleep 1
done


mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat /run/secrets/db_root_password)';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p "$(cat /run/secrets/db_root_password)" shutdown
exec mysqld_safe --datadir=/var/lib/mysql
