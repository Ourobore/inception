ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG MARIADB_VERSION
RUN apk update && apk add --no-cache \
    mariadb=${MARIADB_VERSION} \
    openrc

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add mariadb default \
	&& mkdir -p /run/mariadb \
    && /etc/init.d/mariadb setup 
    #&& /etc/init.d/mariadb start
    #&& rc-status default \
    #&& rc-service mariadb start

CMD ["/usr/bin/mysqld", "--datadir='/var/lib/mysql'"]

#cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'