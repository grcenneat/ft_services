FROM alpine:3.12.0

# install required packages
RUN apk update \
	&& apk --update --no-cache add \
	nginx \
	openssl \
	openssh-server

COPY ./nginx_setup.sh /usr/sbin/nginx_setup.sh
RUN chmod +x /usr/sbin/nginx_setup.sh
COPY ./default.conf /etc/nginx/conf.d/

EXPOSE 80 443 22

ENTRYPOINT ["/usr/sbin/nginx_setup.sh"]