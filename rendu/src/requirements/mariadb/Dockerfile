FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq
RUN apt-get install --no-install-recommnds mariadb-server && rm -rf /var/lib/apt/lists/*

COPY ./cnf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY ./tools/setup.sh /usr/bin/setup.sh

WORKDIR /

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

ENTRYPOINT ["./usr/local/bin/setup.sh"]
