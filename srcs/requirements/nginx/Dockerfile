ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	nginx \
	openrc \
	openssl

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add nginx default \
	&& mkdir /run/nginx

RUN openssl req -x509 -nodes -days 90 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=IdF/L=Paris/O=42/OU=Inception/CN=localhost" 
	#&& openssl dhparam -out /etc/ssl/certs/nginx-dhkey.pem 4096

COPY ./config/localhost.conf /etc/nginx/sites-available/default
COPY ./config/localhost.conf /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]

#ENTRYPOINT ["/bin/sh"]