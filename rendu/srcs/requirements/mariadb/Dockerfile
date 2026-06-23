FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq &&\ 
	apt-get install -y --no-install-recommends mariadb-server && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB-Server"

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY ./tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]
