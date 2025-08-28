FROM php:7.4-fpm

# Installer dépendances système + extensions PHP utiles pour WordPress
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y \
      mariadb-client \
      wget \
      libzip-dev \
      libpng-dev \
      libjpeg-dev \
      libfreetype6-dev \
      libxml2-dev \
      unzip && \
    docker-php-ext-install mysqli pdo pdo_mysql zip intl soap opcache && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd && \
    rm -rf /var/lib/apt/lists/*

# Copier la config PHP-FPM personnalisée
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# Copier script d'entrée
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["/entrypoint.sh"]
