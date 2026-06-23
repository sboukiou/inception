FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq
RUN apt-get install -yqq --no-install-recommends nginx openssl
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/nginx/ssl
RUN openssl  req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sboukiou.42.fr/UID=sboukiou"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
