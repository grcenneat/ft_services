FROM alpine:3.12

# install required packages
RUN apk update \
		&& apk --update --no-cache add \
        	nginx \
            openssl

# ssl configuration
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout localhost-nginx.key -out localhost-nginx.crt -days 365 -subj "/CN=localhost"
RUN mv localhost-nginx.key /etc/nginx/ssl
RUN mv localhost-nginx.crt /etc/nginx/ssl

# default.conf
RUN mkdir -p /run/nginx
RUN mkdir -p /usr/share/nginx/html
RUN echo "THIS IS FT_SERVICES INDEX.HTML PAGE" >> /usr/share/nginx/html/index.html
COPY ./default.conf /etc/nginx/conf.d/

EXPOSE 80 443