#!/bin/bash
set -e

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql

	mysqld_safe --datadir=/var/lib/mysql &

	until mysqladmin ping > /dev/null 2>&1; do
		sleep 1
	done

	mysql -e "create database if not exists \`${MYSQL_DATABASE}\`;"
	mysql -e "create user if not exists \`${MYSQL_USER}\`@'%' identified by '$(cat /run/secrets/db_password)';"
	mysql -e "grant all privileges on \`${MYSQL_DATABASE}\`.* to \`${MYSQL_USER}\`@'%';"
	mysql -e "alter user 'root'@'localhost' identified by '$(cat /run/secrets/db_root_password)';"
	mysql -e "flush privileges;"

	mysqladmin -u root -p"$(cat /run/secrets/db_root_password)" shutdown
fi

exec mysqld_safe --datadir=/var/lib/mysql
