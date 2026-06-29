FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    redis-server \
	 ca-certificates \
    curl \
    wget && \
    rm -rf /var/lib/apt/lists/*



COPY ./config/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]
