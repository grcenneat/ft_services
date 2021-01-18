FROM alpine:3.12

# install required packages
RUN apk update \
		&& apk --update --no-cache add \
        	nginx \
            openssl

# ssl configuration
RUN mkdir -p /etc/nginx/ssl
RUN cd /etc/nginx/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout localhost-nginx.key -out localhost-nginx.crt -days 365 -subj "/CN=localhost"