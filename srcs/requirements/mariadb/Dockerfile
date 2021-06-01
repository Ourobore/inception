ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# Installing services
ARG MARIADB_VERSION
RUN apk update && apk add --no-cache \
    openrc \
    mariadb-openrc \
    mariadb=${MARIADB_VERSION} \
    mariadb-client=${MARIADB_VERSION}

# Database setup script and mariadb config
COPY config/db-setup.sh /
COPY config/mariadb-server.cnf /etc/my.cnf.d/

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ADMIN
ARG MYSQL_ADMIN_PASSWORD

# Setting up the database
RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add mariadb default \
	&& mkdir -p /run/mariadb \
    && rc-status \
    && rc-service mariadb setup \
    && rc-service mariadb start \
    && sh db-setup.sh \
    && mariadb --user=root --password=$MYSQL_ROOT_PASSWORD < db-setup.sql \
    && rm db-setup.sql db-setup.sh

#RUN mkdir -p /run/mariadb \
#	&& sh db-setup.sh \
#	&& mysql_install_db --datadir=/var/lib/mysql \
#	&& /usr/bin/mysqld --datadir=/var/lib/mysql \
#    && mariadb --user=root --password=$MYSQL_ROOT_PASSWORD < db-setup.sql \
#    && rm db-setup.sql db-setup.sh

# Enabling mysqld logging
RUN ln -sf /dev/stderr /var/lib/mysql/$(hostname).err

CMD ["/usr/bin/mysqld", "--user=root", "--datadir=/var/lib/mysql/"]