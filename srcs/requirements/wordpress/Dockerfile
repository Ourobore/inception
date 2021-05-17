ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	curl \
	openrc \
	php-fpm

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

#ENTRYPOINT [ "/bin/sh" ]
EXPOSE 9000

CMD ["php-fpm7", "-F"]