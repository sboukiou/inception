FROM ubuntu:14.04

USER root
WORKDIR /etc
VOLUME /etc/vol


RUN apt update -y && apt install nginx -y

COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 80
ENV LAST_UPDATED_IMG=2026-05-15
STOPSIGNAL 9

CMD ["nginx",  "-g", "daemon off;"]
