FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server mariadb-client
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/mariadb-entrypoint.sh /mariadb-entrypoint.sh
#COPY conf/mariadb-entrypoint.sh /etc/mysql/mariadb-entrypoint.sh
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

Run service mysql start
RUN chmod +x ./mariadb-entrypoint.sh
EXPOSE 3306
ENTRYPOINT      ["/bin/sh", "./mariadb-entrypoint.sh"]


