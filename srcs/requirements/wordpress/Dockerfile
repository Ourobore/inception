ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Installing tools and wordpress extensions
RUN apk update && apk add --no-cache \
	curl \
	openrc \
    #php \
    #php-phar \
    php-fpm \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-json \
    php-mbstring \
    php-mysqli \
    php-sodium \
    php-openssl \
    php-xml \
    php-zip

# Installing wordpress
ARG WORDPRESS_VERSION
RUN curl -Lo wordpress_archive https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& tar -xzf wordpress_archive \
	&& rm wordpress_archive \ 
	&& mkdir -p /var/www \
	&& mv wordpress /var/www

# Setting up php-fpm
RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add php-fpm7 default \
	&& mkdir -p /run/php-fmp7

# PHP-FPM and wordpress config
COPY config/www.conf /etc/php7/php-fpm.d/
COPY config/wp\-config.php /var/www/wordpress/
COPY config/wp_cli_install.sh /

#ARG LOGIN
#ARG WP_ADMIN
#ARG WP_ADMIN_PASSWORD
#ARG WP_ADMIN_EMAIL
# Wordpress command line setup
#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    #&& chmod +x wp-cli.phar \
    #&& mv wp-cli.phar /usr/local/bin/wp
    #&& wp core install --path=/var/www/wordpress --title=Inception --url=${LOGIN}.42.fr \
    #   --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} \
    #   --admin_email=${WP_ADMIN_EMAIL} --skip-email

# Enabling php-fpm logging and script exec rights
RUN echo "error_log = /var/log/php7/error.log" >> /etc/php7/php.ini \
    && ln -sf /dev/stderr /var/log/php7/access.log \
    && ln -sf /dev/stderr /var/log/php7/error.log \
    && chmod +x /wp_cli_install.sh

CMD ["php-fpm7", "--nodaemonize"]