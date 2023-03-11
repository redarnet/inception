FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install nginx -y && apt-get install openssl -y && apt-get install vim -y \
&& mkdir /etc/nginx/ssl \
&& openssl req -new -x509 -nodes -keyout /etc/nginx/ssl/redarnet.42.fr.key -out /etc/nginx/ssl/redarnet.42.fr.crt \
-subj "/CN=redarnet.42.fr/C=FR/ST=IDF/L=Paris/O=Ecole42/OU=Inception" 
#&& rm /etc/nginx/sites-enabled/default \
#&& rm /etc/nginx/sites-available/default

COPY conf/redarnet.42.conf /etc/nginx/conf.d/redarnet.42.conf

EXPOSE 443

# Il ne peut y avoir qu'un seul CMD par Dockerfile
CMD ["nginx", "-g", "daemon off;"]

