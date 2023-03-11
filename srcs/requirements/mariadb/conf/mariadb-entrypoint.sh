#! /bin/bash

# Start MariaDb
service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"

# Creation du user SQL_USER
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

# On donne tous les privileges a SQL_USER
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

# On remplace le root password par SQL_ROOT_PASSWORD
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

# Rechargement de la table de droit
mysql -e "FLUSH PRIVILEGES;"

# On arrete MariaDB en utilisant root privileges
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown

# On relance MariaDB
exec mysqld_safe

