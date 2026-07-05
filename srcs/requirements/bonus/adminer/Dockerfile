FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    php7.4-fpm \
    php7.4-mysql \
    apache2-utils \
	 ca-certificates \
    curl \
    wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php


COPY ./config/adminer.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

WORKDIR /var/www/html

EXPOSE 8090

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["php-fpm7.4", "-F"]
