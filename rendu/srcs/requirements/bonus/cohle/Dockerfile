FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq \
	&& apt-get install -yqq --no-install-recommends nginx \
	&&  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/cohle

RUN chown -R www-data:www-data /var/www/cohle && \
    chmod -R 755 /var/www/cohle

COPY config/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/index.html /var/www/cohle


EXPOSE 8081


ENTRYPOINT ["nginx", "-g", "daemon off;"]
