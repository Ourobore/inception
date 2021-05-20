ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

COPY config/docker-entrypoint.sh /

ARG MARIADB_VERSION
RUN apk update && apk add --no-cache \
    mariadb=${MARIADB_VERSION} \
    mariadb-client=${MARIADB_VERSION} \
    && mysql_install_db --user=root --datadir=/var/lib/mysql
    #openrc \
   # && mkdir -p /run/mysqld \
    #&& chmod +x docker-entrypoint.sh \
    #&& openrc default \
    #&& rc-service mariadb setup \
    #&& rc-status default \
    #&& rc-service mariadb start \
    #&& mariadb -e "CREATE DATABASE ${MYSQL_DATABASE}" \
    #&& mariadb -e "CREATE USER '${MYSQL_USER}'@'mariadb' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
    #&& mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'mariadb' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    #&& rc-service mariadb stop
    #&& mkdir -p /run/mysqld /etc/mysql /var/log/mysql \
    #&& chown -R mysql:mysql /etc/mysql /var/log/mysql
    #mariadb-openrc \
    #openrc \
    #&& mkdir -p /run/mariadb 
    #&& /etc/init.d/mysql setup \
    #&& /etc/init.d/mysql start


#RUN mysql_install_db --user=root --datadir=/var/lib/mysql \
#    && mkdir -p run/mysqld \
#    && /usr/bin/mysqld --datadir=/var/lib/mysql \
#    && chown -R mysql:mysql /var/lib/mysql

#RUN mkdir -p /run/openrc \
#	&& touch /run/openrc/softlevel \
#	&& rc-update add mariadb default \
#	&& mkdir -p /run/mariadb

#RUN rc-service mariadb start \
#    && mysql_install_db --user=root --datadir=/var/lib/mysql

#RUN rc-status default \
 #   && rc-service mariadb start \
 #   && mysql -e "CREATE USER '${MYSQL_USER}'@'mariadb' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
#	&& mysql -e "CREATE DATABASE ${MYSQL_DATABASE}" \
#	&& mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'mariadb' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#RUN mysql_install_db --user=root --datadir=/var/lib/mysql


#CMD ["tail", "-f"]

#ENTRYPOINT ["sh", "./docker-entrypoint.sh"]

CMD ["/usr/bin/mysqld_safe", "--user=root"]

#cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'