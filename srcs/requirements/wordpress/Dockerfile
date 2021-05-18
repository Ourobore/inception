ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	curl \
	openrc \
	php \
	php-common \
    php-fpm \
    php-pdo \
    php-opcache \
    php-zip \
    php-phar \
    php-iconv \
    php-cli \
    php-curl \
    php-openssl \
    php-mbstring \
    php-tokenizer \
    php-fileinfo \
    php-json \
    php-xml \
    php-xmlwriter \
    php-simplexml \
    php-dom \
    php-pdo_mysql \
    php-pdo_sqlite \
    php-tokenizer \
    php7-pecl-redis

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

CMD ["php-fpm7", "-F"]