FROM alpine:3.12.0

RUN apk update \
	&& apk --update --no-cache add \
	grafana \
	# --repository http://dl-2.alpinelinux.org/alpine/edge/community/
	--repository https://dl-cdn.alpinelinux.org/alpine/latest-stable/community/

EXPOSE 3000

COPY dashboards/ /usr/share/grafana/public/dashboards/

ENTRYPOINT ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]
