#!/bin/bash

mkdir -p /var/ftp
mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs
# create user's home directory
mkdir -p /var/ftp/user

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KO/ST=Seoul/L=Gaepodong/O=42Seoul/CN=ft_services"	-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

adduser -D $FTP_USER -h /var/ftp/user
chown $FTP_USER:$FTP_USER /var/ftp/user
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

vsftpd /etc/vsftpd/vsftpd.conf