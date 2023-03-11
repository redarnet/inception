FROM debian:buster
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install apt-utils -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 php7.3-fpm php-cli php-common php7.3-mbstring php-xmlrpc php-soap php-intl php-mysql php-zip php-curl php-opcache php-readline php-xml php-gd
RUN apt-get install -y mariadb-client 

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/entrypoint.sh ./

RUN chmod +x ./entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["./entrypoint.sh"]
