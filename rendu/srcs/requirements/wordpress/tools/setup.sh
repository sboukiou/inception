#!/bin/bash

set -e

until mysqladmin ping -h mariadb --silent; do
	sleep 2
done

# Checking if the name has admin keyword


if echo "${WP_ADMIN_USER}" | grep -iq "admin"; then
	echo "ERROR: WP_ADMIN_USER must not contain 'admin' or 'administrator'."
	exit 1
fi

if [ ! -f "wp-config.php" ]; then
	wp core download --allow-root
	wp config create \
		--dbname="${MYSQL_DATABASE}" \
		--dbuser="${MYSQL_USER}" \
		--dbpass="$(cat /run/secrets/db_password)" \
		--dbhost="mariadb:3306" \
		--allow-root
	wp core install \
		--url="https://${DOMAIN_NAME}" \
		--title="inception" \
		--admin_user="${WP_ADMIN_USER}" \
		--admin_password="$(cat /run/secrets/wp_admin_password)" \
		--admin_email="${WP_ADMIN_EMAIL}" \
		--skip-email \
		--allow-root
	wp user create \
		"${WP_USER}" "${WP_EMAIL}" \
		--user_pass="$(cat /run/secrets/wp_password)" \
		--role=author \
		--allow-root
fi


chown -R www-data:www-data /var/www/wordpress

exec "$@"
