#!/bin/sh

cat << EOF > db-setup.sql
USE mysql;
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD' WITH GRANT OPTION;
GRANT SELECT, CREATE, INSERT, UPDATE, DELETE ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

FLUSH PRIVILEGES;
EOF