#!/bin/sh

# Necessary packages
apk add --no-cache \
    php \
    php-phar

# Wordpress CLI installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Wordpress installation
wp core install --path=/var/www/wordpress --title=Inception --url=${LOGIN}.42.fr \
    --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} --skip-email

# Removing ENV variables and script
unset LOGIN WP_ADMIN WP_ADMIN_PASSWORD WP_ADMIN_EMAIL
rm wp_cli_install.sh