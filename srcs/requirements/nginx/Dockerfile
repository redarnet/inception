FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install nginx -y && apt-get install openssl -y && apt-get install vim -y \
&& mkdir /etc/nginx/ssl \
&& openssl req -new -x509 -nodes -keyout /etc/nginx/ssl/redarnet.42.fr.key -out /etc/nginx/ssl/redarnet.42.fr.crt \
-subj "/CN=redarnet.42.fr/C=FR/ST=IDF/L=Paris/O=Ecole42/OU=Inception" 

COPY conf/redarnet.42.conf /etc/nginx/conf.d/redarnet.42.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
