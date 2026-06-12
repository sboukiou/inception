FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq
RUN apt-get install -y --no-install-recommends php7.4-fpm \
	curl \
	php7.4-mysql \
	mariadb-client \
	ca-certificates \

RUN rm -rf /var/lib/apt/lists/*	

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&&  chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php7.4/fpm/pool.d/www.conf
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/loca/bin/setup.sh

WORKDIR /var/www/wordpress
EXPOSE 9000

ENTRYPOINT ["/usr/loca/bin/setup.sh"]
