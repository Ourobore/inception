ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	curl \
	openrc \
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

ARG WORDPRESS_VERSION
RUN curl -Lo wordpress_archive https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz \
	&& tar -xzvf wordpress_archive \
	&& rm wordpress_archive \ 
	&& mkdir -p /var/www \
	&& mv wordpress /var/www

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add php-fpm7 default \
	&& mkdir -p /run/php-fmp7

COPY config/www.conf /etc/php7/php-fpm.d/
COPY config/wp\-config.php /var/www/wordpress/

RUN ln -sf /dev/stderr /var/log/fpm-access.log \
    && ln -sf /dev/stderr /var/log/fpm-error.log

CMD ["php-fpm7", "--nodaemonize"]