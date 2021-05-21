ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG MARIADB_VERSION
RUN apk update && apk add --no-cache \
    openrc \
    mariadb-openrc \
    mariadb=${MARIADB_VERSION} \
    mariadb-client=${MARIADB_VERSION}

COPY config/db-setup.sh /
COPY config/mariadb-server.cnf /etc/my.cnf.d/

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN mkdir -p /run/openrc \
	&& touch /run/openrc/softlevel \
	&& rc-update add mariadb default \
	&& mkdir -p /run/mariadb \
    && rc-status \
    && rc-service mariadb setup \
    && rc-service mariadb start \
    && sh db-setup.sh \
    && mariadb -u root -password=$MYSQL_ROOT_PASSWORD < db-setup.sql \
    && rm db-setup.sql db-setup.sh
    #&& mariadb -e "CREATE USER '$MYSQL_USER'@'mariadb' IDENTIFIED BY '$MYSQL_PASSWORD';" \
    #&& mariadb -e "CREATE DATABASE $MYSQL_DATABASE;" \
    #&& mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'mariadb' IDENTIFIED BY '$MYSQL_PASSWORD';"

#COPY config/mariadb-server.cnf /etc/my.cnf.d/

#RUN mysql_install_db --user=root --datadir=/var/lib/mysql \
#    && mkdir -p run/mysqld \
#    && /usr/bin/mysqld --datadir=/var/lib/mysql \
#    && chown -R mysql:mysql /var/lib/mysql

#CMD ["tail", "-f"]

CMD ["/usr/bin/mysqld", "--user=root", "--datadir=/var/lib/mysql/"]

#cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'