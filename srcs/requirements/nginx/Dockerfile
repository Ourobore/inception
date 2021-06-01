ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Installing services and tools
ARG NGINX_VERSION
RUN apk update && apk add --no-cache \
	nginx=${NGINX_VERSION} \
	openssl

# Creating SSL certificate
RUN openssl req -x509 -nodes -days 90 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=FR/ST=IdF/L=Paris/O=42/OU=Inception/CN=localhost"
	#&& openssl dhparam -out /etc/ssl/certs/nginx-dhkey.pem 4096

# Copying nginx and server config
COPY config/nginx.conf /etc/nginx/
COPY config/localhost.conf /etc/nginx/sites-available/localhost

# Linking directory for virtual hosts
RUN mkdir -p /etc/nginx/sites-enabled /run/nginx /var/www \
	&& ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# Enabling server logging
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

CMD [ "nginx", "-g", "daemon off;" ]