ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG NGINX_VERSION
RUN apk update && apk add --no-cache \
	nginx=${NGINX_VERSION} \
	openrc \
	openssl

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add nginx default \
	&& mkdir -p /run/nginx /etc/nginx/sites-enabled /var/www

RUN openssl req -x509 -nodes -days 90 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=IdF/L=Paris/O=42/OU=Inception/CN=localhost" 
	#&& openssl dhparam -out /etc/ssl/certs/nginx-dhkey.pem 4096

COPY config/nginx.conf /etc/nginx/
COPY config/localhost.conf /etc/nginx/sites-available/localhost

RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]