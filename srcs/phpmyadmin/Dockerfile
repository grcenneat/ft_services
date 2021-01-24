FROM alpine:3.12

RUN apk update

RUN apk add --no-cache nginx php7 php7-fpm php7-mbstring php7-session php7-common \
	php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap \
	php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom openssl
		
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN tar -xvf /phpMyAdmin-4.9.5-all-languages.tar.gz
RUN rm -f /phpMyAdmin-4.9.5-all-languages.tar.gz
RUN mv /phpMyAdmin-4.9.5-all-languages /var/www/phpmyadmin
RUN rm -rf /var/cache/apk/*

## phpmyadmin ssl을 위한 코드
# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/pma.key -out /etc/nginx/pma.crt -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=localhost"
##

COPY default.conf /etc/nginx/conf.d/
COPY config.inc.php /var/www/phpmyadmin/config.inc.php
RUN chmod 705 /var/www/phpmyadmin/config.inc.php
RUN mkdir -p /run/nginx
							
EXPOSE 5000

CMD php-fpm7 \
	&& nginx -g "daemon off;"
