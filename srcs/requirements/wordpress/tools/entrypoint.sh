#!/bin/bash

sleep 10

mkdir -p /var/www/html/wordpress
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html/wordpress/



# ETAPE 1: 
# - Installation de l'interface en ligne de commande de wordpress (wp-cli) afin d'intaller et configurer wordpress facilement via le ce script bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp



# ETAPE 2 :
# - Téléchargement de wordpress

wp core download --allow-root --locale=fr_FR



# ETAPE 3 :
# - Creation du fichier de configuration wp-config.php afin de configurer automatiquement wordpress (demandé dans le sujet)

if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
        wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/html/wordpress'
fi



# ETAPE 4 :
# - Configurer les info du site automatiquement (titre du site + info de l'user admin de wp)

wp core install --allow-root --url=https://redarnet.42.fr --title="Inception" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}


# ETAPE 5 :
# Creer un second user pour wordpress (demandé dans le sujet)

wp user create --allow-root ${WORDPRESS_USER_2} ${WORDPRESS_USER_2_EMAIL} --role=author --user_pass=${WORDPRESS_USER_2_MDP}



# ETAPE 6 :
# Personnalisation

wp theme install hestia --activate --allow-root
#wp post delete 1 --allow-root
wp cache flush --allow-root

# ETAPE 7 :
# - Lancer php-fpm en mode Foreground pour le lancer en premier plan : Comme ça le conteneur docker restera actif et ne s'arretera pas tant que la CMD ne retourne pas de code de sortie.
# PHP-FPM permet de faire fonctionner PHP de maniere separée : Ça permet la communication entre PHP qui est dans le conteneur wordpress et notre module FastCGI de notre server web (dans notre conteneur nginx)

mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R

