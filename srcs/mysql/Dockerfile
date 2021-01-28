FROM alpine:3.12.0

RUN apk update \
		&& apk --update --no-cache add \
			mysql mysql-client

# RUN addgroup mysql mysql

COPY ./mysql_setup.sh /usr/sbin/mysql_setup.sh
RUN chmod +x /usr/sbin/mysql_setup.sh
COPY my.cnf /etc/my.cnf
RUN chmod 644 /etc/my.cnf

EXPOSE 3306

ENTRYPOINT ["/usr/sbin/mysql_setup.sh"]
