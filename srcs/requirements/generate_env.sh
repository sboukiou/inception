#!/bin/bash

DOMAIN_NAME=sboukiou.42.fr

echo "DOMAIN_NAME=$DOMAIN_NAME" > srcs/.env

echo "Login:"
read USER
echo "USER=$USER" >> srcs/.env
echo "FTP_USER=$USER" >> srcs/.env

echo "Mysql database name?"
read MYSQL_DATABASE
echo "MYSQL_DATABASE=$MYSQL_DATABASE" >> srcs/.env

echo "Mysql User?"
read MYSQL_USER
echo "MYSQL_USER=$MYSQL_USER" >> srcs/.env

echo "Wp admin user:"
read WP_ADMIN_USER
echo "WP_ADMIN_USER=$WP_ADMIN_USER" >> srcs/.env

echo "Wp admin email:"
read WP_ADMIN_EMAIL
echo "WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL" >> srcs/.env

echo "Wp user:"
read WP_USER
echo "WP_USER=$WP_USER" >> srcs/.env

echo "Wp email:"
read WP_EMAIL
echo "WP_EMAIL=$WP_EMAIL" >> srcs/.env

# Secrets
mkdir -p secrets

echo "DB user password:"
read -s DB_PASSWORD
echo "$DB_PASSWORD" > secrets/db_password.txt

echo "DB root password:"
read -s DB_ROOT_PASSWORD
echo "$DB_ROOT_PASSWORD" > secrets/db_root_password.txt

echo "WordPress admin password:"
read -s WP_ADMIN_PASSWORD
echo "$WP_ADMIN_PASSWORD" > secrets/wp_admin_password.txt

echo "WordPress user password:"
read -s WP_PASSWORD
echo "$WP_PASSWORD" > secrets/wp_password.txt

echo "Adminer password:"
read -s ADMINER_PASSWORD
echo "$ADMINER_PASSWORD" > secrets/adminer_password.txt

echo "Done. .env and secrets/ are ready."
