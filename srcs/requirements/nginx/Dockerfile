ARG ALPINE_VERSION=3.13

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	nginx \
	openrc

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add nginx default \
	&& mkdir /run/nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]

#ENTRYPOINT ["/bin/sh"]