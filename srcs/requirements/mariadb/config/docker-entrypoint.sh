#!/bin/sh

openrc default
rc-service mariadb setup
rc-service mariadb start

mariadb -e "CREATE DATABASE ${MYSQL_DATABASE}" \
mariadb -e "CREATE USER '${MYSQL_USER}'@'mariadb' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'mariadb' IDENTIFIED BY '${MYSQL_PASSWORD}';" \

rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'