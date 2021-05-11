ARG ALPINE_VERSION=3.13

FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add --no-cache \
	nginx \
	openrc

<<<<<<< HEAD
#RUN mkdir -p /run/openrc \
#	&& touch /run/openrc/softlevel \
#	&& rc-update add nginx default \
#	&& mkdir /run/nginx

#EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
=======
RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add nginx default \
	&& mkdir /run/nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]

#ENTRYPOINT ["/bin/sh"]
>>>>>>> ea9f18e9399f774c601455675e460eb69d30edff
