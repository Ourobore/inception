ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk install --no-cache \
	curl \
	php-fpm

ARG WORDPRESS_VERSION
RUN curl -LO wordpress_archive https://wordpress.org/wordpress-${WORDPRESS_VERSION}}.tar.gz \
	&& tar -xzvf wordpress_archive \
	&& rm wordpress_archive \
	&& mv wordpress /var/www/
