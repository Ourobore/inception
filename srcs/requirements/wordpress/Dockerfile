ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Installing tools and wordpress extensions
RUN apk update && apk add --no-cache \
	curl \
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
#RUN mkdir -p /run/openrc \
#	&& touch /run/openrc/softlevel \
#	&& rc-update add php-fpm7 default \
#	&& mkdir -p /run/php-fmp7

# PHP-FPM and wordpress config
COPY config/www.conf /etc/php7/php-fpm.d/
COPY config/wp\-config.php /var/www/wordpress/
COPY config/wp_cli_install.sh /

# Enabling php-fpm logging and script exec rights
RUN echo "error_log = /var/log/php7/error.log" >> /etc/php7/php.ini \
    && ln -sf /dev/stderr /var/log/php7/access.log \
    && ln -sf /dev/stderr /var/log/php7/error.log \
    && chmod +x /wp_cli_install.sh

ENTRYPOINT ["/bin/sh", "wp_cli_install.sh"]

CMD ["php-fpm7", "--nodaemonize"]