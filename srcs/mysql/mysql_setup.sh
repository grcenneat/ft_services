#!/bin/sh

mkdir -p /run/mysqld

sleep 5
echo "\033[32minitialize MySQL database...\033[0m"
mysql_install_db --user=root > /dev/null

# create wordpress table and give permissions
echo "CREATE DATABASE IF NOT EXISTS wordpress;
        FLUSH PRIVILEGES;
        GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;
        FLUSH PRIVILEGES;" > cmd.sql
mysqld -u root --bootstrap < cmd.sql

# Invoking "mysqld" will start the MySQL server. Terminating "mysqld" will shutdown the MySQL server.
mysqld -u root