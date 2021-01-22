#!/bin/sh

# ssl configuration
mkdir -p /etc/nginx/ssl
openssl req -new -x509 -nodes -newkey rsa:4096 -keyout localhost-nginx.key -out localhost-nginx.crt -days 365 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/CN=localhost"
mv localhost-nginx.key /etc/nginx/ssl
mv localhost-nginx.crt /etc/nginx/ssl


mkdir -p /run/nginx
mkdir -p /usr/share/nginx/html
echo "<h1>THIS IS FT_SERVICES INDEX.HTML PAGE</h1>" >> /usr/share/nginx/html/index.html

/usr/sbin/nginx -g "daemon off;"