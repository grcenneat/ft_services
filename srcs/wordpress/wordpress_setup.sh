# chown -R www-data /var/www/*
chmod -R 755 /var/www/*

mkdir -p /var/www/html
touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

# openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Gaepo/O=42seoul/OU=jakang/CN=localhost" -keyout /etc/ssl/private/localhost.dev.key -out /etc/ssl/certs/localhost.dev.crt
# chmod 600 /etc/ssl/private/localhost.dev.key /etc/ssl/certs/localhost.dev.crt

mkdir -p /etc/nginx/sites-available/
mkdir -p /etc/nginx/sites-enabled/
# mv /usr/sbin/default.conf /etc/nginx/sites-available/default
# ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# chown -R www-data:www-data /var/www/html/wordpress

# service nginx start
# /etc/init.d/nginx start
# service php7.3-fpm start
# tail -f /dev/null

mysql -hmysql -Dwordpress -uuser -ppass < /run/nginx/wordpress.sql