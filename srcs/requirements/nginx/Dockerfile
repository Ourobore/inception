ARG ALPINE_VERSION=3.13

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	nginx \
	openrc \
	openssl

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add nginx default \
	&& mkdir /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT ["/bin/sh"]