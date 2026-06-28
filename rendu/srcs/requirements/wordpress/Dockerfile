FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq
RUN apt-get install -y --no-install-recommends php7.4-fpm \
	curl \
	php7.4-mysql \
	mariadb-client \
	ca-certificates

WORKDIR /var/www/wordpress
RUN rm -rf /var/lib/apt/lists/*	
RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&&  chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["php-fpm7.4", "-F"]
